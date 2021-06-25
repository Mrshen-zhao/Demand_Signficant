<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    

<head>
<%
	     Object message = request.getAttribute("tip");
	     if(message!=null && !"".equals(message)){
	 
	%>
	     <script type="text/javascript">
	          alert("<%=request.getAttribute("tip")%>");
	     </script>
	<%} %>
<meta charset="UTF-8">

        <title>河北省重大技术需求调查系统</title><meta charset="UTF-8" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link rel="stylesheet" href="css/bootstrap.min.css" />

		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />

        <link rel="stylesheet" href="css/matrix-login.css" />

        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

		 



    </head>

    <body>

        <div id="loginbox">            

            <form id="loginform" class="form-vertical" action="MessageServlet?method=login" method="post">

				 <div class="control-group normal_text"> <h3> 河北省重大技术需求调查系统</h3></div>

                <div class="control-group">

                    <div class="controls">

                        <div class="main_input_box">

                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" name="Username"  placeholder="Username" />

                        </div>

                    </div>

                </div>

                <div class="control-group">

                    <div class="controls">

                        <div class="main_input_box">

                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" name="Password" placeholder="Password" />

                        </div>

                    </div>

                </div>
                <div class="control-group">

                    <div class="controls">

                        <div class="main_input_box">

                            
                            <select name="shenfen">
								<option value="inperson">注册用户</option>
								<option value="inforplace">形式审核员</option>
								<option value="business">部门审核员</option>
								<option value="admin">管理员</option>
							
							</select>

                        </div>

                    </div>

                </div>
                
                
                
                
                

                <div class="form-actions">

                   
					 <span class="pull-left"><a href="register.jsp" class="flip-link btn btn-info" >注册</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-success" > </span>

                </div>

            </form>

            

        </div>

        

        <script src="js/jquery.min.js"></script>  

        <script src="js/matrix.login.js"></script> 

    </body>



</html>

