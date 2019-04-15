<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$("#tabs").tabs({
				//closable:true
			});
			
			//
			$("#newbtn").linkbutton({
				
				onClick:function(){
				// 判断是否存在-调tabs的exits方法，存在 则选中--调tabs的select方法
				
				// 不存在，创建tab面板 -- 调用tabs的add方法
				$("#tabs").tabs("add", {
					title:"新标题",
					closable:true,
					href:"${pageContext.request.contextPath }/index.jsp"
				});
			}
			});
			
			
			
		});
	
	</script>
  </head>
  
  <body>
  	
   		<div id="tabs">
		<div data-options="title:'welcome'">div1</div>
		<div data-options="title:'标题2',closable:true,href:'${pageContext.request.contextPath }/index.jsp'">div2</div>
		<div data-options="title:'标题3',closable:true,href:'${pageContext.request.contextPath }/tree2.jsp'">div3</div>
	</div>
   	
   	<!--  -->
  	<a id="newbtn" ></a>
  </body>
</html>
