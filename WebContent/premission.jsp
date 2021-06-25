<%@page import="User.usermess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>

<%@page import="com.service.MessageService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>

<title>LAYUI MINI</title>

<meta charset="UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="css/bootstrap.min.css" />

<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />

<link rel="stylesheet" href="css/fullcalendar.css" />

<link rel="stylesheet" href="css/matrix-style.css" />

<link rel="stylesheet" href="css/matrix-media.css" />

<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

<link rel="stylesheet" href="css/jquery.gritter.css" />



</head>

<body>




<!--Header-part-->

<div id="header">

  <h1><a href="dashboard.html">Matrix Admin</a></h1>

</div>

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>修改用户权限</a>

  <ul>

    <li class="active"><a href="premission.jsp"><i class="icon icon-home"></i> <span>修改用户权限</span></a> </li>
    <li ><a href="control.jsp"><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>





  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->


  <form action="MessageServlet?method=updateuserpremission" method="post" class="form-horizontal"  id="loginform"  >
  

		  	 	 <div class="control-group">

             	 <label class="control-label">用户角色选择:</label>

              	<div class="controls">

                		<select name="employee" id="employee">
                			<option value="请选择..." selected="selected">请选择...</option>
                			<option value="inperson">注册用户</option>
							<option value="inforplace">形式审核员</option>
							<option value="business">部门审核员</option>
								
                		</select>
					
             	 </div>
		  	 </div>
		  	 
		  	 
		  	 	 <div class="control-group">

             	 <label class="control-label">权限:</label>

              	<div class="controls">

                		    <label>

                  <input type="checkbox" name="premission"  id="premission"  value="1" />修改密码

                 

                  
                 
                  </label>
					
             	 </div>
		  	 </div>
		  	 
		  	 
               	 
          
            <div class="form-actions">

              <input type="submit" class="btn btn-success" value="修改">
              

            </div>
           
		  	</form> 
		  	 

</div>
  


<script src="js/jquery.min.js"></script> 




<script type="text/javascript">
$(document).ready(function(){
	$("#employee").change(function () {
		var info=$("#employee>option:selected").val();
		if (info == "请选择...") {
			return;
		}
		else {
			$.ajax({
				type: "post",
			    url:"MessageServlet?method=selectpremission",
			    async:false,
			    cache:true,
			    data:{"information":info},
			    dataType:"text",
			    success:function (data) {
					//判断有无权限
			    	if(data.indexOf("1") >= 0 ) {
			    		//让checkbox选中
			    		$("#premission").prop("checked",true);
			    	}
			    },
			    error:function () {
			        alert("生成图表出错")
			    }
			});
		}
		
	});
	
});

 

</script>

</body>

</html>
