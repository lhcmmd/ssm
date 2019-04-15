<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>

		<script type="text/javascript">
		$(function(){
			 //datagrid添加控件
  			 $("#showAllTable").datagrid({
  			 	//url:"${pageContext.request.contextPath}/person/getUser",
  			 	url:"${pageContext.request.contextPath}/person/getPersonByName",
  			 	columns:[[
  			 		{title:"复选框",field:"fx",width:1,checkbox:true},
  			 		{title:"ID",field:"id",width:1},
  			 		{title:"Name",field:"name",width:1},
  			 		{title:"Mobile",field:"mobile",width:1},
  			 		{title:"Birthday",field:"birthday",width:1},
  			 		{title:"Operate",field:"cz",
  			 			//value：字段值。row：行记录数据  index: 行索引。
  			 			//自定义单元格内容
  			 			formatter:function(value,row,index){
  			 				return "<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+row.id+",this)'>删除/</a>"+"<a  onclick='updateUserByid("+row.id+",this)' href='Javascript:void(0)'>修改</a>";
  			 			}
  			 		}
  			 	]],
  			 	rownumbers:true,
  			 	fitColumns:true,
  			 	toolbar:"#addbtnDiv,deleteBatchDiv", //将添加按钮添置表格上部工具栏
  			 	striped:true, //斑马线效果
  			 	title:"联系人信息",
  			 	iconCls:"icon-man",
  			 	pagePosition:"top",
  			 	pagination:true,
  			 	pageSize:3,
  			 	pageList:[3,6,9]
  			 });
			
			//安全退出
			$("#exit").linkbutton({
				plain:true,
				text:"退出",
				iconCls:"icon-back"
			});
			
			//添加联系人按钮
			$("#addbtn").linkbutton({
				text:"添加",
				//plain:true,
				iconCls:"icon-add",
				onClick:function(){
					$("#addDialog").dialog("open");
				}
			});
			//批量删除按钮
			$("#deleteBatchbtn").linkbutton({
				text:"批量删除",
				//plain:true,
				iconCls:"icon-remove",
				onClick:function(){
					//1.获取到选中的数据的id
					var allRows = $("#showAllTable").datagrid("getSelections");
					if(allRows.length==0){
						$.messager.alert("提示框","请选中要删除的行","warning");
					}else{
						$.messager.confirm("确认框","确定要删除选中的行？",function(r){
						if(r){
						//alert(allRows.length);
						var id = new Array(allRows.length);
						for(var i=0;i<allRows.length;i++){
							id[i]=allRows[i].id;
						}
						//2.带着id发送请求到后台
						$.ajax({
							url:"${pageContext.request.contextPath}/person/deletePersons",
							/* data:"id="+id, */
							
							data:{"id":id},
							//traditional:true,
							
							type:"post",
							success:function(data){
								//$.messager.alert("提示框",data.isDelete,"info");
								$("#showAllTable").datagrid("reload");
								$.messager.show({
									title:"提示",
									msg:"删除成功"
								});
							}
						});
					}
				});
			}
					
					
				}
			});
			
	 	//添加联系人对话框
	 	$("#addDialog").dialog({
	 		closed:true, 
	 		modal:true,
	 		cache:false,
	  		title:"添加联系人：",
	  		maximizable:true,
	  		minimizable:true,
	  		collapsible:true,
	  		//toolbar:"#navigation",
	  		width:400,
	  		height:200,
	  		href:"${pageContext.request.contextPath }/view/addOne.jsp"
	 		
	 	});
		
			//添加联系人按钮
			$("#updatebtn").linkbutton({
				text:"修改",
				//plain:true,
				//iconCls:"icon-add",
				onClick:function(){
					$("#updateDialog").dialog("open");
				}
			});
			
		/* 	//用户名搜索框
			$("#searchPerson").textbox({
				buttonIcon:"icon-search",
				onClickButton:function(index){
				console.log("hehe");
				console.log(index);
					$("#showAllTable").datagrid("reload",{"name":$("#searchPerson").val()});
				}
			}); */
			
			//花式搜索框
			$("#searchPersons").searchbox({
				menu:"#searchMenu",
				searcher:function(val,name){
					if(name == "xm"){
						$("#showAllTable").datagrid("reload",{"name":$("#searchPersons").val()});
					}
					else if(name == "pid"){
					console.log(val);
						$("#showAllTable").datagrid("reload","${pageContext.request.contextPath }/person/getPersonByID?userid="+val);
					}else if(name=="sj"){
						$("#showAllTable").datagrid("reload","${pageContext.request.contextPath }/person/getPersonByMobile?mobile="+val);
					}
				}
			});
			
			
		//修改联系人对话框
	 	$("#updateDialog").dialog({
	 		closed:true, 
	 		modal:true,
	 		cache:false,
	  		title:"修改联系人：",
	  		maximizable:true,
	  		minimizable:true,
	  		collapsible:true,
	  		//toolbar:"#navigation",
	  		width:400,
	  		height:200,
	  		href:"${pageContext.request.contextPath }/view/updatePerson.jsp"
	 		
	 	});
		
			$.get("${pageContext.request.contextPath}/person/showAll",
			function(res){
			
				for(var i=0;i<res.length;i++){
				var pid = res[i].id;
					$("#showAllTable").append("<tr><td>"+res[i].id+"</td><td>"+res[i].name+"</td><td>"+res[i].mobile+"</td><td>"+res[i].birthday+"</td><td>"+"<a id='delete' href='Javascript:void(0)' onclick='deleteUserByid("+pid+",this)'>deleteOne/</a>"+"<a  onclick='updateUserByid("+pid+",this)' href='Javascript:void(0)'>updateOne</a>"+"</td></tr>");
				}
			},"json");
		
		});
		
  	function deleteUserByid(userid,obj){
  		// alert(userid);
  		 $.messager.confirm("提示","确认删除吗？",function(is){
  		 	if(is){
  		 		$.get("/ssmday2/person/deleteOne.do","userid="+userid,
  		 			function(){
  		 				$("#showAllTable").datagrid("reload");
  		 			
						$.messager.show({
							title:"提示",
							msg:"删除成功"
						}); 
  		 			},"text");
  		 	}
  		 });
  		
  }
  
  function updateUserByid(userid,obj){
  	$("#updateDialog").dialog({
  		href:"${pageContext.request.contextPath }/view/updatePerson.jsp?userid="+userid
  	});
  	$("#updateDialog").dialog("open");
  	
  }
  
