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

<div id="user-nav" class="navbar navbar-inverse">

  <ul class="nav">


    <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>

  </ul>

</div>

<!--close-top-Header-menu-->



<!--sidebar-menu-->

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>修改密码</a>

  <ul>

    <li class="active"><a href="redictpass.jsp"><i class="icon icon-home"></i> <span>修改密码</span></a> </li>
    

   



  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->

  
  

  
    <!-- 修改信息 -->
  
  <div class="widget-box">

        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>

          <h5>修改密码</h5>

        </div>
   <div class="widget-content nopadding">
	
          <form action="MessageServlet?method=repassword" method="post" class="form-horizontal">
			

            <div class="control-group">
            
            
              <label class="control-label">账号 :</label>

              <div class="controls">

                <input type="text" class="span11" name="username"value="<%=request.getSession().getAttribute("username") %>"  readonly="readonly"/> 

              </div>

              <label class="control-label">新密码 :</label>

              <div class="controls">

                <input type="password" class="span11" name="password"  />

              </div>
              

     

           

            <div class="form-actions">

              <button type="submit" class="btn btn-success">Save</button>
              <a href="MessageServlet?method=back&&username=<%=request.getSession().getAttribute("username") %>" class="btn btn-success"> <span>返回</span></a>

            </div>
			</div>
          </form>

        </div>
        <!-- 结束修改信息 -->
        
</div>
</div>
  

<!--End-breadcrumbs-->









<!--end-main-container-part-->





<script src="js/jquery.min.js"></script> 


<script type="text/javascript">

  // This function is called from the pop-up menus to transfer to

  // a different page. Ignore if the value returned is a null string:

  function goPage (newURL) {



      // if url is empty, skip the menu dividers and reset the menu selection to default

      if (newURL != "") {

      

          // if url is "-", it is this page -- reset the menu:

          if (newURL == "-" ) {

              resetMenu();            

          } 

          // else, send page to designated URL            

          else {  

            document.location.href = newURL;

          }

      }

  }



// resets the menu selection upon entry to this page:

function resetMenu() {

   document.gomenu.selector.selectedIndex = 2;

}

</script>

</body>

</html>
