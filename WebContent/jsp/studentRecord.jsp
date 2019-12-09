<%@page import="com.cn.web.school.po.Student"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.cn.web.school.po.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="no-js">
<head>
<title>签到平台登录</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css">
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script src="js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=G3GKeZsowwfaOlY71VAd0TfR"></script>
	<style>	
		#allmap{width: 0;height: 0;}
	.containerS{width:100%; height:700px; float:left;margin-left:20%;margin-top:5%;}
	.blockS { height: 100%;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px;}
	.blockS2 { height: 100%; border:0;  background-color: blue; background-color: rgba(165, 26, 15, 0.75);}
	</style>
</head>
<body>
<%
Student student = (Student)session.getAttribute("student1");
//判断user是否为空，如果不为空才操作以下。不然会报空指针异常。 
if(student != null){ 
 System.out.println("管理平台--Session数据获取--studentevent.jsp: "+student.getCode()+student.getName());
} else{
	 System.out.println("管理平台--Session数据获取--studentevent.jsp: 未获取Session");
}
String name = student.getCode();
%> 
<div id="allmap"></div>
<input type="hidden" id = "json" value=${jsoninfo} >

<!--   <div data-role="header">
   <a href="" data-transition="slide" data-direction="reverse" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left">主页</a>
    <h1>&nbsp;</h1>
  </div> -->
  
  <p style="color:red;">${message}</p>
  <table data-role="table" data-mode="columntoggle" class="ui-responsive" id="test">
      <thead>
         <tr>
          <th data-priority="1">ID</th>
          <th data-priority="1">考勤标识</th>
          <th data-priority="1">学生学号</th>
          <th data-priority="1">点击签到</th>
        </tr>
      </thead>
      <tbody>
			<c:forEach var="atteninfor" items="${atteninfor}">
						<tr>						
						    <td><input type="text" readonly="readonly" name=${atteninfor.id} value=${atteninfor.id}></td>	
							<td><input type="text" readonly="readonly" name=${atteninfor.id} value=${atteninfor.attendcode}></td>	
							<td><input type="text" readonly="readonly" name=${atteninfor.id} value=<%=name%>></td>				
							<td><input type="button" id=${atteninfor.id} onclick="return trya(this.id)" value="签     到">
						</tr>
			</c:forEach>
      </tbody>
    </table> 
</body>
</html>
<script>
// 百度地图API功能
var map = new BMap.Map("allmap");
//var point = new BMap.Point(120.33139778,30.87797445);
//map.centerAndZoom(point,12);
var x="";
var y="";

var geolocation = new BMap.Geolocation();
geolocation.getCurrentPosition(function(r){
	if(this.getStatus() == BMAP_STATUS_SUCCESS){
		var mk = new BMap.Marker(r.point);
		//map.addOverlay(mk);
		map.panTo(r.point);
		x = r.point.lng;
		y = r.point.lat;
		//alert('您的位置：'+r.point.lng+','+r.point.lat);
	}
	else {
		alert('failed'+this.getStatus());
	}        
},{enableHighAccuracy: true})

//alert("fun1 out:"+x+" "+y);

function trya(id)
{
	///alert("fun1 in:"+x+" "+y);
	
	   var a=document.getElementsByName(id);
   	   //alert("我又进来了啊"+a.length);
   	   for(var i=0;i<a.length;i++){
   	     // alert(a[i].value);
   	   }
   	    var form1 = document.createElement("form");  
	    form1.id = "form1";  
	    form1.name = "form1"; 
	    form1.target="studentFrame";
	  
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
	    input1.name = "studentCode";  
	    input1.value = a[2].value;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input1);  
	   
	    var input2 = document.createElement("input");  
	    // 设置相应参数  
	    input2.type = "hidden";  
	    input2.name = "longitude";  
	    input2.value = x;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input2); 
	    
	    var input3 = document.createElement("input");  
	    // 设置相应参数  
	    input3.type = "hidden";  
	    input3.name = "latitude";  
	    input3.value = y;  
	  
	    // 将该输入框插入到 form 中  
	    form1.appendChild(input3); 
	    
	    // form 的提交方式  
	    form1.method = "POST";  
	    // form 提交路径  
	    form1.action = "studentRecordinfo";  
	  
	    // 对该 form 执行提交  
	    form1.submit();  
	    // 删除该 form  
	    //document.body.removeChild(form1); 
	};
	

</script>
