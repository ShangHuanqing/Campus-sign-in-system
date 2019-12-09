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
	<style>
	html,body {width:100%; height:100%;}
	.containerS{width:100%; height:500px; float:left;}
	.containerS1{width:100%; height:30%; float:left;}
	.containerS2{width:100%; height:70%; float:left; }
	.blockS { height: 100%;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px;}
	.blockS2 { height: 100%; border:0;  background-color: blue; background-color: rgba(165, 26, 15, 0.75);}
	</style>
</head>
<body>
<input type="hidden" id = "json" value=${jsoninfo} />
<div class="containerS">
	<div class="containerS1">
	  <p style="color:red;">${message}</p>
	   <c:url value="/classChooseinf" var="classChooseinf" /> 
	    <form  action="${classChooseinf}" method="post" data-ajax="false">
	        <div>
	          <label for="usrnm" class="ui-hidden-accessible">输入课程标识号码:</label>
	          <input type="text" name="code" id="inputBox" placeholder="请输入课程标识号码" onkeyup="showValue(event);"/>	
	          <input type="submit" value="添加课程">  
	        </div>
	      </form>
	      <input type="textarea" style="display:none;" name="sql_data" id="showBox" value="">
	      <script>
	      function showValue(evt){
	    	  var ui = document.getElementById("showBox");
	    	  //ui.style.display="";
	    	  var value = evt.target.value;
	    	  var showBox = document.getElementById("showBox");
	    	  showBox.value = value;
	    	  
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
	    	    input.name = "code";  
	    	    input.value = value;  	    	  
	    	    // 将该输入框插入到 form 中  
	    	    form1.appendChild(input);  	    	   	    	        	     	    
	    	    // form 的提交方式  
	    	    form1.method = "POST";  
	    	    // form 提交路径  
	    	    form1.action = "chooseclassInformation";      	  
	    	    // 对该 form 执行提交  
	    	    form1.submit();  
	    	    // 删除该 form  
	    	    //document.body.removeChild(form1); 	 	    	  
	      }
	      </script>
	 </div>
	 <div class="containerS2">
	   <iframe id="tableFrame" name="tableFrame" src="<c:url value="/chooseclassInformation"/>" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
	 </div>
 </div>  
<%--     <table data-role="table" data-mode="columntoggle" class="ui-responsive" id="test">
      <thead>
         <tr>
		  <th data-priority="1">课程名</th>
          <th data-priority="1">上课地点</th>
          <th data-priority="1">上课时间</th>
          <th data-priority="1">起始时间</th>
          <th data-priority="1">下课时间</th>
          <th data-priority="1">老师工号</th>
        </tr>
      </thead>
      <tbody>
			<tr>
				<td name=${schedulemessage.id}>${schedulemessage.name}</td>
				<td name=${schedulemessage.id}>${schedulemessage.site}</td>
				<td name=${schedulemessage.id}>${schedulemessage.time}</td>
				<td name=${schedulemessage.id}><spring:eval expression="schedulemessage.start" /></td>
				<td name=${schedulemessage.id}><spring:eval expression="schedulemessage.end" /></td>
				<td name=${schedulemessage.id}>${schedulemessage.teacherCode}</td>
			</tr>
      </tbody>
    </table> --%>
</body>
</html>
