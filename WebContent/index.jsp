<%@page import="User.Alldata"%>
<%@page import="User.Area"%>
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


<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>填写信息</a>

  <ul>

    <li class="active"><a href="index.jsp"><i class="icon icon-home"></i> <span>填写信息</span></a> </li>
	 <li ><a href="showProcess.jsp"><i class="icon icon-home"></i> <span>帮助文件</span></a> </li>
	 <li id="redictpassword" hidden="hidden"><a title="" href="redictpass.jsp"><i class="icon icon-home"></i> <span >修改密码</span></a></li>
	



  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->
  <!-- 标题栏开始 -->
  <div id="content-header">

    <div id="breadcrumb"> <h5 style="text-align: center;">你好，<%=request.getSession().getAttribute("username") %></h5>
    </div>
  </div>

  <!-- 标题栏结束 -->

    <!-- 修改信息 -->
  

          <form action="MessageServlet?method=addinformation&&factoryname=<%=request.getSession().getAttribute("factoryname") %>&&username=<%=request.getSession().getAttribute("username") %>"
          method="post" class="form-horizontal"  onsubmit="return myFunction()"  >
          
            
          
          <!-- 重新设置布局开始 -->
	<div class="row-fluid">
	<!-- 布局一开始 -->
           
    	<div class="span6">
    		<div class="widget-content nopadding">
    			<!-- 具体布局开始 -->
    		
    			<div class="control-group">

              <label class="control-label">机构全称 :</label>

              <div class="controls">

                <input type="text" class="span6" name="companyname"  id="companyname"
                 value="<%=request.getSession().getAttribute("factoryname") %>" readonly="readonly" />

              </div>

            </div>
            
             <div class="control-group">

              <label class="control-label">通讯地址 :</label>

              <div class="controls">

                <input type="text" class="span6" name="comaddress" id="comaddress" placeholder="通讯地址" />
                	<span id="comaddress11" style="color: red;font-size: 20px;"></span>
                

              </div>

            </div>
            
    		<div class="control-group">

              <label class="control-label">网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址 :</label>

              <div class="controls">

                <input type="text" class="span6" name="comwebsite" id="comwebsite"  placeholder="单位网址" />

              </div>

            </div>
    		
    		<div class="control-group">

              <label class="control-label">法人代表:</label>

              <div class="controls">

                <input type="text" class="span6" name="lawperson" id="lawperson" placeholder="法人代表" />
					<span id="lawperson11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>
            
             <div class="control-group">

              <label class="control-label">联系人 :</label>

              <div class="controls">

                <input type="text" class="span6" name="contacts"  id="contacts" placeholder="联系人" />
					<span id="contacts11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>
            
            <div class="control-group">

              <label class="control-label">手机 :</label>

              <div class="controls">

                <input type="text" class="span6" name="telphone" id="telphone" placeholder="手机" />
					<span id="telphone11" style="color: red;font-size: 20px;"></span>
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

                <input type="text" class="span6" name="belongcom" id="belongcom" placeholder="归口管理部门" />

              </div>
		  	 </div>
		  	 
		  	 
		  	 
		  	  <%  
          
          		String sql1 = "select * from area";
          		List<Area> lst=MessageService.getarea(sql1);
				request.setAttribute("meslist", lst); 
          	
          	
         
				
				%>
		  	 
		  	 
    	
    		<div class="control-group">

              <label class="control-label">所在地域 :</label>

              <div class="controls">
					<select name="belongarea" >
              	 		<c:forEach items="${meslist}" var="mes">
              	 		<option value="${mes.areaname}">${mes.areaname}</option>
               			</c:forEach>
               		</select>	
					
              </div>

            </div>
            
            <div class="control-group">

              <label class="control-label">电子邮箱 :</label>

              <div class="controls">

                <input type="text" class="span6" name="email" id="email" placeholder="电子邮箱"  id="email"/>
					<span id="email11" style="color: red;font-size: 20px;"></span>
              </div>

            </div>
            
             <div class="control-group">

              <label class="control-label">邮政编码:</label>

              <div class="controls">

                <input type="text" class="span6" name="postal"  id="postal" value="<%=request.getSession().getAttribute("postal1") %>" />

              </div>

            </div>
            
               
            <div class="control-group">

              <label class="control-label">固定电话 :</label>

              <div class="controls">

                <input type="text" class="span6" name="phone" id="phone" placeholder="固定电话" />
					<span id="phone11" style="color: red;font-size: 20px;"></span>
              </div>
              

            </div>
            
               <div class="control-group">

              <label class="control-label">传真 :</label>

              <div class="controls">

                <input type="text" class="span6" name="fax" id="fax" placeholder="传真" />

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
					<input type="radio" name="insattr" checked="checked" value="三个一百企业" />“三个一百”企业
                  	<input type="radio" name="insattr" value="高新技术企业"/>高新技术企业
					<input type="radio" name="insattr" value="科技小巨人企业" />科技小巨人企业
					<input type="radio" name="insattr" value="重点研究机构" />重点研究机构
					<input type="radio" name="insattr" value="高校" />高校	

                 </label>


              </div>

          </div>
            
             
		  	 
		  	 <div class="control-group">

              <label class="control-label">机构简介 :</label>

              <div class="controls">

                <textarea rows="8" cols="15" name="summary" id="summary" placeholder="主要包括基本情况、现有研究基础等，限500字以内"></textarea>
                <span  style="color: red;font-size: 20px;">可以拖动右下角调节文本框大小</span>

              </div>
		  	 </div>
		  	 
		  	 
		  	 
		  	 
		  <div class="row-fluid">

    			<div class="span6">

        			<div class="widget-content nopadding">
        			
        			 	<div class="control-group">

              			<label class="control-label">技术需求名称 :</label>

             				 <div class="controls">

                					<input type="text" class="span6" name="techname" id="techname" placeholder="技术需求名称" />
               						 <span id="techname11" style="color: red;font-size: 20px;"></span>
					

             				 </div>
		  			 	</div>
        			
					</div>
				</div>
				
				<div class="span6">

        			<div class="widget-content nopadding">
        				
        			 	<div class="control-group">

              			<label class="control-label">需求时限 :</label>

             				 <div class="controls">

                					<input type="text" class="span6" name="totime" id="totime" placeholder="需求时限" />
               						 <span id="totime11" style="color: red;font-size: 20px;"></span>
					

             				 </div>
		  			 	</div>
        			
        			
					</div>
				</div>
				
		</div>		  
		

		  	 <div class="control-group">

              <label class="control-label">重大科技需求概述 :</label>

              <div class="controls">

                <textarea rows="15" name="techchat" id="techchat" placeholder="1、主要问题（需要解决的重大技术问题，限500字以内）
