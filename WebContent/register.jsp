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

        <title>Matrix Admin</title><meta charset="UTF-8" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link rel="stylesheet" href="css/bootstrap.min.css" />

		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />

        <link rel="stylesheet" href="css/matrix-login.css" />

        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

		 	



    </head>

    <body>


           <div class="widget-content nopadding">

          <form action="MessageServlet?method=register" method="post" class="form-horizontal">

            <div class="control-group">

              <label class="control-label">账号 :</label>

              <div class="controls">

                <input type="text" class="span4" name="username" id="username"  placeholder="username" />
                <span id="username11" style="color: red;font-size: 20px;"></span>

              </div>

            </div>

            <div class="control-group">

              <label class="control-label">密码 :</label>

              <div class="controls">

                <input type="password" class="span4" name="password" id="password" placeholder="password" />
				<span id="password11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>
            <div class="control-group">

              <label class="control-label">重复密码 :</label>

              <div class="controls">

                <input type="password" class="span4" name="repassword" id="repassword" placeholder="password" />
				<span id="repassword11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>

            <div class="control-group">

              <label class="control-label">机构全称 :</label>

              <div class="controls">

                <input type="text" class="span4" name="factoryname"  id="factoryname" placeholder="机构名称" />
				<span id="factoryname11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>
            <div class="control-group">

              <label class="control-label">邮政编码 :</label>

              <div class="controls">

                <input type="text" class="span4" name="postal" id="postal" placeholder="邮政编码" />
				<span id="postal11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>
             <div class="control-group">

              <label class="control-label">身份 :</label>

              <div class="controls">

                <select name="shenfen">
								<option value="inperson">注册用户</option>
								<option value="inforplace">形式审核员</option>
								<option value="business">部门审核员</option>
								<option value="admin">管理员</option>
							
							</select>

              </div>

            </div>
            
            

           

            <div class="form-actions">

              <button type="submit" class="btn btn-success" id="check-btn">Save</button>
               <a	 class="btn btn-success" href="login.jsp">返回上一页</a>

            </div>

          </form>

        </div>

        

        <script src="js/jquery.min.js"></script>  

        

    </body>
    <script >
    $(document).ready(function(){
    		//姓名验证
    	$("#username").blur(function(){
    	    username=$(this).val();
    	    if (username=="") {
				  $("#username11").text("用户名不能为空");
			}else{
				$("#username11").text("格式正确");
			}   
    	  });
    	$("#postal").blur(function(){
    	    postal=$(this).val();
    	    if (postal=="") {
				  $("#postal11").text("邮政编码不能为空");
			}else{
				$("#postal11").text("格式正确");
			}   
    	  });
    	$("#password").blur(function(){
    	    password=$(this).val();
    	    if (password=="") {
				  $("#password11").text("密码不能为空");
			}else{
				$("#password11").text("格式正确");
			}   
    	  });
    	$("#factoryname").blur(function(){
    	    factoryname=$(this).val();
    	    if (factoryname=="") {
				  $("#factoryname11").text("单位全称不能为空");
			}else{
				$("#factoryname11").text("格式正确");
			}   
    	  });
    	$("#repassword").blur(function(){
    	    repassword=$(this).val();
    	    if (repassword!=$("#password").val()) {
				  $("#repassword11").text("重复的密码不正确");
			}else{
				$("#repassword11").text("密码正确");
			}   
    	  });

    		
    	});

    </script>



</html>

