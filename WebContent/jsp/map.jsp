<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@ page import="com.cn.web.school.po.Record" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}		
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}	
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=G3GKeZsowwfaOlY71VAd0TfR"></script>
<title>添加多个标注点</title>
</head>
<body>
      <input type="hidden" id="jsondate" value=${jsoninfo} >
      <div id="allmap"></div>		 
</body>
</html>
<script type="text/javascript">

    var attenCode="<%=session.getAttribute("attendcode")%>";
    var x = "<%=session.getAttribute("longitude")%>";
    var y = "<%=session.getAttribute("latitude")%>";
    var deviation="<%=session.getAttribute("deviation")%>";
    
    
    var jsonst = document.getElementById("jsondate").value;
    //eval('(' + jsonst+ ')');
    //var obj = JSON.parse("jsonst");
    //alert("json:"+jsonst);
    

   <%--  var json = "<%=session.getAttribute("jsoninfo")%>";
    alert(json); --%>
/*     $.ajax( {  
        type : "POST",  
        url : "mapInformation",  
        data: "json",  
        success : function(msg) { 
        json = JSON.parse(msg);
        alert("success");
    } */
	//var x = document.getElementById("fabux").value;
	//var y = document.getElementById("fabuy").value;
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point1 = new BMap.Point(x,y)
    map.centerAndZoom(point1, 15);     // 初始化地图,设置中心点坐标和地图级别
    map.enableScrollWheelZoom();  
	
	var marker1 = new BMap.Marker(point1);  // 创建标注
	map.addOverlay(marker1);               // 将标注添加到地图中
	marker1.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	var circle = new BMap.Circle(new BMap.Point(x,y),deviation,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
	 map.addOverlay(circle);
	
	
	var points = [];  // 添加海量点数据
	var markerArr = [  
                    { title: "隆力奇", point: "120.038242,30.228395", address: "学号:1212212"},  
                    { title: "黑旋风", point: "120.040016,30.228258", address: "学号:456564345"},  
                    { title: "阿狸", point: "120.039971,30.229187", address: "学号:231213"}  
                ]; 
	
		 var myobj=eval(jsonst);  
		 for(var i=0;i<myobj.length;i++){  
		       //alert(myobj[i].id);         
		} 
	
        for (var i=0;i<myobj.length;i++) {
  		  var p0 = myobj[i].longitude; 
          var p1 = myobj[i].latitude; 
		  var p2 = myobj[i].studentCode; 
		  var p3 = myobj[i].valid; 
		  var p4 = "学号："+ p2 + " 状态： " + p3;
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
	
	
</script>