2、技术关键（所需的关键技术、主要指标，限500字以内）
3、预期目标（技术创新性、经济社会效益，限500字以内）"></textarea>
				<span  style="color: red;font-size: 20px;">可以拖动右下角调节文本框大小</span>

              </div>
              
		  	 </div>
		  	 
		  	 <div class="control-group">

             	 <label class="control-label">关键词:</label>

              	<div class="controls">

                	<input type="text" class="span4" name="keyword1" id="keyword1" placeholder="关键词一" />
                	<input type="text" class="span4" name="keyword2" id="keyword2" placeholder="关键词二" />
                	<input type="text" class="span4" name="keyword3" id="keyword3" placeholder="关键词三" />
                	<input type="text" class="span4" name="keyword4" id="keyword4" placeholder="关键词四" />
                	<input type="text" class="span4" name="keyword5" id="keyword5" placeholder="关键词五" />
					
             	 </div>
		  	 </div>	
		  	 
		  	 
		  	  <div class="control-group">

             	 <label class="control-label">拟投入资金总额 :</label>

              	<div class="controls">

                	<input type="text" class="span4" name="money" id="money" placeholder="资金来源" />
					
             	 </div>
		  	 </div>
		  	 
		  	  <div class="control-group">

              <label class="control-label">技术需求合作模式：</label>
              
               	  <div class="controls">

                <label>

                    <input type="radio" name="togemodern" checked="checked" value="独立研发" />独立研发
 					<input type="radio" name="togemodern" value="委托研发"/>委托研发
					<input type="radio" name="togemodern" value="合作研发" />合作研发
					<input type="radio" name="togemodern" value="其他" />其他

                 </label>
	  

             	 </div>
              </div>
              
               <div class="control-group">

              <label class="control-label">合作意向单位 :</label>

              <div class="controls">

                <input type="text" class="span4" name="togecom" id="togecom" placeholder="合作意向单位" />
			<span id="togecom11" style="color: red;font-size: 20px;"></span>
				
              </div>
		  	 </div>
		  	 
		  	 
		  	 
		  	  <div class="control-group">

              <label class="control-label">研究类型：</label>
		  	 
		  	 <div class="controls">
		  	 	<label>
                  	<input type="radio" name="discuss" id="a" value="基础研究" checked="checked"/>基础研究
					<input type="radio" name="discuss" id="b" value="应用研究" />应用研究
					<input type="radio" name="discuss" id="b" value="应用研究" />应用研究
					<input type="radio" name="discuss" id="c" value="试验发展" />试验发展
					<input type="radio" name="discuss" id="d" value="研究与试验发展成果应用" />研究与试验发展成果应用
					 <input type="radio" name="discuss" id="e" value="技术推广与科技服务" />技术推广与科技服务
					 <input type="radio" name="discuss" id="f" value="生产性活动" />生产性活动
                 </label>
              </div>
              </div>
              
              
              
              <%
 	String sql="select * from alldate";
 	List<Alldata> meslist=MessageService.getalldate(sql);
 	request.setAttribute("messslist", meslist);
 	%>
              
              
               <div class="control-group" id="one">

              <label class="control-label">学科分类 :</label>

              <div class="controls">

               <select id="yewu" style="width:200px;">
 					<option value="0" >请选择....... </option>
 				<c:forEach items="${messslist}" var="mess">
 					<option value="${mess.typeid}">${mess.yewu}</option>
             	</c:forEach>
 			</select>
 			
 			<select id="xsyewu"  name="subject" style="width:200px;">
 					<option value="0">请选择.......</option>
 			
 			</select>
 			

              </div>
		  	 </div>
              
        <div class="control-group" id="two">
			<label class="control-label">需求技术所属领域</label>

              <div class="controls">

                <label>

                  <input type="checkbox" name="domain"  value="电子信息" /> 电子信息

                 
                   <input type="checkbox" name="domain"  value="光机电一体化"/>光机电一体化

                 
                  <input type="checkbox" name="domain"  value="生物技术与制药"/>生物技术与制药

                  
                  <input type="checkbox" name="domain"  value="新材料及应用"/>新材料及应用

                 
                  <input type="checkbox" name="domain"  value="现代农业"/>现代农业

                 
                  <input type="checkbox" name="domain"  value="新能源与高效节能"/>新能源与高效节能

                  
                  <input type="checkbox" name="domain"  value="资源与环境"/>资源与环境

                  
                 
                  </label>
                  <label>
                   	<input type="checkbox" name="domain"  value="高技术服务业"/>高技术服务业
                  
                  	<input type="checkbox" name="domain"  value="海洋"/>海洋
                  
                 	 <input type="checkbox" name="domain"  value="社会公共事业"/>社会公共事业
                  
                 	 <input type="checkbox" name="domain"  value="医疗卫生"/>医疗卫生
                  
                 	 <input type="checkbox" name="domain"  value="其他"/>其他
                  
                  </label>


              </div>
		 </div>
               	 
               	 
               	 
               	   <div class="control-group" id="three">

              <label class="control-label">需求技术应用行业 :</label>

              <div class="controls">

                <input type="text" class="span4" name="vocation" placeholder="需求技术应用行业" />

              </div>
		  	 </div>
		  	 
		  	 
		  	 
             
               	 
               	 
            
		  	 
		  
               

         

            <div class="form-actions">

              <input type="submit" class="btn btn-success" value="保存并提交">

            </div>

          </form>

     
        
        
        
  
