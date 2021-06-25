<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>

<%@page import="com.service.MessageService"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Insert title here</title>
<head>

<title>河北省重大技术需求调查系统</title>

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

<%
	     Object message = request.getAttribute("info");
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("info")%>");
	     </script>
	<%} %>



<!--Header-part-->

<div id="header">

  <h1>河北省重大技术需求调查系统</h1>

</div>

<!--close-Header-part--> 





<!--top-Header-menu-->

<div id="user-nav" class="navbar navbar-inverse">

  <ul class="nav">
	
	
    <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    
   
	
  </ul>

</div>

<!--close-top-Header-menu-->
<!--start-top-serch-->



<!--close-top-serch-->


<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>填报流程图</a>

  <ul>

    <li class="active"><a href="showProcess.jsp"><i class="icon icon-home"></i> <span>填报流程图</span></a> </li>
    <li ><a href="index.jsp"><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>
	 
  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->

  <div id="content-header">

    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
    
  </div>
  
  
  
    <!-- 填报流程图开始 -->
  		
 <div class="row-fluid">

    <div class="span6">

     
        <div class="widget-content nopadding">

            <div class="control-group">

              <label class="control-label">Company info :</label>

              <div class="controls">

                <input type="text" class="span11" placeholder="Company name" />

              </div>

            </div>


        </div>

      </div>
      
      
     
      
    <div class="span6">

    <form action="#" method="get" class="form-horizontal">
        <div class="widget-content nopadding">

            <div class="control-group">

              <label class="control-label">Company info :</label>

              <div class="controls">

                <input type="text" class="span11" placeholder="Company name" />

              </div>

            </div>


        </div>
        </form>

      </div>
      
      


      
      
      
      
      </div>
      </div>


      


  
  
	<!-- 填报流程图结束 -->







  

<!--End-breadcrumbs-->









<!--end-main-container-part-->





 

<script src="js/jquery.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="js/data.js"></script>
<script type="text/javascript" charset="utf-8" src="js/datajs.js"></script> 

<script type="text/javascript">





</script>


</body>

</html>
