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



<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>详细信息</a>

  <ul>

    <li class="active"><a href="findInfo.jsp"><i class="icon icon-home"></i> <span>详细信息</span></a> </li>
    <li ><a href="index1.jsp"
	><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>





  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->


  <form action="#" method="post" class="form-horizontal"  id="loginform"  >
  
    <!-- 修改信息 -->
 <div class="row-fluid">
	<!-- 布局一开始 -->
           
    	<div class="span6">
    		<div class="widget-content nopadding">
    			<!-- 具体布局开始 -->
    			
    			
    			<div class="control-group">

              <label class="control-label">编号 :</label>

              <div class="controls">

                <input type="text" class="span6" name="id"  id="id"
                 value="${mess.id}" readonly="readonly" />

              </div>

            </div>
    		<div class="control-group">

              <label class="control-label">机构全称 :</label>

              <div class="controls">

                <input type="text" class="span6" name="companyname"  id="companyname"
                 value="${mess.companyname}" readonly="readonly" />

              </div>

            </div>
            
             <div class="control-group">

              <label class="control-label">通讯地址 :</label>

              <div class="controls">

                <input type="text" class="span6" name="comaddress" id="comaddress" value="${mess.comaddress}" readonly="readonly" />
                

              </div>

            </div>
            
    		<div class="control-group">

              <label class="control-label">网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址 :</label>

              <div class="controls">

                <input type="text" class="span6" name="comwebsite" id="comwebsite"  value="${mess.comwebsite}" readonly="readonly"/>

              </div>

            </div>
    		
    		<div class="control-group">

              <label class="control-label">法人代表:</label>

              <div class="controls">

                <input type="text" class="span6" name="lawperson" id="lawperson" value="${mess.lawperson}" readonly="readonly" />
					
              </div>

            </div>
            
             <div class="control-group">

              <label class="control-label">联系人 :</label>

              <div class="controls">

                <input type="text" class="span6" name="contacts"  id="contacts" value="${mess.contacts}" readonly="readonly" />
              </div>

            </div>
            
            <div class="control-group">

              <label class="control-label">手机 :</label>

              <div class="controls">

                <input type="text" class="span6" name="telphone" id="telphone" value="${mess.telphone}" readonly="readonly" />
              </div>
              

            </div>
            
           <!-- 具体布局结束 -->
           </div>
        </div>
        
       <!-- 布局一结束 -->
       <!-- 布局二开始 -->
    	<div class="span6"> 
    		<div class="widget-content nopadding">
    		<!-- 具体布局开始-->
    		<div class="control-group">

              <label class="control-label">归口管理部门 :</label>

              <div class="controls">

                <input type="text" class="span6" name="belongcom" id="belongcom" value="${mess.belongcom}" readonly="readonly" />

              </div>
		  	 </div>
		  	 
		 
		  	 
		  	 
    	
    		<div class="control-group">

              <label class="control-label">所在地域 :</label>

              <div class="controls">
					<input type="text" class="span6" name="belongarea" id="belongarea" value="${mess.belongarea}" readonly="readonly" />
					
              </div>

            </div>
            
            <div class="control-group">

              <label class="control-label">电子邮箱 :</label>

              <div class="controls">

                <input type="text" class="span6" name="email" id="email" value="${mess.email}"  id="email" readonly="readonly"/>
				
              </div>

            </div>
            
             <div class="control-group">

              <label class="control-label">邮政编码:</label>

              <div class="controls">

                <input type="text" class="span6" name="postal"  id="postal" value="${mess.postal}" readonly="readonly" />

              </div>

            </div>
            
               
            <div class="control-group">

              <label class="control-label">固定电话 :</label>

              <div class="controls">

                <input type="text" class="span6" name="phone" id="phone" value="${mess.phone}" readonly="readonly" />
				
              </div>
              

            </div>
            
               <div class="control-group">

              <label class="control-label">传真 :</label>

              <div class="controls">

                <input type="text" class="span6" name="fax" id="fax" value="${mess.fax}" readonly="readonly" />

              </div>

            </div>
             
           	<!-- 具体布局结束 -->
           </div>
    	</div>  
           <!-- 布局二结束 -->
    </div>
           <!-- 重新设置布局结束 -->
    
            
         <div class="control-group">

              <label class="control-label">机构属性</label>

              <div class="controls">
                <label>
					<input type="text" name="insattr"  value="${mess.insattr}" readonly="readonly" />

                 </label>


              </div>

          </div>
            
             
		  	 
		  	 <div class="control-group">

              <label class="control-label">机构简介 :</label>

              <div class="controls">

                <textarea rows="8" cols="15" name="summary" id="summary" readonly="readonly" >${mess.summary}</textarea>
                

              </div>
		  	 </div>
		  	 
		  	 
		  	 
		  	 
		  <div class="row-fluid">

    			<div class="span6">

        			<div class="widget-content nopadding">
        			
        			 	<div class="control-group">

              			<label class="control-label">技术需求名称 :</label>

             				 <div class="controls">

                					<input type="text" class="span6" name="techname" id="techname" value="${mess.techname}" readonly="readonly"/>
               						 
					

             				 </div>
		  			 	</div>
        			
					</div>
				</div>
				
				<div class="span6">

        			<div class="widget-content nopadding">
        				
        			 	<div class="control-group">

              			<label class="control-label">需求时限 :</label>

             				 <div class="controls">

                					<input type="text" class="span6" name="totime" id="totime" value="${mess.totime}" readonly="readonly" />
               			
					

             				 </div>
		  			 	</div>
        			
        			
					</div>
				</div>
				
		</div>		  	 
		  	 
		  	 
		  	 <div class="control-group">

              <label class="control-label">重大科技需求概述 :</label>

              <div class="controls">

                <textarea rows="15" name="techchat" id="techchat" readonly="readonly" >${mess.techchat}</textarea>
				

              </div>
              
		  	 </div>
		  	 
		  	 <div class="control-group">

             	 <label class="control-label">关键词 :</label>

              	<div class="controls">

                	<input type="text" class="span4" name="keyword" id="keyword" value="${mess.keyword}" readonly="readonly" />
					
             	 </div>
		  	 </div>
		  	  <div class="control-group">

             	 <label class="control-label">拟投入资金总额 :</label>

              	<div class="controls">

                	<input type="text" class="span4" name="money" id="money" value="${mess.money}" readonly="readonly" />
					
             	 </div>
		  	 </div>
		  	 
		  	  <div class="control-group">

              <label class="control-label">技术需求合作模式：</label>
              
               	  <div class="controls">

                <label>

                    <input type="text" name="togemodern"  value="${mess.togemodern}"  readonly="readonly"/>
 					

                 </label>
	  

             	 </div>
              </div>
              
               <div class="control-group">

              <label class="control-label">合作意向单位 :</label>

              <div class="controls">

                <input type="text" class="span4" name="togecom" id="togecom" value="${mess.togecom}" readonly="readonly" />
				
              </div>
		  	 </div>
		  	 
		  	 
		  	 
		  	  <div class="control-group">

              <label class="control-label">研究类型：</label>
		  	 
		  	 <div class="controls">
		  	 	
                  	<input type="text" name="discuss" id="a" value="${mess.discuss}" readonly="readonly"/>
				
                 
              </div>
              </div>
              
              
               <div class="control-group" id="one">

              <label class="control-label">学科分类 :</label>

              <div class="controls">

                <input type="text" name="subject"  value="${mess.subject}" readonly="readonly"/>

              </div>
		  	 </div>
              
        <div class="control-group" id="two">
			<label class="control-label">需求技术所属领域</label>

              <div class="controls">

               

                  <input type="text" name="domain"  value="${mess.domain}" readonly="readonly" /> 

                 


              </div>
		 </div>
               	 
               	 
               	 
              <div class="control-group" id="three">

              <label class="control-label">需求技术应用行业 :</label>

              <div class="controls">

                <input type="text" class="span4" name="vocation" value="${mess.vocation}"  readonly="readonly"/>

              </div>
		  	 </div>
		  	 
		  	  <div class="control-group" >

              <label class="control-label">形式审核员的意见 :</label>

              <div class="controls">

                <textarea id="xsadvice"  name="xsadvice"  rows="8" placeholder="请输入您的意见"></textarea>

              </div>
		  	 </div>
		  	 
		  	
		  	 <div class="control-group" >

              <label class="control-label">发送的部门 :</label>

              <div class="controls">

                <select id="province" class="zzjg_sel1"  name="province" ></select>
				<select id="city"   class="zzjg_sel1" name="office" ></select>

              </div>
		  	 </div>
		  	 
		  	 
		  	 
            <div class="form-actions">

              <input type="submit" class="btn btn-success" id="ac1" value="通过">
              <input type="submit" class="btn btn-success" id="ac2"  value="不通过">

            </div>
           
		  	</form> 
		  	 
		  	 
		  	 
             
               	 
               	 
            



</div>
  

<!--End-breadcrumbs-->









<!--end-main-container-part-->







<script src="js/jquery.min.js"></script> 
  <script type="text/javascript" charset="utf-8" src="js/bumen.js"></script>
<script type="text/javascript" charset="utf-8" src="js/bumenjs.js"></script> 



<script type="text/javascript">

//jquery实现不同的submit跳转到不同的表单
$(document).ready(function(){
	
	
	init("province","","city","");
	$("#ac1").focus(function(){
	    
		$("#loginform").attr('action','MessageServlet?method=xsby');
	    $("#loginform").submit();

	  });
	$("#ac2").focus(function(){
	    
		$("#loginform").attr('action','MessageServlet?method=xsnotby');
	     $("#loginform").submit();

	  });
	
	
});

 

</script>

</body>

</html>
