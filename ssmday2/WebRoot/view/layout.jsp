<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>layout</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
	
	
	</script>	
	
  </head>
  
  <body class="easyui-layout">
    <div id="north" data-options="region:'north',height:50,split:true">north</div>
    <div id="west" data-options="region:'west',width:100,split:true,title:'导航菜单',iconCls:'icon-man',href:'${pageContext.request.contextPath }/view/left.jsp'">west</div>
    <div id="east" data-options="region:'east',width:150,split:true">east</div>
    <div id="south" data-options="region:'south',height:50,split:true">
    	<div data-options="fit:true" class="easyui-layout">
    		<div data-options="region:'west',width:400,split:true">test1</div>
    		<div data-options="region:'center',split:true">test2</div>
    	</div>
    
    </div>
    <div id="center" data-options="region:'center',href:'${pageContext.request.contextPath }/view/center.jsp'">center</div>
  </body>
</html>
