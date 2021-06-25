<%@page import="User.userInfo"%>
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



<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>文件分发</a>

  <ul>

    <li class="active"><a href="index1.jsp"><i class="icon icon-home"></i> <span>文件分发</span></a> </li>
   
    

   




  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->

  <div id="content-header">

    <div id="breadcrumb"> <a href="index1.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>

  </div>
  
  
  
    
  
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
					
                   <th>编号</th>
                   <th>机构名称</th>
                  <th>联系人</th>

                  <th>技术所属领域</th>
                
                  
                  <th>详细</th>
                  

              

                </tr>

              </thead>
              
          <%  
          	
          		String sql1 = "select * from information where (status='" + 0 + "')";
          		List<userInfo> lst=MessageService.getmessage(sql1);
				request.setAttribute("meslist", lst); 
	
				%>

              <tbody>
              <c:forEach items="${meslist}" var="mes">

                <tr class="odd gradeX">

                 <td>${mes.id}</td>
                 <td> ${mes.companyname}</td>

                  

                  <td>${mes.contacts}</td>
                  <td>${mes.subject}</td>
                  <td><a  href="MessageServlet?method=find2&&id=${mes.id}">查看</a></td>
                  

                  

                

                </tr>

                </c:forEach>
              </tbody>

            </table>

          </div>
  
</div>

<!-- 查看信息结束 -->
</div>
  

<!--End-breadcrumbs-->









<!--end-main-container-part-->







<script src="js/jquery.min.js"></script> 




<script type="text/javascript">

 
</script>

</body>

</html>
