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

<title>Matrix Admin</title>

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

<!--close-Header-part--> 





<!--top-Header-menu-->



<!--close-top-Header-menu-->



<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>修改用户信息</a>

  <ul>

    <li class="active"><a href="updateuserinfo.jsp"><i class="icon icon-home"></i> <span>修改用户信息</span></a> </li>
    <li ><a href="control.jsp"><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>





  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->


  <form action="MessageServlet?method=updateuserinfo" method="post" class="form-horizontal"  id="loginform"  >
  

   
		  	 
		  	 
		
		  	 
		  	 <div class="control-group">

             	 <label class="control-label">用户名:</label>

              	<div class="controls">

                	<input type="text" class="span4" name="username" id="username" value="${mess.username}" readonly="readonly" />
					
             	 </div>
		  	 </div>
		  	  <div class="control-group">

             	 <label class="control-label">密码 :</label>

              	<div class="controls">

                	<input type="text" class="span4" name="password" id="password" value="${mess.password}"  />
                	<span id="password11" style="color: red;font-size: 20px;"></span>
					
             	 </div>
		  	 </div>
		  	 
		  	  <div class="control-group">

              <label class="control-label">用户角色：</label>
              
               	  <div class="controls">

                <label>

                    <input type="text" name="employee"  value="${mess.employee}"  readonly="readonly"/>
 					

                 </label>
	  

             	 </div>
              </div>
              
               <div class="control-group">

              <label class="control-label">邮政编码 :</label>

              <div class="controls">

                <input type="text" class="span4" name="postal" id="postal" value="${mess.postal}"  />
				
              </div>
		  	 </div>
		  	 
		  	 
		  	 
               	 
          
            <div class="form-actions">

              <input type="submit" class="btn btn-success" value="修改">
              

            </div>
           
		  	</form> 
		  	 
		  	 
		  	 
             
               	 
               	 
            



</div>
  
    <script src="js/jquery.min.js"></script> 
<!--End-breadcrumbs-->
<script type="text/javascript">
$(document).ready(function(){

	$("#password").blur(function(){
		    password=$(this).val();    
		    if (password=="") {
		    	
				  $("#password11").text("密码不能为空");
			}else{
				$("#password11").text("格式正确");
			}    
	});



});

</script>








<!--end-main-container-part-->







<script src="js/jquery.min.js"></script> 




<script type="text/javascript">


 

</script>

</body>

</html>
