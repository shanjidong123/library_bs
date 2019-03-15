define(['text!pages/bookBorrow/bookborrow.html','css!pages/bookBorrow/bookborrow','pages/bookBorrow/meta','uuitree','uuigrid'],function(html) {
	var init = function(element){
		var treelistUrl = ctx+'/bookType/list';
		
		var tablelistUrl = ctx+'/bookInfo/list';
		var tablebackUrl = ctx+'/bookBorrow/backBook/';
		var tablebackUrl2 = ctx+'/bookBorrow/timeoutBackBook/';
		var tablesaveUrl = ctx+'/bookBorrow/borrow';
	
		var viewModel = {
				app:{},
				/* 数据模型 */
				draw:1,
				totlePage:0,
				pageSize:5,
				totleCount:0,
				dt1 : new u.DataTable(metaBookInfo),
				refdata : new u.DataTable(metaBookType),
				refStaybackdata : new u.DataTable(metaBookStayback),
				refTimeoutdata : new u.DataTable(metaBookTimeout),
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
						   	viewModel.event.loadTelbook(treeid);
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
					
					//更新超时时长
				        updateTimeout:function(){
							$.ajax({
								type : 'GET',
								url : ctx + '/bookBorrow/updateTimeout',
								dataType : 'json',
								contentType : "application/json",
								success : function(res) {
									if( res.success =='success'){
										
									}else{
										
									}
								}
							})
				        },
					
					//以下用于check checkbox
                	afterAdd: function (element, index, data) {
                    	if (element.nodeType === 1) {
                        	u.compMgr.updateComp(element);
                    	}
                	},
					
					loadTelbook:function(bookTypeIds){
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
						if(bookTypeIds){
							if(bookTypeIds!=''||bookTypeIds.length!=0){
								jsonData['search_bookTypeIds'] = bookTypeIds.join();
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

				        //借阅图书
				        saveBook:function(data){
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
											u.messageDialog({msg: '借阅成功,请于三天内归还!', btnText: '确定'});
											viewModel.event.loadTelbook(treeid);
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
				        //归还图书
				        backBook:function(id){
				        	var jsonData = {};
				        	jsonData['search_pk'] = id;
							$.ajax({
								type : 'GET',
								url : tablebackUrl,
								dataType : 'json',
								contentType : "application/json",
								data : jsonData,
								success : function(res) {
									if( res.success =='success'){
										u.messageDialog({msg: '归还成功!', btnText: '确定'});
									}else{
										u.messageDialog({msg: '归还失败!', btnText: '确定'});
									}
								}
							})
				        },
				        //超时归还图书
				        backBook2:function(id){
				        	var jsonData = {};
				        	jsonData['search_pk'] = id;
							$.ajax({
								type : 'GET',
								url : tablebackUrl2,
								dataType : 'json',
								contentType : "application/json",
								data : jsonData,
								success : function(res) {
									if( res.success =='success'){
										u.messageDialog({msg: '归还成功,请前往缴纳罚款!', btnText: '确定'});
									}else{
										u.messageDialog({msg: '归还失败!', btnText: '确定'});
									}
								}
							})
				        },
				        
				//待归还图书
                stayBack: function () {
                    $('#tree-title').html("待归还");
                    var jsonData = {};
                    $.ajax({
                        type: "GET",
                        url: ctx + '/bookBorrow/staybackList',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        data: jsonData,
                        success: function (res) {
                            if (res) {
                                viewModel.refStaybackdata.setSimpleData(res.detailMsg.data);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        }
                    });
                    window.refmd = u.dialog({
                        id: 'commonShowDialog',
                        content: '#tree-stayback',
                        hasCloseMenu: true
                    });
                    viewModel.event.bindClickButton($('#confirm_select_Stayback'), null, viewModel.event.confirmStayBack);
                },

                //搜索待归还图书
                showStayback_click: function () {
                    var jsonData = {};
                    var searchValue = $("#czsearch").val().replace(/(^\s*)|(\s*$)/g, "");
                    jsonData['search_searchParam'] = searchValue;
                    $.ajax({
                        type: "GET",
                        url: ctx + '/bookBorrow/staybackList',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        data: jsonData,
                        success: function (res) {
                            if (res) {
                                viewModel.refStaybackdata.setSimpleData(res.detailMsg.data);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        }
                    });
                },
                
                confirmStayBack: function () {
                    var node = viewModel.refStaybackdata.getCurrentRow().getSimpleData();
                    viewModel.event.backBook(node.id);
                    viewModel.event.mdClose();
                },
                
                //已超时图书
                timeout: function () {
                    $('#tree-title2').html("已超时");
                    var jsonData = {};
                    $.ajax({
                        type: "GET",
                        url: ctx + '/bookBorrow/timeoutList',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        data: jsonData,
                        success: function (res) {
                            if (res) {
                                viewModel.refTimeoutdata.setSimpleData(res.detailMsg.data);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        }
                    });
                    window.refmd = u.dialog({
                        id: 'commonShowDialog2',
                        content: '#tree-timeout',
                        hasCloseMenu: true
                    });
                    viewModel.event.bindClickButton($('#confirm_select_Timeout'), null, viewModel.event.confirmTimeOut);
                },

                //搜索已超时图书
                showTimeout_click: function () {
                    var jsonData = {};
                    var searchValue = $("#czsearch2").val().replace(/(^\s*)|(\s*$)/g, "");
                    jsonData['search_searchParam'] = searchValue;
                    $.ajax({
                        type: "GET",
                        url: ctx + '/bookBorrow/timeoutList',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        data: jsonData,
                        success: function (res) {
                            if (res) {
                                viewModel.refTimeoutdata.setSimpleData(res.detailMsg.data);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        }
                    });
                },
                
                confirmTimeOut: function () {
                    var node = viewModel.refTimeoutdata.getCurrentRow().getSimpleData();
                    viewModel.event.backBook2(node.id);
                    viewModel.event.mdClose();
                },
                
                /**
                 * 弹窗公共方法中取消按钮
                 */
                mdClose: function () {
                    refmd.close();
                },

                /**绑定弹出层的按钮 */
                bindClickButton: function (ele, data, functionevent) { //对某一个按钮进行  点击事假绑定 ele:被绑定的元素，  data：需要传递的数据，functionevent：绑定的方法
                    $(ele).unbind('click'); //取消之前的绑定
                    $(ele).bind('click', data, functionevent); //重新绑定
                },
				    //分页相关
					pageChange:function(){
						viewModel.event.comps.on('pageChange', function (pageIndex) {
							viewModel.draw = pageIndex + 1;
							viewModel.event.loadTelbook(treeid);
						});
					},
					sizeChange:function(){
						viewModel.event.comps.on('sizeChange', function (arg) {
							viewModel.pageSize = parseInt(arg);
							viewModel.draw = 1;
							viewModel.event.loadTelbook(treeid);
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
						viewModel.event.updateTimeout();
	                    //回车搜索
	                    $('.input_enter').keydown(function(e){
	                        if(e.keyCode==13){
	                        	viewModel.event.searchClick()
	                        	u.stopEvent(e);
	                        }
	                    });
					
					},
					
					borrowBookClick:function(){
						var row = viewModel.dt1.getSelectedRows()[0];
						if(row){
							var data = viewModel.dt1.getSelectedRows()[0].getSimpleData()
							u.confirmDialog({
					            msg: "是否借阅"+data.name+"?",
					            title: "借阅确认",
					            onOk: function () {
					                viewModel.event.saveBook(data);
					            },
					            onCancel: function () {
					            }
							});
						}else{
							u.messageDialog({msg:'请选择要借阅的图书!',title:'操作提示',btnText:'确定'});
						}
					},
					searchClick:function(){
						viewModel.draw = 1; 
						viewModel.event.loadTelbook(treeid);
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
