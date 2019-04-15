<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>add Emp</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
  		<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
  
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								2009/11/20
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="#">Main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						add Emp info:
					</h1>
					<form action="${pageContext.request.contextPath}/person/insertOne" method="post" >
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="" name="name" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									moblie:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="mobile" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									telphone:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="telphone" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									email:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="email" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									city:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="city" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									birthday:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="birthday" />
								</td>
							</tr>
							
						</table>
						<p>
							<input type="submit" class="button" value="Confirm" />
						</p>
					</form>
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
