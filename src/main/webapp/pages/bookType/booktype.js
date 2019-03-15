define(['text!pages/bookType/booktype.html','css!pages/bookType/booktype','pages/bookType/meta','uuitree','uuigrid'],function(html) {
	var init = function(element){
		var treelistUrl = ctx+'/bookType/list';
		var treedelUrl = ctx+'/bookType/del/';
		var treesaveUrl = ctx+'/bookType/save';
		
		var viewModel = {
				app:{},
				dt1 : new u.DataTable(metaBookType),
				dtnew : new u.DataTable(metaBookType),
				refData : new u.DataTable({
                	meta: {
                    	'id': {},
                    	'name': {},
                    	'parent_id': {}
                	}
            	}),
				/* 树设置 */
				treeSetting : {
					view : {
						showLine : false,
						selectedMulti : false
					},
					callback : {
						onClick : function(e, id, node) {
							var data = viewModel.refData.getRowByField('id', node.id).getSimpleData();
                        	var parent = viewModel.refData.getRowByField('id', node.parent_id);
							treeid=[];
							viewModel.event.getAllChildren(node,treeid);
							
                        	viewModel.dt1.removeAllRows();
                        	viewModel.dt1.clear();
                        	viewModel.dt1.setSimpleData(data);
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
					loadTree:function(){
						$.ajax({
							type : 'get',
							url : treelistUrl,
							dataType : 'json',
							success : function(res) {
								if(res){
									if( res.success =='success'){
										if(res.detailMsg.data){
											viewModel.refData.removeAllRows();
											viewModel.refData.clear();
											viewModel.refData.setSimpleData(res.detailMsg.data,{unSelect:true});
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
					//新增和更新组织树
					saveTree:function(data){
						var list=viewModel.event.genDataList(data);
						$.ajax({
							type : 'post',
							url : treesaveUrl,
							dataType : 'json',
							contentType : "application/json",
							data : JSON.stringify(list),
							success : function(res) {
								if(res){
									if( res.success =='success'){
										u.messageDialog({msg: '保存成功！', btnText: '确定'});
										viewModel.event.loadTree();
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
						})
						
						},
						//删除组织树
						deleteTree: function(data) {
				        	var datalist = viewModel.event.genDataList(data);
				            var json = JSON.stringify(datalist);
				            $.ajax({
				                url: treedelUrl,
				                data: json,
				                dataType: 'json',
				                type: 'post',
				                contentType: 'application/json',
				                success: function (res) {
				                	if(res){
				                	       if (res.success == 'success') {
				                	    	   viewModel.dt1.removeRow(viewModel.dt1.getSelectedIndexs());
				                	    	   viewModel.refData.removeRow(viewModel.refData.getSelectedIndexs());
				                	    	   u.messageDialog({msg:'删除成功',title:'操作提示',btnText:'确定',
				                	    	   			closeFun:function(){
                                            				viewModel.event.loadTree()
                                        				}
				                	    	   		});
				    	                    } else {
												var msg = "";
											   if(res.success == 'fail_global'){
												   msg = res.message;
												   if(msg=='Data had been referenced,remove is forbidden!'){
													   msg='该部门含有子部门不能删除';   
												   }
											   }else{
												   for (var key in res.detailMsg) {
													   msg += res.detailMsg[key] + "<br/>";
												   }
											   }
											   u.messageDialog({msg:msg,title:'操作提示',btnText:'确定'});
				    	                    }
				                	}else{
										u.messageDialog({msg:'无返回数据',title:'操作提示',btnText:'确定'});
									}
				             
				                },
								error:function(er){
									u.messageDialog({msg:'操作请求失败，'+er,title:'操作提示',btnText:'确定'});
								}
				            });
				        },
					//页面初始化
					pageInit : function() {
						treeid=[];
						
						viewModel.app = u.createApp({
							el :element /* Document.body */,
							model : viewModel
						})

						this.loadTree();
					},
					addBookTypeClick:function(){
                        $('#code').removeAttr("readonly");
						$('#dialog_content_instit').find('.u-msg-title').html("<h4>新增图书类别</h4>");
						viewModel.event.clearDt(viewModel.dtnew);
						var row = viewModel.refData.getSelectedRows()[0];
						
						if(row){
							var parentId = row.getValue('id');
							var parentName = row.getValue('name');
						}
						
						var newr = viewModel.dtnew.createEmptyRow();
			            viewModel.dtnew.setRowSelect(newr);
			            
			            if(row){
			            	var newrow = viewModel.dtnew.getSelectedRows()[0];
			            	newrow.setValue('parent_id',parentId);
			            	newrow.setValue('parent_id_name',parentName);
			            }
						viewModel.dtnew.setValue('book_num',0);	
						
			            window.md = u.dialog({id:'add_depart',content:"#dialog_content_instit",hasCloseMenu:true});
					},
					editBookTypeClick:function(){
						$('#dialog_content_instit').find('.u-msg-title').html("<h4>编辑图书类别</h4>");
						viewModel.event.clearDt(viewModel.dtnew);
						var row = viewModel.dt1.getSelectedRows()[0];
						if(row){
							// if(row.data.parentid.value){
								// row.setValue('parentname',$("#tree2")[0]['u-meta'].tree.getNodeByParam('id',row.getValue('parentid')).name);
							// }

							viewModel.dtnew.setSimpleData(viewModel.dt1.getSimpleData({type: 'select'}));
							$('#code').attr("readonly","readonly");
							window.md = u.dialog({id:'edit_depart',content:"#dialog_content_instit",hasCloseMenu:true});
						}else{
							u.messageDialog({msg:'请选择要编辑的数据！',title:'操作提示',btnText:'确定'});
						}
					},
					delBookTypeClick:function(){
						var row = viewModel.dt1.getSelectedRows()[0];
						if(row){
							var data = viewModel.dt1.getSelectedRows()[0].getSimpleData();
							u.confirmDialog({
					            msg: "是否删除"+data.name+"?",
					            title: "删除确认",
					            onOk: function () {
					                viewModel.event.deleteTree(data);
					            },
					            onCancel: function () {
					            }
							});
						}else{
							u.messageDialog({msg:'请选择要删除的数据！',title:'操作提示',btnText:'确定'});
						}
					},
					saveBookTypeClick:function(){
						var data = viewModel.dtnew.getSelectedRows()[0].getSimpleData();
	                    if (!viewModel.app.compsValidate($('#dialog_content_instit')[0])) {
	                        return;
	                    }
                        viewModel.event.saveTree(data);
					},
					cancelBookTypeClick:function(){
							md.close();
					},
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