<!-- 结束修改信息 -->






</div>
  

<!--End-breadcrumbs-->









<!--end-main-container-part-->





 

<script src="js/jquery.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="js/data.js"></script>
<script type="text/javascript" charset="utf-8" src="js/datajs.js"></script> 

<script type="text/javascript">
$(document).ready(function(){
	$("#redictpassword").hide();
	
	if (<%=request.getSession().getAttribute("premission") %>=="1") {
		$("#redictpassword").show();
	}
	
	
	init("province","","city","");
	
	$("#one").hide();
	$("#two").hide();
	$("#three").hide();
	$("input[type='radio']").on("click",function () {
        if($("input[id='a']:checked").val()=="基础研究"){
        	$("#one").show();
        	$("#two").hide();
        	$("#three").hide();
        }else{
        	$("#one").hide();
        	$("#two").show();
        	$("#three").show();
        }
    });
	
	 $("#summary").blur(function(){
		    summary=$("#summary").val();
		    length=summary.length;
		   if (length>500) {
			  alert("机构简介不能查过500字");
			  
		} 
		   if (summary=="") {
			   alert("机构简介不能为空");
			   
		}
		  });
	 
	 $("#techchat").blur(function(){
		    techchat=$(this).val();
		    length=techchat.length;
		   if (length>500) {
			  alert("需求概述不能查过500字");
		}
		   if (techchat=="") {
			   alert("需求概述不能为空");
		}
		  });
	 $("#comaddress").blur(function(){
		    comaddress=$(this).val();    
		    if (comaddress=="") {
				  $("#comaddress11").text("通讯地址不能为空");
			}else{
				$("#comaddress11").text("格式正确");
			}    
		  });
	 $("#contacts").blur(function(){
		    contacts=$(this).val();    
		    if (contacts=="") {
				  $("#contacts11").text("联系人不能为空");
			}else{
				$("#contacts11").text("格式正确");
			}    
		  });
	 
//	 $("#belongarea").blur(function(){
//		 belongarea=$(this).val();    
//		 if (belongarea=="") {
//			  $("#belongarea11").text("所在地域不能为空");
//		}else{
//			$("#belongarea11").text("格式正确");
//		}    
//		  });
	 
	 $("#email").blur(function(){
		 email=$(this).val();
		 if (email=="") {
			  $("#email11").text("邮箱不能为空");
		}
		 else if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email) == false) {
			 
			 $("#email11").text("邮箱格式不正确");
		}else{
			$("#email11").text("格式正确");
		}	    
		  });
	 $("#lawperson").blur(function(){
		 lawperson=$(this).val();
		 if (lawperson=="") {
			  $("#lawperson11").text("法人代表不能为空");
		}else{
			$("#lawperson11").text("格式正确");
		}	    
		  });
	 
	 $("#phone").blur(function(){
		 phone=$(this).val();
		 if (phone=="") {
			  $("#phone11").text("联系电话不能为空");
		}else{
			$("#phone11").text("格式正确");
		}	    
		  });
	 $("#techname").blur(function(){
		 techname=$(this).val();
		   if (techname=="") {
			  $("#techname11").text("需求名称不能为空");
		}else{
			$("#techname11").text("格式正确");
		}
		  });
	 $("#togecom").blur(function(){
		 togecom=$(this).val();
		 if (togecom=="") {
			  $("#togecom11").text("合作对象不能为空");
			  
		}else{
			$("#togecom11").text("格式正确");
		}    
		  });
	 $("#keyword2").focus(function(){
		    keyword1=$("#keyword1").val();
		   if (keyword1=="") {
			  alert("请输入关键词一");
			  
		} 
	
		  });
	 $("#keyword3").focus(function(){
		    keyword2=$("#keyword2").val();
		   if (keyword2=="") {
			  alert("请输入关键词二");
			  
		} 
	
		  });
	 $("#keyword4").focus(function(){
		    keyword3=$("#keyword3").val();
		   if (keyword3=="") {
			  alert("请输入关键词三");
			  
		} 
	
		  });
	 $("#keyword5").focus(function(){
		    keyword4=$("#keyword4").val();
		   if (keyword4=="") {
			  alert("请输入关键词四");
			  
		} 
	
		  });
	 
	 
	 
	 $("#yewu").change(function () {
			var obj=$("#yewu>option:selected");
			//当改变后选择的是请选择的时候 不执行后面的操作
			if (obj.val()=="0") {
				$("#xsyewu").empty();
				$("#xsyewu").append("<option value='0'>请选择.......</option>");
				return;
			}
			
			var xtypeid=obj.val();
			
			var data={"xtypeid":xtypeid}
			//alert(xtypeid);
			$.post("MessageServlet?method=xsdata",data,function(resp){
				//首先清空级联二框中的内容
				$("#xsyewu").empty();
				$("#xsyewu").append("<option value='0'>请选择.......</option>");
				//将前台响应的数据展示在select中
				$.each(resp,function(i,n){
					$("#xsyewu").append("<option value='"+n.xsyw+"'>"+n.xsyw+"</option>");
				})
			},"json");
			 
			 
			 
		});
	 
	 
	 
});





</script>


</body>

</html>
