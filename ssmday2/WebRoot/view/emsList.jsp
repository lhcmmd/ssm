<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<title>empList</title>
		 <style type="text/css">     
          .updatePersonhref{ color:blue }
     	 </style>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
		$(function(){
			//添加联系人按钮
			$("#addbtn").linkbutton({
				text:"添加",
				//plain:true,
				iconCls:"icon-add",
				onClick:function(){
					$("#addDialog").dialog("open");
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
  		 alert(userid);
  		 $.messager.confirm("提示","确认删除吗？",function(is){
  		 	if(is){
  		 		$.get("/ssmday2/person/deleteOne.do","userid="+userid,
  		 			function(){
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
  
    function toUpdateUser(){
  		 $("#updateform").hide();
  		 alert($("#nameinput").val());
  		 $.ajax({				 	
                type:"POST",
                url:"/ssmday2/person/updateOne.do",
                data:"userid="+$("#idinput").val()+"&name="+$("#nameinput").val()+"&mobile="+$("#mobileinput").val()+"&telphone="+$("#telphoneinput").val()+"&email="+$("#emailinput").val()+"&city="+$("#cityinput").val()+"&birthday="+$("#birthdayinput").val(),
                success:function(result){                          	
               		$("#updatetr").first().text($("#idinput").val());
               		$("#updatetr").first().next().text($("#nameinput").val());
               		$("#updatetr").first().next().next().text($("#mobileinput").val());
                	$("#updatetr").first().next().next().next().text($("#telphoneinput").val());
                    $("#updatetr").first().next().next().next().next().text($("#emailinput").val());
                    $("#updatetr").first().next().next().next().next().next().text($("#cityinput").val());
                   $("#updatetr").first().next().next().next().next().next().next().text($("#birthdayinput").val());
                }                 	      
               });
              return false;//
  }
  
  
  
</script>

	
	</head>
	<body>
		<!-- 添加联系人对话框 -->
		<div id="addDialog"></div>
		<!-- 修改联系人对话框 -->
		<div id="updateDialog"></div>
		<!-- 删除联系人对话框 -->
		<div id="deleteDialog"></div>
		
		
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
					<p id="whereami">
					</p>
					<h1>
						欢迎您：${ sessionScope.name},<a href="">安全退出</a>
					</h1>
				<%-- 	<img alt="" src="/file${ sessionScope.userimg}" width="30"> --%>
					
					<div id="content">
					 <p id="whereami">
					</p> 
					
					<form id="updateform" style="display:none"  method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table" >
							<tr>
								<!-- <td valign="middle" align="right">
									id:
								</td> -->
								<td valign="middle" align="left">
									<input id="idinput" type="text" style="display:none" class="inputgri" name="id" value="1" readonly="readonly"/>

								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input id="nameinput" type="text" class="inputgri" name="name" value="zhangshan"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									mobile:
								</td>
								<td valign="middle" align="left">
									<input id="mobileinput" type="text" class="inputgri" name="mobile" value="20000"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									telphone:
								</td>
								<td valign="middle" align="left">
									<input id="telphoneinput" type="text" class="inputgri" name="telphone" value="20"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									email:
								</td>
								<td valign="middle" align="left">
									<input id="emailinput" type="text" class="inputgri" name="email" value="20"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									city:
								</td>
								<td valign="middle" align="left">
									<input id="cityinput" type="text" class="inputgri" name="city" value="20"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									birthday:
								</td>
								<td valign="middle" align="left">
									<input id="birthdayinput" type="text" class="inputgri" name="birthday" value="20"/>
								</td>
							</tr>
							
						</table>
						<p>
							<input id="confirm" onclick="toUpdateUser()" type="submit" class="button" value="Confirm" />
						</p>
					</form>
				</div>
					
					
					<table id="showAllTable" class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								Mobile
							</td>
							<td>
								Birthday
							</td>
							<td>
								Operation
							</td>
						</tr>
						
			    <!--  <s:iterator value="list" status="sts"> -->
			    
			     <%-- <c:forEach items="${requestScope.list }" varStatus="vs" var="person">
			          <tr id="updatetr" <c:if test="${vs.index%2==0}">class="row1"</c:if><c:if  test="${vs.index%2!=0}">class="row2"</c:if> >
							<td id="idt${person.id}">
								<!-- <s:property value="id"/> -->
								${person.id}
							</td>
							<td id="namet"> 
							<!-- 	<s:property value="name"/> -->
							${person.name}
							</td>
							<td id="salaryt">
								<!-- <s:property value="salary"/> -->
								${person.mobile}
							</td>
							<td id="aget">
							<fmt:formatDate value="${person.birthday}"/>
							<!-- 	<s:property value="age"/> -->
							
							</td>
							<td>
								<a id="delete" href="Javascript:void(0)" onclick="deleteUserByid(${emp.id},this)">delete/</a><!-- &nbsp; -->
								<a id="update" href="Javascript:void(0)" onclick="updateUserByid(${emp.id},this)">update</a>
							</td>
						</tr>
			     </c:forEach> --%>
			    <!--  </s:iterator> -->
						
					</table>
					<p>
						<%-- <input type="button" class="button" value="Add Employee" onclick="location='${pageContext.request.contextPath}/view/addEmp2.jsp'"/> --%>
					<!-- 添加联系人按钮 -->
					<a href="#" id="addbtn"></a>
					</p>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>
