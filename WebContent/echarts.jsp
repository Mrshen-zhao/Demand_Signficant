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




<!--Header-part-->

<div id="header">

  <h1><a href="dashboard.html">Matrix Admin</a></h1>

</div>

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>图表联动展示</a>

  <ul>

    <li class="active"><a href="echarts.jsp"><i class="icon icon-home"></i> <span>图表联动展示</span></a> </li>
    <li ><a href="control.jsp"><i class="icon icon-home"></i> <span>返回上一页</span></a> </li>





  </ul>

</div>

<!--sidebar-menu-->



<!--main-container-part-->

<div id="content">

	<select id="information">
		<option value="insattr">机构属性</option>
		<option value="belongarea">归属区域</option>
		<option value="totime">发布时间</option>
		<option value="togemodern">技术需求合作 </option>
		<option value="vocation">需求技术应用行业</option>
	
	</select>
	
	<select id="echartstype">
		<option value="bar">柱状图</option>
		<option value="line">折线图</option>
		<option value="pie">饼图</option>
	
	</select>
	<button id="select">查询</button>

 <div id="main" style="width: 600px;height:400px;"></div>
 <div id="table"></div>
 </div>


<script src="js/jquery.min.js"></script> 


<script src="echarts/echarts.min.js"></script>


<script type="text/javascript">
//var option;//全局
var k=0;//行数
var tElementId="";//表示触发变颜色的序列号


	$("#select").click(function () {
		
		var jsobj="";
		 k=0;//表示那个行数
		//获取图表的类型
		var echartstype=$("#echartstype").val();
		
		
		//获取查询条件
		var information=$("#information").val();
		//var informationtext=$("#information").text();
		
		echarts.init(document.getElementById('main')).dispose();//销毁前一个实例
		
		// 基于准备好的dom，初始化echarts实例,先销毁，在初始化
		var myChart = echarts.init(document.getElementById('main'));
		$.ajax({
		    type: "post",
		    url:"MessageServlet?method=echarts",
		    async:false,
		    cache:true,
		    data:{"information":information},
		    success:function (data) {
		    	
		        // 指定图表的配置项和数据
		        
		        //json字符串
		       // var js=data;
		      //json字符串转为json对象
		        jsobj=JSON.parse(data)
		        
		        
		        //往table中显示先出来的数据
		        var text = "<table class=\"table table-hover table-striped table-bordered table-sm\" id=\"resultshow\">\n" +
				"\t\t<tr>\n" +
				"\n" +
				"\t\t\t<th style='text-align: center;color: red'>id</th>\n" +
				"\t\t\t<th style='text-align: center;color: red'>名称</th>\n" +
				"\t\t\t<th style='text-align: center;width: 100px;color: red'>次数</th>\n" +
				"\t\t</tr>";
                    for (i = 0; i <jsobj.length; i++) {
                        text += "<tr id='"+k+"'  onclick='liandong(this.id)'>" +
                        	     "<td>"+k+"</td>"+
                                 "<td>" + jsobj[i].leibie + "</td>" +
                                 "<td>" + jsobj[i].num+ "</td>" +
                            "</tr>";
                            k++;
                    }
                    text += "</table>";
                    
                    $("#table").html(text);
		       
		        //将json字符串存储在两个一维数组中
		        let xxx=[];
		        let yyy=[];
		        
		        for(let i=0;i<jsobj.length;i++){
		            xxx.push(jsobj[i].leibie);
		            yyy.push(jsobj[i].num)
		        }
		        //柱状图,折线图显示
		        if (echartstype!="pie") {
		        	tElementId=-1;
		        	 option = {
				            title: {
				                text: '河北征集图表显示'
				            },
				            tooltip: {},
				            legend: {
				            	 data:['数据量']
				            },
				            xAxis: {
				                data:xxx,
				                
				                axisLabel: {
                                    //横坐标全部显示
                                    interval: 0,
                                    //横坐标倾斜45度
                                    rotate: -45,
                                }
				            },
				            yAxis: {},
				            series: [{
				                name:'数据量',//控制图例的显示，legend里的data可以不写
				                //图的类型
				                type:echartstype,
				                data: yyy,//xAxis的data必须和series的data一一对应
				                itemStyle:
								{
									normal: {
										//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
										color: function (params) {
											var colorList = ['red', '#3398DB'];
											var key = params.dataIndex;
											if(params.dataIndex==tElementId)
												return colorList[0];
											else
												return colorList[1];


										}
									}
								}
				                
				            }]
				        };

				}else{//如果选则的是饼图的话
					//转换数据的格式
					   var array=[];
                       var selected = {};
                       for (var i=0;i<xxx.length;i++){
                    	   //构造[{value:....,name:....}]格式的数据
                           array.push({value:yyy[i],name:xxx[i]});
                           //object，图例的选中状态
                           selected[xxx[i]] = i<6;
                       }
					
					
					option = {
			        	    title: {
			        	        text: '河北征集图表显示',
			        	        
			        	        left: 'center'
			        	    },
			        	    tooltip: {
			        	        trigger: 'item',
			        	        formatter: '{a} <br/>{b} : {c} ({d}%)'
			        	    },
			        	    legend: {
			        	    	 	type:'scroll',
	                                orient: 'vertical',
	                                left: 10,
	                                //如果 data 没有被指定，会自动从当前系列中获取。多数系列会取自 series.name 或者 series.encode 的 seriesName 所指定的维度
	                                data: xxx,
	                               // selected:selected,
			        	    },
			        	    series: [
			        	        {
										  name: '出现次数',
	                                  	  type: 'pie',
	                                   	  radius: '55%',
	                                      center: ['50%', '60%'],
	                                   	  data: array,//name属性控制图例的显示
	                                      emphasis: {//高亮的扇区和标签样式
	                                      itemStyle: {
	                                    	//图形阴影的模糊大小。该属性配合 shadowColor,shadowOffsetX, shadowOffsetY 一起设置图形的阴影效果。
	                                      shadowBlur: 10,
	                                      shadowOffsetX: 0,//阴影水平方向上的偏移距离。
	                                      shadowColor: 'rgba(0, 0, 0, 0.5)'//阴影颜色
			        	                }
			        	            }
			        	        }
			        	    ]
			        	};
					
					
					
				}
		        
		        // 使用刚指定的配置项和数据显示图表。
		        myChart.setOption(option);
		        
		        myChart.on('click', function (params) {
					// //alert(params.name);
					// alert(params.dataIndex);
					var dataIndex = params.dataIndex;
					//alert(dataIndex);
				
					for (var m = 0; m <k; m++) {
						$("#" + m).css({"font-size": "100%", "color": "black"});
					}
					$("#" + dataIndex).css({"font-size": "200%", "color": "blue"});

					myChart.clear();
					tElementId=dataIndex;
					myChart.setOption(option,false);
					scrollPosition(dataIndex);
					tElementId=0;
				});
		        
		    },//成功函数结束
		    error:function () {
		        alert("生成图表出错")
		    }
		})
		
		
	});
	
	
	
	function liandong(event) {
		tElementId=0;
		tElementId=event;
			for (var m = 0; m < k; m++) {
				$("#" + m).css({"font-size": "100%", "color": "black"});
			}
			$("#" + tElementId).css({"font-size": "200%", "color": "blue"});
		var myChart = echarts.init(document.getElementById('main'));
			myChart.clear();
			myChart.setOption(option);
			scrollPosition1();
		tElementId=0;
	}
        
	
	
	// 控制页面滚动到指定位置
	function scrollPosition(pElementId) {
		var tTop = jQuery("#" + pElementId).offset().top;  //得到控件Top
		var tWindowHeight = jQuery(window).height(); //浏览器可视窗口高度
		var tElementHeight = jQuery("#" + pElementId).height(); //控件高度
		var tScrollTop = tTop - tWindowHeight * 0.3 - tElementHeight * 0.5; //让控件中心位于可视窗口3分之1处
		jQuery('html, body').animate({
			scrollTop: tScrollTop
		}, 1000);
	}
	// 控制页面滚动到指定位置
	function scrollPosition1() {
		var tTop = jQuery("#main").offset().top;  //得到控件Top
		var tWindowHeight = jQuery(window).height(); //浏览器可视窗口高度
		var tElementHeight = jQuery("#main").height(); //控件高度
		var tScrollTop = tTop - tWindowHeight * 0.3 - tElementHeight * 0.5; //让控件中心位于可视窗口3分之1处
		jQuery('html, body').animate({
			scrollTop: tScrollTop
		}, 1000);
	}
	
	
    </script>

</body>

</html>
