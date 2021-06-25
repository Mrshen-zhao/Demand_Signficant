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

<%
	     Object message = request.getAttribute("tip");
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("tip")%>");
	     </script>
	<%} %>

<!--Header-part-->

<div id="header">

  <h1><a href="dashboard.html">Matrix Admin</a></h1>

</div>

<!--close-Header-part--> 





<!--top-Header-menu-->

<div id="user-nav" class="navbar navbar-inverse">

  <ul class="nav">
	
	
    <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	
  </ul>

</div>

<!--close-top-Header-menu-->



<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>用户管理</a>

  	<ul>

    <li class="active"><a href="control.jsp"><i class="icon icon-home"></i> <span>用户管理</span></a> </li>
    <li ><a href="premission.jsp"><i class="icon icon-home"></i> <span>权限管理</span></a> </li>
    <li ><a href="fenlei.jsp"><i class="icon icon-home"></i> <span>分类检索</span></a> </li>
    <li ><a href="zonghe.jsp"><i class="icon icon-home"></i> <span>综合检索</span></a> </li>
    <li ><a href="echarts.jsp"><i class="icon icon-home"></i> <span>图表联动展示</span></a> </li>
    
    

   




  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->

  <div id="content-header">

    <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>

  </div>
  
   <form action="MessageServlet?method=searchbm" method="post" class="form-horizontal"  id="loginform"  >
  
	 
	
  
  
  
    
  
  <div class="widget-box">
		<!-- 修改信息 -->

        <!-- 结束修改信息 -->
        
        <!-- 查看信息 -->
        
        
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>

            <h5>查看征文信息</h5>

          </div>
         <div class="widget-content nopadding">

            <table class="table table-bordered table-striped">

              <thead>

                <tr>

                  <th>用户名</th>
                  <th>密码</th>

                  <th>用户角色</th>
                  
                  
                  <th colspan="2">操作</th>

              

                </tr>

              </thead>
              <% String sql2="select * from user";
				List<usermess> messlist=MessageService.getusermess(sql2);
				request.setAttribute("meslist", messlist); %>

              <tbody>
              <c:forEach items="${meslist}" var="mes">

                <tr class="odd gradeX">

                  <td>${mes.username}</td>
			     <td>${mes.password}</td>
                  <td>${mes.employee}</td>
                  
                  
                  <td><a href="MessageServlet?method=finduserinfo&&username=${mes.username}">修改</a></td>
                  <td><a href="MessageServlet?method=deleteuser&&username=${mes.username}">删除</a></td>

                  

                

                </tr>

                </c:forEach>
              </tbody>

            </table>

          </div>
  
</div>

 </form>

<!-- 查看信息结束 -->
</div>
  

<!--End-breadcrumbs-->









<!--end-main-container-part-->







<script src="js/jquery.min.js"></script> 
  <script type="text/javascript" charset="utf-8" src="js/bumen.js"></script>
<script type="text/javascript" charset="utf-8" src="js/bumenjs.js"></script> 



<script type="text/javascript">



</script>

</body>

</html>
