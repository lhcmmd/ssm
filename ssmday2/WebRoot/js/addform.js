$(function(){
  				//id��
  				 				
  				//namek��
  				$("#addname").validatebox({
  					required:true  					
  				});
  				//mobile
  				$("#addmobile").validatebox({
  					required:true,
  				    validType:"isLength[11]"
  				   
  				});
  				//��֤�ֻ���Ϊ����11λ
  				$.extend($.fn.validatebox.defaults.rules,{
  					//��鳤��
  					isLength:{
  						validator:function(value,param){//param[0]:�������ƶ��±꣬
  							if(value.length==param[0]&&!isNaN(value)){//isNaN:js�����ж��Ƿ�Ϊ����
  								return true;
  							}else{
  								return false;
  							}
  						},
  						message:"�ֻ��ű���Ϊ{0}λ���֣�" //{0}�����ƶ��±�Ĳ���
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
  		