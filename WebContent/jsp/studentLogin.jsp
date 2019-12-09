<%@page import="java.util.Date"%>
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
<script type="text/javascript" src="js/login.js"></script>  <!-- 判断登录用户 -->
</head>
<body>
<div data-role="page" id="pageone">
  <div data-role="header" data-position="fixed">
    <a href="#pagetwo" data-transition="flip" class="ui-btn ui-btn-right ui-corner-all ui-shadow ui-icon-plus ui-btn-icon-left">注册</a>
    <h1>考勤系统管理平台</h1>
  
  </div>

  <div data-role="content" id="main1Content" >
    <c:url value="/studentlogin" var="studentloginActoin" /> 
    <form  action="${studentloginActoin}" method="post" data-ajax="false">
        <div>
          <h3>学生登录信息</h3>
          <label for="usrnm" class="ui-hidden-accessible">学号:</label>
          <input type="text" name="code" id="usrnm" placeholder="学号">
          <label for="pswd" class="ui-hidden-accessible">密码:</label>
          <input type="password" name="password" id="pswd" placeholder="密码">
          <label for="schoolCode">所属大学</label>
		        <select name="schoolCode" id="school-name">
		         <option value="浙江工业大学">浙江工业大学</option>
<!-- 		     <option value="浙江大学">浙江大学</option>
		         <option value="杭州电子科技大学">杭州电子科技大学</option> -->
		        </select>
          <input type="submit" onclick="schoolget()" value="登录">
         <!--  <a href="#pagetwo" data-transition="flip">注册</a> -->
        </div>
      </form>
      <p style="text-align:center;color:red;">${message }</p>
  </div>
</div> 


<div data-role="page" id="pagetwo" >
  <div data-role="header" data-position="fixed">
    <a href="#pageone" data-transition="slide" data-direction="reverse" class="ui-btn ui-corner-all ui-icon-arrow-l ui-btn-icon-notext">返回</a>
    <h1>考勤系统管理平台</h1>
  </div>

  <div data-role="main" class="ui-content">
  <c:url value="/studentadd" var="studentaddActoin" /> 
  <form name="form2" data-ajax="false" id="regUser" accept-charset="utf-8"  action="${studentaddActoin}" method="post">
<!--    <input type="hidden" name="to" value="reg"/>
   <input type="hidden" name="did" value="0"/> -->
        <div>
          <h3>学生注册信息</h3>
          <div id="userCue" class="cue">快速注册请注意格式</div>
          
          <label for="usrnm" class="ui-hidden-accessible">用户名:</label>
          <input type="text" name="name" id="user" placeholder="用户名">
          
          <label for="pswd" class="ui-hidden-accessible">密码:</label>
          <input type="password" name="password" id="passwd" placeholder="密码" onkeyup="this.value=this.value.replace(/[^\w]/g,'');">
          
          <label for="pswd" class="ui-hidden-accessible">确认密码:</label>
          <input type="password" name="" id="passwd2" placeholder="确认密码" onkeyup="this.value=this.value.replace(/[^\w]/g,'');">
          
          <label for="pswd" class="ui-hidden-accessible">学号:</label>
          <input type="text" name="code" id="code" placeholder="学号" onkeyup="this.value=this.value.replace(/[^\d]/g,'');">
          
          <label for="schoolCode">所属大学</label>
		        <select name="schoolCode" id="school-name">
		         <option value="浙江工业大学">浙江工业大学</option>
<!-- 		         <option value="浙江大学">浙江大学</option>
		         <option value="杭州电子科技大学">杭州电子科技大学</option> -->
		        </select>
	
          <input type="submit" id="reg" data-inline="false" value="注册">
          <!--  <a href="#pageone" data-transition="slide" data-direction="reverse">返回</a>-->
        </div>
      </form>
  </div>
</div> 

</body>
</html>
<script>
/* var reMethod = "GET",
pwdmin = 6;
$(document).ready(function() {
	$('#reg').click(function() {

		if ($('#name').val() == "") {
			$('#name').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
		if ($('#name').val().length < 2 || $('#name').val().length > 6) {

			$('#name').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位2-6字符</b></font>");
			return false;

		}
		if ($('#passwd1').val().length < pwdmin) {
			$('#passwd1').focus();
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		}
		if ($('#passwd2').val() != $('#passwd1').val()) {
			$('#passwd2').focus();
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}
		
		if ($('#code1').val() == "") {
			$('#code1').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×职工号码不能为空</b></font>");
			return false;
		}
		
		if ($('#schoolCode1').val() == "" || $('#schoolCode1').val() == "请选择大学") {
			$('#schoolCode1').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×所属大学不能为空</b></font>");
			return false;
		}
		

		
		$('#regUser').submit();
	});
	

}); */
</script>