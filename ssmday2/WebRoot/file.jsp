<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   <form action="${pageContext.request.contextPath }/file/fileUpload.do" method="post" enctype="multipart/form-data">
   	<input type="file" name="file1"/>
   	<input type="submit" value="保存">
   </form>
  </body>
</html>