</script>

		<!-- 添加联系人对话框 -->
		<div id="addDialog"></div>
		
		
		<!-- 修改联系人对话框 -->
		<div id="updateDialog"></div>
		<!-- 删除联系人对话框 -->
		<div id="deleteDialog"></div>
		
		<!-- 添加联系人按钮 -->
		<div id="addbtnDiv" align="left">
			<a href="#" id="addbtn"></a>
			<!-- 批量删除按钮 -->
			<a href="#" id="deleteBatchbtn"></a>
		</div>
	
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							2018/11/19
							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<a href="#">main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<%-- <p id="whereami">
					</p>
					<h1>
						欢迎您：${ sessionScope.name},<a id='exit' href="">安全退出</a>
					</h1> --%>
				<!-- 	<img alt="" src="/file${ sessionScope.userimg}" width="30"> -->
					
		<!-- 条件搜索框 -->	
		<!-- <div align="center">用户名:<input id="searchPerson"/></div> -->
		<div align="center">按条件搜索:<input id="searchPersons"/></div>
		<div id="searchMenu">
			<div data-options="name:'xm',iconCls:'icon-man'">姓名</div>
			<div data-options="name:'pid'">ID</div>
			<div data-options="name:'sj'">手机号</div>
		</div>					
				<div id="content">
				
			<!-- 查所有表格展示框 -->
				</div>
					<table id="showAllTable"></table>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				lhc_hhh@126.com
				</div>
			</div>
		</div>

