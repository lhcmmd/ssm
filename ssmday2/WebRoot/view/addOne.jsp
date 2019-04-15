<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" %>


  		
  	<script type="text/javascript">
  			
  		$(function(){
  				//id框
  				 				
  				//namek框
  				$("#addname").textbox({
  					required:true  					
  				});
  				//mobile
  				$("#addmobile").validatebox({
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
  				$("#addtelphone").validatebox({
  					required:true  					
  				});
  				
  				//email
  				$("#addemail").validatebox({
  					required:true ,
  					validType:"email" 					
  				});
  				
  				//city
  				$("#addcity").validatebox({
  					required:true  					
  				});
  				//birtrhday
  				$("#addbirthday").datebox({
  					required:true  					
  				});
  				
  				$("#addConfirm").linkbutton({
  						text:"保存",
  						iconCls:"icon-save"	,
  						onClick:function(){
  							$("#addPersonForm").form("submit",{
  								url:"${pageContext.request.contextPath }/person/insertOne",
  								onSubmit:function(){
  								alert($("#addname").val()+"test");
  								//return true;
  									return $("#addPersonForm").form("validate");
  								},
  								success:function(){
  									$.messager.show({
									title:"标题",
									msg:"保存成功！"
									});
									$("#addDialog").dialog("close");
									$("#showAllTable").datagrid("load");
  								}
  							});
  						}	
  				});
  			});
  		
  		</script>  	
				
					<form id="addPersonForm"  method="post" >
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addname" name="name" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									moblie:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addmobile" class="inputgri" name="mobile" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									telphone:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addtelphone" class="inputgri" name="telphone" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									email:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addemail" class="inputgri" name="email" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									city:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addcity" class="inputgri" name="city" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									birthday:
								</td>
								<td valign="middle" align="left">
									<input type="text" id="addbirthday" class="inputgri" name="birthday" />
								</td>
							</tr>
							
						</table>
						<div align="center">
							<a  id="addConfirm">test</a>
						</div>
					</form>		

