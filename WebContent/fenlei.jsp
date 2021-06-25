<%@page import="User.Area"%>
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

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">

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



<!--close-top-Header-menu-->



<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>分类检索</a>

  <ul>

    <li class="active"><a href="fenlei.jsp"><i class="icon icon-home"></i> <span>分类检索</span></a> </li>
    <li ><a href="control.jsp"><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>





  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!--breadcrumbs-->

  
	<%  
          
          		String sql1 = "select * from area";
          		List<Area> lst=MessageService.getarea(sql1);
				request.setAttribute("messlist", lst); 
          	
          	
         
				
				%>
   			
    		<div class="control-group">

              <label class="control-label">查询条件 :</label>

              <div class="controls">
					<select name="whatinfo" id="whatinfo" >
              	 		<option value="companyname">机构名称</option>
              	 		<option value="belongarea">归属地域</option>
              	 		<option value="totime">发布时间</option>
              	 		<option value="insattr">机构属性</option>
              	 		<option value="togemodern">技术需求合作模式</option>
              	 		
               			
               		</select>
               		<input type="text" name="conditioninfo"  id="conditioninfo"  placeholder="请输入条件" />	
					<select name="areainfo" id="areainfo" >
              	 		<c:forEach items="${messlist}" var="mess">
              	 		<option value="${mess.areaname}">${mess.areaname}</option>
               			</c:forEach>
               		</select>
               		<select name="insattrinfo"  id="insattrinfo">
              	 		<option value="公司">公司</option>
              	 		<option value="研究机构">研究机构</option>
              	 		<option value="高等院校">高等院校</option>
              	 		<option value="其他">其他</option>
               		</select>	
               		
               		
              </div>

            </div>
            
         
            
            
            
            <div class="form-actions">

              <input type="submit"  id="searchinfo" class="btn btn-success" value="查询">
              

            </div>
           

<table class="layui-hide" id="test" lay-filter="test"></table>
		  	 
<script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>  	 
		  	



<!-- 查看信息结束 -->
</div>
  




<script src="js/jquery.min.js"></script> 
<script src="layui/layui.js" charset="utf-8"></script>
<script src="layui/layui.all.js" charset="utf-8"></script>



<script type="text/javascript">
var whatinfo;
var whatinfomessage;
$(function (){
	$("#conditioninfo").show();
	$("#areainfo").hide();
	$("#insattrinfo").hide();
	//发送请求时传递的两个值
	
	
	
	//选择框的内容改变时，界面的显示发生改变
	 $("#whatinfo").change(function () {
		 whatinfo=$("#whatinfo").val(); 
		 if (whatinfo=="belongarea") {
			$("#conditioninfo").hide();
			$("#areainfo").show();
			$("#insattrinfo").hide();			
		}else if (whatinfo=="insattr") {
			$("#conditioninfo").hide();
			$("#areainfo").hide();
			$("#insattrinfo").show();
			
		}else{
			$("#conditioninfo").show();
			$("#areainfo").hide();
			$("#insattrinfo").hide();
			
		}
	 
	 });
	

	
});



layui.use('table', function(){
    var table = layui.table;
    
    
    
    //第一个实例
    table.render({
      elem: '#test'//获取存放数据的table容器，即是table的id
      ,height: 515
      ,method:'post'
      ,cache:false //清除缓存
      ,url: 'MessageServlet?method=layuifind' //数据接口，最终传值数据到jsp的方法 
      ,page: true //开启分页
      ,toolbar:true
      ,cols: [[ //表头
    	  {field: 'id', title: 'ID', width:150,sort: true}
    	  ,{field: 'companyname', title: '机构名称', width:150,sort: true}
          ,{field: 'contacts', title: '联系人', width:150,sort: true} 
          ,{field: 'comaddress', title: '地址', width: 150,sort: true}
          ,{field: 'techchat', title: '需求概述', width: 150,sort: true}
          ,{field: 'belongarea', title: '所在地域', width: 150,sort: true}
          ,{field: 'subject', title: '学科分类', width: 150,sort: true}
          ,{field: 'money', title: '投入资金总额', width: 150,sort: true}
          ,{field: 'techname', title: '技术需求名称', width: 150,sort: true}
          ,{field: 'office', title: '管理处室', width: 150,sort: true}
          ,{field: 'belongcom', title: '归口管理不部门', width: 150,sort: true}
          ,{field: 'totime', title: '发布时间', width: 150,sort: true}
          ,{field: 'xsshenhe', title: '形式审核结果', width: 150,sort: true}
          ,{field: 'bmshenhe', title: '部门审核结果', width: 150,sort: true}
          ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
          
          
      ]]
    });
    
    //监听行工具事件//obj是当前行对象
    table.on('tool(test)', function(obj){
      var data = obj.data;
      //console.log(obj)
      if(obj.event === 'del'){
    	  var id=data.id;
    	  //alert(id)
    	  var data={"id":id};
    	  $.post("MessageServlet?method=deletemessinfo",data,function(resp){
    		  
				if (resp=="删除成功") {
					alert(resp);
					location.href="fenlei.jsp";
					
				}
			},"json");  
      }else if(obj.event === 'edit'){
    	   var id=data.id;
    	   location.href="MessageServlet?method=adminfindflinfo&id='"+id+"'"
          
          
          } 
      
      
      
    });
  
    
    
    
   
    

    $("#searchinfo").click(function(){
  	
    	 whatinfo=$("#whatinfo").val(); 
 		if (whatinfo=="belongarea") {
 			whatinfomessage=$("#areainfo").val();
 		}else if (whatinfo=="insattr") {
 			whatinfomessage=$("#insattrinfo").val();
 		}else{
 			whatinfomessage=$("#conditioninfo").val();
 		}
  	 
  	    table.render({
  	        elem: '#test'//获取存放数据的table容器，即是table的id
  	        ,height: 515
  	        ,method:'post'
  	        ,cache:false //清除缓存  
  	        ,url:"MessageServlet?method=fenleisearch"//数据接口，最终返回数据到jsp的方法 
  	       	,where:{whatinfo:whatinfo,whatinfomessage:whatinfomessage}
  	        ,page: true //开启分页
  	        ,toolbar:true
  	        ,cols: [[ //表头
  	        	
  	        	
  	        	
  	        	{field: 'id', title: 'ID', width:150,sort: true}
  	        	,{field: 'companyname', title: '机构名称', width:150,sort: true}
  	            ,{field: 'contacts', title: '联系人', width:150,sort: true} 
  	            ,{field: 'comaddress', title: '地址', width: 150,sort: true}
  	            ,{field: 'techchat', title: '需求概述', width: 150,sort: true}
  	            ,{field: 'belongarea', title: '所在地域', width: 150,sort: true}
  	            ,{field: 'subject', title: '学科分类', width: 150,sort: true}
  	            ,{field: 'money', title: '投入资金总额', width: 150,sort: true}
  	            ,{field: 'techname', title: '技术需求名称', width: 150,sort: true}
  	            ,{field: 'office', title: '管理处室', width: 150,sort: true}
  	            ,{field: 'belongcom', title: '归口管理不部门', width: 150,sort: true}
  	            ,{field: 'totime', title: '发布时间', width: 150,sort: true}
  	            ,{field: 'xsshenhe', title: '形式审核结果', width: 150,sort: true,}
  	            ,{field: 'bmshenhe', title: '部门审核结果', width: 150,sort: true,}
  	          ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
  	            
  	        ]]
  	      });
  	  
   });

    });

 

</script>

</body>

</html>
