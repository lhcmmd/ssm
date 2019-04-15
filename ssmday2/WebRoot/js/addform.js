$(function(){
  				//id框
  				 				
  				//namek框
  				$("#addname").validatebox({
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
  				$("#addbirthday").validatebox({
  					required:true  					
  				});
  				
  				
  				
  				
  			});
  		