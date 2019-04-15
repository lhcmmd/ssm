<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
		//简化写法
		$(function(){
			$("#myTree").tree({
				/* url:"getTree.do", */
				url:"getCategoryTree.do",
				animate:true,
				checkbox:true,
				onlyLeafCheck:true,
				dnd:true,
				onClick:function(node){
					//参数node：节点===》对应到Java代码中就是一个TreeNode对象
					alert(node.id+"**"+node.text+"***"+node.attributes.url)
				}
			});
		});
	</script>
  </head>
  
  <body>
  	<ul id="myTree"></ul>
  </body>
</html>
