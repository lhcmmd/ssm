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
		});
	</script>
  </head>
  
  <body>
  	<div id="cc" class="easyui-layout" data-options="fit:true" style="width:600px;height:400px;">   
	    <div data-options="region:'north',title:'North Title'" style="height:100px;"></div>   
	    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>   
	    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>   
	    <div data-options="region:'west',title:'West',split:true" style="width:300px;">
	    	<div class="easyui-accordion" data-option="fit:true">
	    		<div title="第一个" data-options="height:200">a</div>
	    		<div title="第2个">b</div>
	    		<div title="第3个">c</div>
	    		<div title="第4个">
					<a href="JavaScript:void(0)" onclick="a()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">点击我试试看</a>
				</div>
	    		<div title="第5个">e</div>
	    	</div>
	    </div>   
	    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>   
	</div>  
	
	  	
  </body>
</html>
