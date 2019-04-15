<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>

<html>
	<head>
		<title>Login Emp</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css" />
		<script src="${pageContext.request.contextPath}/jquery-1.8.3.js"></script>

<script type="text/javascript">
	$(function() {
		$("#btnSignCheck").click(function() {
			var f = true;
			if ($("#txtUsername").val() == ""|| $("#txtPassword").val() == "") {
				$("#divErrorMssage").text("用户名或密码不可为空!");
				return false;
			}
			else{
				//创建异步请求检验用户名密码是否正确
				 $.ajax({
				 	
                  	type:"POST",
                  	url:"/emssm/emp/checkLogin.do",
                  	data:"name="+$("#txtUsername").val()+"&password="+$("#txtPassword").val(),
                 	async:false,
                  	success:function(result){
                  	//alert(result);
                  
                  		if(result.trim()=="usernotexit"){                  		
                  			$("#divErrorMssage").text("用户不存在!");
                  			f = false;
                  			
                  		}
                  		if(reslut.trim()=="passerror"){
                  			$("#divErrorMssage").text("密码输入错误！");
                  			f = false;
                  		}if(reslut.trim()=="ok"){
                  			f = true;
                  		}
                   	return f;
                  	}
                  	      
                  });
                  alert("最后"+f);
                  if(f){return true;}
                  else return false;
				// alert(flag);return flag;
			} 
			
						
		});
	
	});
</script>	
		
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
						登录Ems
					</h1></div>
					
					
					
					<div style="height: 30px; padding: 5px; color: red" id="divErrorMssage">
					test error
					</div>
					<div class="main">
						

						<form method="post"  id="ctl00" action="/ssmday2/user/checkLogin">			
							<ul>
								<li>
									<span>用户：</span>
									<input type="text" name="username" id="txtUsername" class="textbox" />
								</li>
								<li>
									<span class="blank">密码：</span>
									<input type="password" name="password" id="txtPassword"
										class="textbox" />
								</li>
								<li>
									<input type="submit" id="btnSignCheck" class="button_enter"
										value="登 录" />
<input type="button" class="button" onclick="location.href='${pageContext.request.contextPath}/view/addEmp.jsp'" value="Regist &raquo;" />

								</li>
							</ul>
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
