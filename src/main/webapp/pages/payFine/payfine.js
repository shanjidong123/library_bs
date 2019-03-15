define(['text!pages/payFine/payfine.html','css!pages/payFine/payfine','pages/payFine/meta','uuigrid'],function(html){
	var init=function(element){

		var listUrl = ctx+'/payFine/noBorrowList';
		var payUrl = ctx+'/payFine/pay/';
		var geturl = ctx+'/payFine/getNameAndMoney';
		var topUpurl = ctx+'/payFine/topUp';
		var viewModel = {
				app:{},
				/* 数据模型 */
				draw:1,
				totlePage:0,
				pageSize:5,
				totleCount:0,
				dt1: new u.DataTable(payfineMeta),

				event: {					
	                //清除datatable数据
	                clearDt: function (dt) {
	                	dt.removeAllRows();
	                	dt.clear();
	                },
	                //获取用户名称和余额
					getNameandMoney:function(){
				   		var jsonData = {};
				   		$.ajax({
							type : 'GET',
							url : geturl,
							dataType : 'json',
							contentType : "application/json",
							data : jsonData,
							success : function(res) {
								if( res.success =='success'){
									$("#span1").html("尊敬的用户["+res.detailMsg.data.name+"],您的余额为["
										+res.detailMsg.data.money+"]");
								}else{
								
								}
							}
						})
					},
					// 卡片表数据读取
					initCardTableList:function(){
						var jsonData={
								pageIndex:viewModel.draw-1,
								pageSize:viewModel.pageSize,
								sortField:"createtime",
								sortDirection:"asc"
						};
						$(element).find("#search").each(function(){
							if(this.value == undefined || this.value =='' || this.value.length ==0 ){
								//不执行操作
							}else{
								jsonData['search_searchParam'] =  this.value.replace(/(^\s*)|(\s*$)/g, "");  //去掉空格
							}
						});
						$.ajax({
							type:'get',
							url:listUrl,
							datatype:'json',
							data:jsonData,
							contentType: 'application/json;charset=utf-8',
							success:function(res){
								if(res){
									if( res.success =='success'){
										if(res.detailMsg.data){
											viewModel.totleCount=res.detailMsg.data.totalElements;
											viewModel.totlePage=res.detailMsg.data.totalPages;
											viewModel.event.comps.update({totalPages:viewModel.totlePage,pageSize:viewModel.pageSize,currentPage:viewModel.draw,totalCount:viewModel.totleCount});
											viewModel.dt1.removeAllRows();
											viewModel.dt1.clear();
											viewModel.dt1.setSimpleData(res.detailMsg.data,{unSelect:true});
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
						});
					},
					
					// 充值
					saveTopUpClick:function(){
						var jsonData={
								
						};
						$("#topUp_input").each(function(){
							if(this.value == undefined || this.value =='' || this.value.length ==0 ){
								//不执行操作
							}else{
								jsonData['search_topUpParam'] =  this.value.replace(/(^\s*)|(\s*$)/g, "");  //去掉空格
							}
						});
						$.ajax({
							type:'get',
							url:topUpurl,
							datatype:'json',
							data:jsonData,
							contentType: 'application/json;charset=utf-8',
							success:function(res){
								if(res){
									if (res.detailMsg.data == 'success') {
										viewModel.event.getNameandMoney();
										u.messageDialog({msg:'充值成功!',title:'操作提示',btnText:'确定'});
										md.close();
									} else {
										u.messageDialog({msg:'充值失败!',title:'操作提示',btnText:'确定'});
									}
								}else{
									u.messageDialog({msg:'后台返回数据格式有误，请联系管理员',title:'数据错误',btnText:'确定'});
								}
							},
							error:function(er){
								u.messageDialog({msg:'请求超时',title:'请求错误',btnText:'确定'});
							}
						});
					},
					
					//组装list
					genDataList:function(data){
						var datalist = [];
						datalist.push(data);
						return datalist ;
					},
					//缴纳方法
					payData: function(data) {
						var datalist = viewModel.event.genDataList(data);
						var json = JSON.stringify(datalist);
						$.ajax({
							url: payUrl,
							data: json,
							dataType: 'json',
							type: 'post',
							contentType: 'application/json',
							success: function (res) {
								if(res){
									if (res.detailMsg.data == 'success') {
										u.messageDialog({msg:'缴纳罚款成功!',title:'操作提示',btnText:'确定'});
									} else {
										u.messageDialog({msg:'余额不足,请充值!',title:'操作提示',btnText:'确定'});
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
					//分页相关
					pageChange:function(){
						viewModel.event.comps.on('pageChange', function (pageIndex) {
							viewModel.draw = pageIndex + 1;
							viewModel.event.initCardTableList();
						});
					},
					sizeChange:function(){
						viewModel.event.comps.on('sizeChange', function (arg) {
							viewModel.pageSize = parseInt(arg);
							viewModel.draw = 1;
							viewModel.event.initCardTableList();
						});
					},
					//页面初始化
					pageInit: function () {		       
						$(element).html(html) ;
						viewModel.app = u.createApp({
							el: element,
							model: viewModel
						});
						
						var paginationDiv = $(element).find('#pagination')[0];
						this.comps=new u.pagination({el:paginationDiv,jumppage:true});
						this.initCardTableList();
						viewModel.event.pageChange();
						viewModel.event.sizeChange();
						viewModel.event.getNameandMoney();
	                    //回车搜索
	                    $('.input_enter').keydown(function(e){
	                        if(e.keyCode==13){
	                            $('#searchBtn').trigger('click');
								u.stopEvent(e);
	                        }
	                    });
					},
					payClick:function(){
						var row = viewModel.dt1.getSelectedRows()[0];
						if(row){
							var data = viewModel.dt1.getSelectedRows()[0].getSimpleData()
							u.confirmDialog({
					            msg: "是否为"+data.name+"缴纳罚款?",
					            title: "缴纳确认",
					            onOk: function () {
					                viewModel.event.payData(data);
					                viewModel.event.initCardTableList();
					                viewModel.event.getNameandMoney();
					            },
					            onCancel: function () {
					            }
							});
						}else{
							u.messageDialog({msg:'请选择要缴纳罚款的图书!',title:'操作提示',btnText:'确定'});
						}
					},
					topUpClick:function(){
						window.md = u.dialog({
							 id:'top_Up',
							 content:"#dialog_content_topUp",
							 hasCloseMenu:true
						});
					},
					cancelTopUpClick:function(){
							md.close();
					},
					searchClick:function(){
						viewModel.draw = 1; 
						viewModel.event.initCardTableList();
					},
				}
		}
		$(element).html(html) ;
		viewModel.event.pageInit();
	}
    return{
		'template': html,
        init:init
    }
});

