<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

  
<script type="text/javascript">
	$(function(){
		$("#leftTree").tree({
		url:"${pageContext.request.contextPath }/view/left-json.jsp",
		onClick:function(node){
			if($("#leftTree").tree("isLeaf",node.target)){
				console.log(node);
				if($("#centerDiv").tabs("exists",node.text)){
					$("#centerDiv").tabs("select",node.text);
				}else{
					$("#centerDiv").tabs("add",{
						title:node.text,
						closable:true,
						href:node.attributes.mypath
					});
				}
			}
		}
		
		});
		
	});
</script> 
<ul id="leftTree"></ul>

