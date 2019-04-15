<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>


  		
  	<script type="text/javascript">
  			
  		$(function(){
  				//id框
  				 				
  				//namek框
  				$("#updatename").textbox({
  					required:true  					
  				});
  				//mobile
  				$("#updatemobile").validatebox({
  					required:true,
  				    validType:"isLength[11]"
  				   
  				});
  				//验证手机号为数字11位
  				$.extend($.fn.validatebox.defaults.rules,{
  					//检查长度
  					isLength:{
  						validator:function(value,param){//param[0]:参数表制定下标，
  							if(value.length==param[0]&&!isNaN(value)){//isNaN:js函数判断是否为数字
  								return true;
  							}else{
  								return false;
  							}
  						},
  						message:"手机号必须为{0}位数字！" //{0}代表制定下标的参数
  					},
  				});	
  				
  				//telphone
  				$("#updatetelphone").validatebox({
  					required:true  					
  				});
  				
  				//email
  				$("#updateemail").validatebox({
  					required:true ,
  					validType:"email" 					
  				});
  				
  				//city
  				$("#updatecity").validatebox({
  					required:true  					
  				});
  				//birtrhday
  				
  				$("#updatebirthday").datebox({
  					required:true  					
  				});
  				
  				//页面加载后自动填充信息
  				$("#updatePersonForm").form("load","${pageContext.request.contextPath }/person/queryOne.do?userid="+$("#updateid").val()
  				);
  				//点击按钮去controller修改数据库	
  				$("#toUpdateBtn").linkbutton({
  						text:"保存",
  						iconCls:"icon-save"	,
  						onClick:function(){
  						
  							$("#updatePersonForm").form("submit",{
  									
  								url:"${pageContext.request.contextPath }/person/updateOne.do",
  								onSubmit:function(){
  									alert("修改");
  									return $("#updatePersonForm").form("validate");
  								},
  								success:function(){
  									$("#updateDialog").dialog("close");
  									$.messager.show({
									title:"标题",
									msg:"修改成功！"
									});
									$("#showAllTable").datagrid("reload");
  								}
  							
  							});  						
  						}	
  				});			
  			});
  		
  		</script>  	
				<input type="text" hidden="hidden" id="updateid"  value="${param.userid }" />
					<form id="updatePersonForm"  method="post" >
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
 	<input type="text" hidden="hidden" id="updateuserid" name="id" />
							
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="updatename" name="name" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									moblie:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="updatemobile" class="inputgri" name="mobile" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									telphone:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="updatetelphone" class="inputgri" name="telphone" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									email:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="updateemail" class="inputgri" name="email" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									city:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="updatecity" class="inputgri" name="city" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									birthday:
								</td>
								 <td valign="middle" align="left">
									<input type="text" id="updatebirthday" class="inputgri" name="birthday" />
								</td> 
							</tr>
							
						</table>
						<div align="center">
							<a  id="toUpdateBtn">toUpdateBtn</a>
						</div>
					</form>		

