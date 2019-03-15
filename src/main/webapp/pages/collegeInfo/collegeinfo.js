define(['text!pages/collegeInfo/collegeinfo.html','css!pages/collegeInfo/collegeinfo','pages/collegeInfo/meta','uuitree','uuigrid'],function(html) {
	var init = function(element){
		var treelistUrl = ctx+'/collegeType/list';
		
		var tablelistUrl = ctx+'/collegeInfo/list';
		var tabledelUrl = ctx+'/collegeInfo/del/';
		var tablesaveUrl = ctx+'/collegeInfo/save';
		var tableAuthorizationUrl = ctx+'/collegeInfo/loginAuthorization'; 
		
		var viewModel = {
				app:{},
				/* 数据模型 */
				draw:1,
				totlePage:0,
				pageSize:5,
				totleCount:0,
				dt1 : new u.DataTable(metaCollegeInfo),
				dtnew : new u.DataTable(metaCollegeInfo),
				refdata : new u.DataTable(metaCollegeType),
				
				/* 树设置 */
				treeSetting : {
					view : {
						showLine : false,
						selectedMulti : false
					},
					callback : {
						onClick : function(e, id, node) {
							treeid=[];
							viewModel.event.getAllChildren(node,treeid);
						   	var pid = node.parent_id;
						   	viewModel.event.loadTelcollege(treeid);
						}
					}
				
				},
				event:{
					
	                //清除datatable数据
	                clearDt: function (dt) {
	                	dt.removeAllRows();
	                	dt.clear();
	                },
					
					/* 获得树节点的所有子节点 */
					getAllChildren:function(node,childrenlist){
						childrenlist.push(node.id)
						if(node.children){
							var i;
							for(i=0;i<node.children.length;i++){
								viewModel.event.getAllChildren(node.children[i],childrenlist);
							}
						}
					},

					loadTelcollege:function(collegeTypeIds){
						var jsonData={
								pageIndex:viewModel.draw-1,
								pageSize:viewModel.pageSize,
							};
						/*右表的上面详细信息显示*/
						var infoDiv = document.getElementById('infoPanel');
						var dtVal = viewModel.refdata.getValue('name');
						infoDiv.innerHTML = dtVal;
						//end
						$(element).find("#search").each(function(){
							if(this.value == undefined || this.value =='' || this.value.length ==0 ){
								//不执行操作
							}else{
								jsonData['search_searchParam'] =  this.value.replace(/(^\s*)|(\s*$)/g, "");  //去掉空格
							}
						});
						if(collegeTypeIds){
							if(collegeTypeIds!=''||collegeTypeIds.length!=0){
								jsonData['search_collegeTypeIds'] = collegeTypeIds.join();
							}
						}
						$.ajax({
							type : 'get',
							url : tablelistUrl,
							dataType : 'json',
							data:jsonData,
							contentType: 'application/json;charset=utf-8',
							success : function(res) {
								if(res){
									if( res.success =='success'){
										if(!res.detailMsg.data){
											viewModel.totleCount=0;
											viewModel.totlePage=1;
											viewModel.event.comps.update({totalPages:viewModel.totlePage,pageSize:viewModel.pageSize,currentPage:viewModel.draw,totalCount:viewModel.totleCount});
											viewModel.dt1.removeAllRows();
											viewModel.dt1.clear();
										}else{
											viewModel.totleCount=res.detailMsg.data.totalElements;
											viewModel.totlePage=res.detailMsg.data.totalPages;
											viewModel.event.comps.update({totalPages:viewModel.totlePage,pageSize:viewModel.pageSize,currentPage:viewModel.draw,totalCount:viewModel.totleCount});
											viewModel.dt1.removeAllRows();
											viewModel.dt1.clear();
											viewModel.dt1.setSimpleData(res.detailMsg.data.content,{unSelect:true});
										}
									}else{
										var msg = "";
										if(res.success == 'fail_global'){
											msg = res.message;
										}else{
											for (var key in res.detailMsg) {
												msg += res.detailMsg[key] + "<br/>";
											}
										}
										u.messageDialog({msg:msg,title:'请求错误',btnText:'确定'});									
									}
								}else{
									u.messageDialog({msg:'后台返回数据格式有误，请联系管理员',title:'数据错误',btnText:'确定'});
								}

							},
							error:function(er){
								u.messageDialog({msg:'请求超时',title:'请求错误',btnText:'确定'});
							}
						})
					},
					loadTree:function(){
						$.ajax({
							type : 'get',
							url : treelistUrl,
							dataType : 'json',
							success : function(res) {
								if(res){
									if( res.success =='success'){
										if(res.detailMsg.data){
											viewModel.refdata.removeAllRows();
											viewModel.refdata.clear();
											viewModel.refdata.setSimpleData(res.detailMsg.data,{unSelect:true});
	                                        $("#tree2")[0]['u-meta'].tree.expandAll(true);
										}
									}else{
										var msg = "";
										if(res.success == 'fail_global'){
											msg = res.message;
										}else{
											for (var key in res.detailMsg) {
												msg += res.detailMsg[key] + "<br/>";
											}
										}
										u.messageDialog({msg:msg,title:'请求错误',btnText:'确定'});									
									}
								}else{
									u.messageDialog({msg:'后台返回数据格式有误，请联系管理员',title:'数据错误',btnText:'确定'});
								}

							},
							error:function(er){
								u.messageDialog({msg:'请求超时',title:'请求错误',btnText:'确定'});
							}
						})
					},
					//组装list
					genDataList:function(data){
						var datalist = [];
						datalist.push(data);
						return datalist ;
					},

				        //更新和保存学生信息
				        saveCollege:function(data){
							var list=viewModel.event.genDataList(data);
							$.ajax({
								type : 'post',
								url : tablesaveUrl,
								dataType : 'json',
								contentType : "application/json",
								data : JSON.stringify(list),
								success : function(res) {
									if(res){
										if( res.success =='success'){
											u.messageDialog({msg: '保存成功！', btnText: '确定'});
											viewModel.event.loadTelcollege(treeid);
											md.close();
										}else{
											var msg = "";
											if(res.success == 'fail_global'){
												msg = res.message;
											}else{
												for (var key in res.detailMsg) {
													msg += res.detailMsg[key] + "<br/>";
												}
											}
											u.messageDialog({msg:msg,title:'操作提示',btnText:'确定'});
										}
									}else{
										u.messageDialog({msg:'没有返回数据',title:'操作提示',btnText:'确定'});
									}
								}
							});
				        },
				        //删除学生
				        delCollege:function(data){
							var list=viewModel.event.genDataList(data);
							$.ajax({
								type : 'post',
								url : tabledelUrl,
								dataType : 'json',
								contentType : "application/json",
								data : JSON.stringify(list),
								success : function(res) {
									if( res.success =='success'){
										u.messageDialog({msg: '删除成功！', btnText: '确定'});
										 //md.close();
									}else{
										u.messageDialog({msg: '删除失败！', btnText: '确定'});
									}
								}
							})
				        },
				        //学生登录授权
				        loginAuthorization:function(data){
							var list=viewModel.event.genDataList(data);
							$.ajax({
								type : 'post',
								url : tableAuthorizationUrl,
								dataType : 'json',
								contentType : "application/json",
								data : JSON.stringify(list),
								success : function(res) {
									if( res.success =='success'){
										u.messageDialog({msg: '登录授权成功！', btnText: '确定'});
										 //md.close();
									}else{
										u.messageDialog({msg: '登录授权失败！', btnText: '确定'});
									}
								}
							})
				        },
				    //分页相关
					pageChange:function(){
						viewModel.event.comps.on('pageChange', function (pageIndex) {
							viewModel.draw = pageIndex + 1;
							viewModel.event.loadTelcollege(treeid);
						});
					},
					sizeChange:function(){
						viewModel.event.comps.on('sizeChange', function (arg) {
							viewModel.pageSize = parseInt(arg);
							viewModel.draw = 1;
							viewModel.event.loadTelcollege(treeid);
						});
					},
					
					//页面初始化
					pageInit : function() {
						treeid=[];
						
						viewModel.app = u.createApp({
							el :element /* Document.body */,
							model : viewModel
						})

						//分页初始化	
						var paginationDiv = $(element).find('#pagination')[0];
						this.comps=new u.pagination({el:paginationDiv,jumppage:true});
						this.comps.update({pageSize: 5 });  //默认每页显示5条数据
						this.loadTree();
						viewModel.event.pageChange();
						viewModel.event.sizeChange();	
						
	                    //回车搜索
	                    $('.input_enter').keydown(function(e){
	                        if(e.keyCode==13){
	                        	viewModel.event.searchClick()
	                        	u.stopEvent(e);
	                        }
	                    });
					
					},
					addCollegeClick:function(){
						$('#dialog_content_college').find('.u-msg-title').html("<h4>新增学生</h4>");
						$('#add_name').attr("disabled",false);
						$('#add_code').attr("disabled",false);
						viewModel.event.clearDt(viewModel.dtnew);
						var row = viewModel.refdata.getSelectedRows()[0];
						if(row){
							var id = row.getValue('id');
							var name = row.getValue('name');
							var newr = viewModel.dtnew.createEmptyRow();
							viewModel.dtnew.setRowSelect(newr);
							var newrow = viewModel.dtnew.getSelectedRows()[0];
							newrow.setValue('pk_collegetype',id);
							newrow.setValue('collegetype_name',name);
							newrow.setValue('login_status','未授权');
							window.md = u.dialog({id:'add_college',content:"#dialog_content_college",hasCloseMenu:true});
						}else{
							u.messageDialog({msg:'请选择学院类别！',title:'操作提示',btnText:'确定'});
						}
					},
					editCollegeClick:function(){
						$('#dialog_content_college').find('.u-msg-title').html("<h4>编辑学生</h4>");
						$('#add_name').attr("disabled",true);
						$('#add_code').attr("disabled",true);
						viewModel.event.clearDt(viewModel.dtnew);
						var row = viewModel.dt1.getSelectedRows()[0]
						if(row){
							viewModel.dtnew.setSimpleData(viewModel.dt1.getSimpleData({type: 'select'}));
							window.md = u.dialog({id:'edit_college',content:"#dialog_content_college",hasCloseMenu:true});
						}else{
							u.messageDialog({msg:'请选择要编辑的学生！',title:'操作提示',btnText:'确定'});
						}
					},
					delCollegeClick:function(){
						var row = viewModel.dt1.getSelectedRows()[0];
						if(row){
							var data = viewModel.dt1.getSelectedRows()[0].getSimpleData()
							u.confirmDialog({
					            msg: "是否删除"+data.name+"?",
					            title: "删除确认",
					            onOk: function () {
					                viewModel.event.delCollege(data);
					                viewModel.dt1.removeRow(viewModel.dt1.getSelectedIndexs());
					            },
					            onCancel: function () {
					            }
							});
						}else{
							u.messageDialog({msg:'请选择要删除的学生！',title:'操作提示',btnText:'确定'});
						}
					},
					loginAuthorizationClick:function(){
						var row = viewModel.dt1.getSelectedRows()[0];
						if(row){
							var data = viewModel.dt1.getSelectedRows()[0].getSimpleData()
							u.confirmDialog({
					            msg: "是否要为"+data.name+"登录授权?",
					            title: "登录授权确认",
					            onOk: function () {
					                viewModel.event.loginAuthorization(data);
					                viewModel.dt1.removeRow(viewModel.dt1.getSelectedIndexs());
					            },
					            onCancel: function () {
					            }
							});
						}else{
							u.messageDialog({msg:'请选择要授权的学生！',title:'操作提示',btnText:'确定'});
						}
					},
					saveCollegeClick:function(){
						var data = viewModel.dtnew.getSelectedRows()[0].getSimpleData();
	                    if (!viewModel.app.compsValidate($('#add-form')[0])) {
	                        return;
	                    }
                        viewModel.event.saveCollege(data);
					},
					cancelCollegeClick:function(){
							md.close();
					},
					searchClick:function(){
						viewModel.draw = 1; 
						viewModel.event.loadTelcollege(treeid);
					}
				}
			};
		$(element).html(html) ;
		viewModel.event.pageInit();
		if(u.isIE8){
			$('.ie8-bg').css('display','block');
		}
	}
	
	return {
		'template': html,
        init:init
	}
});
