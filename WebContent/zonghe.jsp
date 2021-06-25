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




<!--Header-part-->

<div id="header">

  <h1><a href="dashboard.html">河北征集</a></h1>

</div>

<!--close-Header-part--> 








<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>综合检索</a>

  <ul>

    <li class="active"><a href="zonghe.jsp"><i class="icon icon-home"></i> <span>综合检索</span></a> </li>
    <li ><a href="control.jsp"><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>





  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

<!-- 综合查询开始 -->

 <div class="wrap-container clearfix">
    <div class="column-content-detail">
        <div class="layui-inline tool-btn">
            <button class="layui-btn layui-btn-small layui-btn-normal addBtn" id="add"><i class="layui-icon">&#xe654;</i></button>
        </div>
        <div id="addCondition">
            <div id='0'>
                <div class='layui-inline' style="padding-left: 43px">
                    <select lay-filter='status' id='two0'>
                        <option value='companyname'>机构全称</option>
                        <option value='belongcom'>归口管理单位</option>
                        <option value='belongarea'>所在地域</option>
                        <option value='lawperson'>法人代表</option>
                        <option value='contacts'>联系人</option>
                        
                        <option value='techname'>技术需求名称</option>
                        <option value='keyword'>关键字</option>
                        <option value='money'>拟投入资金总额</option>
                       
                        <option value='subject'>学科分类</option>
                        <option value='domain'>需求技术所属领域</option>
                        <option value='vocation'>需求技术应用行业</option>
                        <option value='office'>管理处室</option>
                        <option value='xsshenhe'>形式审核结果</option>
                        <option value='bmshenhe'>部门审核结果</option>
                        
                    </select>
                </div>
                <div class='layui-inline'>
                    <input type='text' id='three0' placeholder='请输入标题' >
                </div>
                <div class='layui-inline'>
                    <select lay-filter='status' id='four0'>
                        <option value='='>精确</option>
                        <option value='like'>模糊</option>
                    </select>
                </div>
            </div>


        </div>
        <button class="layui-btn layui-btn-normal" lay-submit="search" id="search">查询</button>
        <br>
    </div>
</div>
 
 
 
 <!-- 综合查询结束 -->
 
 
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>  


<!-- 综合查询结束 -->	

</div>
  


<script src="js/jquery.min.js"></script> 
<script src="layui/layui.js" charset="utf-8"></script>
<script src="layui/layui.all.js" charset="utf-8"></script>



<script type="text/javascript">

//综合查询
var k=1;

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
    		  alert(resp);
				if (resp=="删除成功") {
					location.href="fenlei.jsp";
				}
			},"json");
        
        
      } 
    });
  
    
    
  $("#search").click(function(){
	  //获取文本框的值
	  //添加默认的查询条件
	  var conditionnum=k-1;
	  if ($("#three0").val()=="") {
		alert("第一个文本框输入为空");
		return ;
	}
	  //js的字符串拼接
	  //var test=$('#three'+hhh+'').val();
	  //alert(test)
	  var json=[];
	
	//得到加了几个查询的条件
	var i=0;
	  for(i;i<=conditionnum;i++){
			 var jsonobj={};
			 
			 if (i==0) {
				jsonobj.one="and";
			 }else {
				jsonobj.one=$('#one'+i+'').val();
			}
			 jsonobj.two=$('#two'+i+'').val();
			 jsonobj.three=$('#three'+i+'').val();
			 jsonobj.four=$('#four'+i+'').val();
			  json.push(jsonobj);
		 }
		//转为json格式
	  	var sjson=JSON.stringify(json);
		//alert(sjson);
		
	 
	    table.render({
	        elem: '#test'//获取存放数据的table容器，即是table的id
	        ,height: 515
	        ,method:'post'
	        ,cache:false //清除缓存  
	        ,url:"MessageServlet?method=layuisearch"//数据接口，最终返回数据到jsp的方法 
	       	,where:{json:sjson}
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
	  
 });
    
  });
  
  

  $(function () {
        //添加条件
        $("#add").click(function (){
            if(k<=5){
                var text="<div id='"+k+"'><div class='layui-inline'>" +
                    "                <select lay-filter='status' id='one"+k+"'>" +
                    "                    <option value='and'>并</option>" +
                    "                    <option value='or'>或</option>" +
                    "                </select>" +
                    "            </div>" +
                    "            <div class='layui-inline'>" +
                    "                <select lay-filter='status' id='two"+k+"'>" +
                    "            <option value='companyname'>机构全称</option>" +
                    "            <option value='belongcom'>归口管理单位</option>" +
                    "            <option value='belongarea'>所在地域</option>" +
                    "            <option value='lawperson'>法人代表</option>" +
                    "            <option value='contacts'>联系人</option>" +
                    "            <option value='techname'>技术需求名称</option>" +
                    "            <option value='keyword'>关键字</option>" +
                    "            <option value='money'>拟投入资金总额</option>" +
                    "            <option value='subject'>学科分类</option>" +
                    "            <option value='domain'>需求技术所属领域</option>" +
                    "            <option value='vocation'>需求技术应用行业</option>" +
                    "            <option value='office'>管理处室</option>"+
                    "            <option value='xsshenhe'>形式审核结果</option>" +
                    "            <option value='bmshenhe'>部门审核结果</option>" +
                    "                </select>" +
                    "            </div>" +
                    "            <div class='layui-inline'>" +
                    "                <input type='text' id='three"+k+"' placeholder='请输入内容' >" +
                    "            </div>" +
                    "            <div class='layui-inline'>" +
                    "                <select lay-filter='status' id='four"+k+"'>" +
                    "                    <option value='='>精确</option>" +
                    "                    <option value='like'>模糊</option>" +
                    "                </select>" +
                    "            </div>"
                $("#addCondition").append(text);   
                k+=1;
            }
            
        });
       


    })
 

</script>

</body>

</html>
