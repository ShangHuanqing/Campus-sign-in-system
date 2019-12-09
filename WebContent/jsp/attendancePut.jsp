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
<link rel="stylesheet" type="text/css" href="css/Iframe.css" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script language="javascript" type="text/javascript" src="js/Blob.js"></script> 
<script language="javascript" type="text/javascript" src="js/FileSaver.js"></script> 
<script language="javascript" type="text/javascript" src="js/tableExport.js"></script> 
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=G3GKeZsowwfaOlY71VAd0TfR"></script>
<!--加载鼠标绘制工具-->
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<!--加载检索信息窗口-->
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
<title>考勤系统管理平台</title>
<style type="text/css">  
   body, html{width: 100%;height: 1000px;margin:0;font-family:"微软雅黑"; }/*  overflow-y: auto; */
   .container_shq{ width:100%; height:100%;}
   .container1_shq{ width:100%; height:35%;}
   .container2_shq{ width:100%; height:65%;}
   	#allmap {width: 100%; height:350px;}
	#result {width: 100%; font-size:12px;}
	table td input{border:0;width:80%;  }	
	dl,dt,dd,ul,li{margin:0;padding:0;list-style:none;}
	p{font-size:12px;}
	dt{font-size:14px;font-family:"微软雅黑";font-weight:bold;border-bottom:1px dotted #000;padding:5px 0 5px 5px;margin:5px 0;}
	dd{padding:5px 0 0 5px;}
	li{line-height:28px;float:left;}
	.container1 { width:100%; margin-left:0;}
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
</style>

</head>
<body style="background-color:#CCC;">
<%
Teacher teacher = (Teacher)session.getAttribute("teacher1");
//判断user是否为空，如果不为空才操作以下。不然会报空指针异常。 
if(teacher != null){ 
 System.out.println("考勤发布平台--Session数据获取--attendaPut.jsp: "+teacher.getCode());
 
} else{
	 System.out.println("考勤发布平台--Session数据获取--attendaPut.jsp: 未获取Session");
}
String name = teacher.getName();
String school = teacher.getSchoolCode(); //这个老师的所属大学
String teachercode = teacher.getCode(); // 这个老师的职工号

Class.forName("com.mysql.jdbc.Driver").newInstance();                         
String url="jdbc:mysql://localhost:3306/school";  
String user="root";  
String password="123456";  
Connection conn = DriverManager.getConnection(url, user, password);  
Statement st = conn.createStatement();  
ResultSet rs = st.executeQuery("SELECT code FROM school where name='"+school+"'"); 
String schoolcode=""; // 学校的编码 ZJUT 等
String schoolid=""; // 考勤码
String newschool="";
String s="";
String schoolstart="";
if(rs.next())
{
	schoolcode = rs.getString("code");
	System.out.println("考勤发布平台--获取学校代码--attendancePut.jsp: "+schoolcode);
}
ResultSet rs1 = st.executeQuery("select attendcode from attendance where id in (select max(id) from attendance where id in(select id from attendance where school_code = '"+school+"'))"); 
if(rs1.next())
{
	schoolid = rs1.getString("attendcode");
	System.out.println("考勤发布平台--获取本校最大考勤号码--attendancePut.jsp: "+schoolid);
}
/* ResultSet rs2 = st.executeQuery("SELECT start FROM schedule where code='"+schoolid+"'"); 
if(rs2.next())
{
	schoolstart = rs2.getString("start");
	System.out.println("课程发布平台--获取本校课程时间--coursePut.jsp: "+schoolstart);
} */

int a = schoolcode.length(); //ZJUT的长度 

if(schoolid == null || schoolid == "")
{
    newschool = schoolcode+"AT001";
    s= newschool;
    System.out.println("考勤发布平台--新考勤标识--attendancePut.jsp: "+s);
}else{
	a = a + 2; //ZJUTAT
	String num = schoolid.substring(a);
	int b = Integer.parseInt(num);
	System.out.println("考勤发布平台--获取最大考勤标识--attendancePut.jsp: "+num+"  "+b);
	int c = b+1;
	s=String.format("%03d",c);
	s = schoolcode +"AT" + s;
	System.out.println("考勤发布平台--新考勤标识--attendancePut.jsp: "+s);
}
rs.close();  
rs1.close(); 
conn.close(); 
%>
<div class="container_shq">
  <div class="container1_shq">
        <form action="" method="post">    	
			<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
			    <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
		    </div>
			<!-- <label >输入地点：</label> -->
			<input id="where" name="where" type="text" placeholder="请输入地址" style="display:none;">
			<input id="but" type="button" value="定     位" onClick="sear(document.getElementById('where').value);" style="display:none;"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </form>
  </div>
  <div class="container2_shq">
       <div class="container1"> 
        <c:url value="/putattendanceinsert" var="InsertAttendance" /> 
        <form action="${InsertAttendance}" method="post"  onsubmit="return checkForm();">
        <table style="background-color:#F2F2E6;text-align:center;width:100%;" border="0">
	        <thead>
				<tr>	
					<th>课程标识</th>						
					<th>职工号码</th>
					<th>考勤经度</th>
					<th>考勤纬度</th>
					<th>起始时间</th>
					<th>结束时间</th>
					<th>允许误差</th>
					<th>发布考勤</th>
				</tr>	
			</thead>
			<tbody>
			    <tr>
					<td><input id="scheduleCode" readonly="readonly" name="scheduleCode" type="text" maxlength="16"></td>
					
			        <td><input id="teacherCode" readonly="readonly" name="teacherCode" type="text" maxlength="16"></td>
			        
			  		<td><input id="lonlat" readonly="readonly" name="longitude" type="text" maxlength="10"></td>
			  		
					<td><input id="lonlat2" readonly="readonly" name="latitude" type="text" maxlength="9"></td>	
							
			 		<td><input type="text" id="start" name="start" class="sang_Calender" /></td>
			 		
			 		<td><input type="text" id="end" name="end" class="sang_Calender" /></td>
			 		
					<td><input id="deviation" name="deviation" type="text" maxlength="16" onkeyup="this.value=this.value.replace(/[^\d]/g,'');"></td>
					
					<input id="code" name="code" type="hidden" value="1" maxlength="16">
					<input id="attencode" name="attendcode" type="hidden" value=<%=s%> maxlength="16">
					<input id="code" name="schoolCode" type="hidden" value=<%=school%> maxlength="16">
					
					<input id="class_time" name="" type="hidden" maxlength="16">
					<input id="class_start" name="" type="hidden" maxlength="16">
					<input id="class_end" name="" type="hidden" maxlength="16">
					
					<td><input type="submit" size="5"  name="submit" id="submit" value="  √  " />
					<!-- disabled="disabled" -->
			    </tr>
			</tbody>
         </table>
		</form> 
	  </div>
  <center>
  <table style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:100%;margin-top:0;"border="1">
	  <tr>	
				<th>课程标识</th>			
				<th>课程名称</th>
				<th>职工号码</th>
				<th>上课时间</th>
				<th>起始时间</th>
				<th>下课时间</th>
				<th>上课地点</th>
				<th>获取信息</th>
			</tr>
  </table>
    <p style="color:red;">${attendanceput2}</p>
    <div style="overflow-y: auto; height: 208px; width:100%;">
	<table style="background-color:#F2F2E6;text-align:center;border-collapse:collapse;width:100%;margin-top:0;"border="1">
		<thead>
<!-- 		<tr style="position:fixed;">	
			<th>课程标识</th>			
			<th>课程名称</th>
			<th>职工号码</th>
			<th>上课时间</th>
			<th>起始时间</th>
			<th>下课时间</th>
			<th>上课地点</th>
			<th>获取信息</th>
		</tr>	 -->
		</thead>			
		<tbody>
			<c:forEach var="attendanceput1" items="${attendanceput1}">
				<tr>	
				<form action="" method="" >		
				<!--<td><input type="text" size="4" value=${attendanceput1.code} readonly="readonly"/></td> -->
				    <td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=${attendanceput1.code}></td>
					<td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=${attendanceput1.name}></td>
					<td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=${attendanceput1.teacherCode}></td>
	                <td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=${attendanceput1.time}></td>
	                <td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=<spring:eval expression="attendanceput1.start" />></td>
					<td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=<spring:eval expression="attendanceput1.end" />></td>	
					<td><input type="text" size="5" readonly="readonly" name=${attendanceput1.id} value=${attendanceput1.site}></td>
					<td><input type="button" id=${attendanceput1.id} onclick="return trya(this.id)" value="获     取"></td>	
				</form>
				</tr>
			</c:forEach>	
		</tbody>
	 </table>
  </div>
 </div>
</div>
 <script type="text/javascript">
 // 考勤信息业务逻辑 
 function checkForm(){
	 
		var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    var todayhour = date.getHours();
	    var todayminute = date.getMinutes();
	    var todaysecond = date.getSeconds();
	    if (todayminute >= 1 && todayminute <= 9) {
	    	todayminute = "0" + todayminute;
	    }
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate + " " + date.getHours() + seperator2 + date.getMinutes() + seperator2 + date.getSeconds() + date.getDay();
	    var currentyear = date.getFullYear() + seperator1 + month + seperator1 + strDate;
		//var todayhour = date.getHours();
	    //var todayminute = date.getMinutes();
	    //var todaysecond = date.getSeconds();
	    var todayall = todayhour * 3600 + todayminute * 60 + todaysecond * 1;
	    //alert(todayhour+" * 3600+" +todayminute+" * 60+"+ todaysecond+"="+todayall);
		var todayweek = date.getDay();
		var week;
		if(todayweek == 0){ week="周日"; }
		if(todayweek == 1){ week="周一"; }
		if(todayweek == 2){ week="周二"; }
		if(todayweek == 3){ week="周三"; }
		if(todayweek == 4){ week="周四"; }
		if(todayweek == 5){ week="周五"; }
		if(todayweek == 6){ week="周六"; }
	    //alert("今天："+currentdate);

		var a,b,c,d,e,f,g,h,i,j,classweek;
		
		a = $("#scheduleCode").val();
		b = $("#teacherCode").val();
		c = $("#lonlat").val();
		d = $("#lonlat2").val();
		e = $("#start").val();
		f = $("#end").val();
		g = $("#deviation").val();
		
		// * 选中课程相关数据
		h = $("#class_time").val();
		i = $("#class_start").val();
		j = $("#class_end").val();
		
		var class1 = i.split(':');
		var class1h = class1[0];
		var class1m = class1[1];
		var class1s = class1[2];
		var class1all = class1h * 3600 + class1m * 60 + class1s * 1;
		//alert(class1h+" * 3600+" +class1m+" * 60 +"+ class1s+"="+class1all);
		
		var class2 = j.split(':');
		var class2h = class2[0];
		var class2m = class2[1];
		var class2s = class2[2];
		var class2all = class2h * 3600 + class2m * 60 + class2s * 1;
		//alert(class2h+" * 3600+" +class2m+" * 60 +"+ class2s+"="+class2all);
		
		if(h == "周一") {classweek = "1";}
		if(h == "周二") {classweek = "2";}
		if(h == "周三") {classweek = "3";}
		if(h == "周四") {classweek = "4";}
		if(h == "周五") {classweek = "5";}
		if(h == "周六") {classweek = "6";}
		if(h == "周日") {classweek = "0";}				
		//alert("我有进来过: "+e);
/*		// 分割年份、小时
		var arr1 = e.split(" ");
		var arr2 = f.split(" ");
		// 放年份
		var startyear = arr1[0];
		var endyear = arr2[0];
		// 放时间并分割时间
		var start_time = arr1[1];
		var end_time = arr2[1];		
		
		var time1 = start_time.split(':');
		var hour1 = time1[0];
		var minutes1 = time1[1];
		var second1 = time1[2];
		var start_all = hour1 * 3600 + minutes1 * 60 + second1;
		
		var time2 = end_time.split(':');
		var hour2 = time2[0];
		var minutes2 = time2[1];
		var second2 = time2[2];
		var end_all = hour2 * 3600 + minutes2 * 60 + second2;
		*/
		//alert("我在这里结束了");
		if(a=="")
		{
			alert("请在列表中选择考勤课程信息");
			return false;
		}else{			
			if(classweek != todayweek)
			{
				alert("请选择"+week+"的课程");
				return false;
			}else{
				//alert("今天："+todayall+"课程："+class2all);
				if(todayall>class2all)
				{
					alert("本节课已经结束无法再次发布信息");
					return false;
				}else{
					if(c == null || c == "")
					{
					    alert("请定位获取考勤坐标数据");
						return false;
					}else{
						if(e == null || e == "")
						{
							alert("请选择考勤起始时间点");
							return false;
							//$("#submit").attr({"disabled":"disabled"});
						}else{
							// 分割起始年份、小时
							var arr1 = e.split(" ");						
							// 放年份
							var startyear = arr1[0];						
							// 放小时
							var start_time = arr1[1];	
							// 分割时间
							var time1 = start_time.split(':');
							var hour1 = time1[0];
							var minutes1 = time1[1];
							var second1 = time1[2];
							// 小时化秒
							var start_all = hour1 * 3600 + minutes1 * 60 + second1 * 1;	
							if(startyear != currentyear)
							{
								alert("请选择今日的正确日期");
								return false;
							}else{
								if(start_all > class2all)
								{
									alert("请选择本节课下课时间之前为考勤点");
									return false;
								}else{
										if(f == null || f == "")
										{
											alert("请选择考勤结束时间点");
											return false;
											//$("#submit").attr({"disabled":"disabled"});
										}else{
											// 分割年份、小时												
											var arr2 = f.split(" ");
											// 放年份													
											var endyear = arr2[0];
											// 放时间并分割时间												
											var end_time = arr2[1];																												
											var time2 = end_time.split(':');
											var hour2 = time2[0];
											var minutes2 = time2[1];
											var second2 = time2[2];
											var end_all = hour2 * 3600 + minutes2 * 60 + second2 * 1;
											if(endyear != currentyear)
											{
												alert("请选择今日的正确日期");
												return false;
											}else{
												if(end_all == start_all || end_all<start_all || end_all>class2all)
												{
													alert("考勤结束时间应在起始时间之后，课程结束时间之前");
													return false;
												}else{
													if(g == null || g == "")
													{
														alert("请输入考勤坐标允许误差范围");
														return false;
													}else{
														return true;
													}
												}
											}	
								        }
							    }
						    }
					    }
			        }
			    }
			}
		}
		
}
 
 //传数据给发布表格
 
       function trya(id){
    	   //alert("我进来了啊"+id);
    	   var a=document.getElementsByName(id);
    	   //alert("我又进来了啊"+a.length);
    	   for(var i=0;i<a.length;i++){
    	   //alert(a[i].value);
    	   }
    	   document.getElementById("scheduleCode").value = a[0].value;
    	   document.getElementById("teacherCode").value = a[2].value; 
    	   document.getElementById("class_time").value = a[3].value; 
    	   document.getElementById("class_start").value = a[4].value; 
    	   document.getElementById("class_end").value = a[5].value; 
    	   a = document.getElementById("start").value;
    	   //alert(a);
       }
 //地图控制
	    var map =new BMap.Map("allmap");
		map.setDefaultCursor("crosshair");
		
		map.enableScrollWheelZoom();
		var point = new BMap.Point(120.045101,30.230564);
		map.centerAndZoom(point, 17);
		var gc = new BMap.Geocoder();
		
		map.addControl(new BMap.NavigationControl()); 
		map.addControl(new BMap.OverviewMapControl());
		map.addControl(new BMap.ScaleControl());
		map.addControl(new BMap.MapTypeControl());
		map.addControl(new BMap.CopyrightControl());
		
		var marker = new BMap.Marker(point);   
		map.addOverlay(marker);
		
		marker.addEventListener("click", function(e)
		{
				document.getElementById("lonlat").value = e.point.lng; 
				document.getElementById("lonlat2").value =e.point.lat; 
		}); 
		
		
		marker.enableDragging();
		
		marker.addEventListener("dragend",function(e)
		{
		  gc.getLocation(e.point, function(rs)
		  {
		      showLocationInfo(e.point, rs);  
		  });  
		});
		
	
		function showLocationInfo(pt, rs)
		{
		    var opts = {  width : 250, height: 150, title : "当前位置" } ; 
		    var addComp = rs.addressComponents;  
		    var addr = "当前位置：" + addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber + "<br/>";  
		    addr += "纬度: " + pt.lat + ", " + "经度：" + pt.lng;     
		    var infoWindow = new BMap.InfoWindow(addr, opts); 
		    marker.openInfoWindow(infoWindow);  
		} 
		
		map.addEventListener("click", function(e)
		{
				document.getElementById("lonlat").value = e.point.lng;
				document.getElementById("lonlat2").value = e.point.lat;
		});
		
		 
		var traffic = new BMap.TrafficLayer();     
		map.addTileLayer(traffic);                    
		
		
		function iploac(result)
		{
		    var cityName = result.name;
		}
		
		var myCity = new BMap.LocalCity();
		myCity.get(iploac);
		
		function sear(result)
		{
		  var local = new BMap.LocalSearch(map, {renderOptions:{map: map} });
		  local.search(result);
		}
		
</script>
</body>
<script type="text/javascript" src="js/datetime.js"></script>
</html>