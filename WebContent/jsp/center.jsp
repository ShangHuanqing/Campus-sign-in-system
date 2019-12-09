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
<title>考勤系统管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/Iframe.css" />
<link rel="stylesheet" type="text/css" href="css/teacher_normalize.css" />
<link rel="stylesheet" type="text/css" href="css/teacher_demo.css" />
<link rel="stylesheet" type="text/css" href="css/teacher_component.css" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<style>
.contain_center {width:40%;height:80%;margin-left:30%;}
.button_blue
{
	display:inline-block;
	float:left;
	height:41px;border-radius:4px;
	background:#2795dc;border:none;cursor:pointer;
	border-bottom:3px solid #0078b3;*border-bottom:none;
	color:#fff;
	font-size:16px;padding:0 10px;*width:140px;
	text-align:center;outline:none;font-family: "Microsoft Yahei",Arial, Helvetica, sans-serif;
}
input.button_blue:hover
{
	background:#0081c1;
	border-bottom:3px solid #006698;*border-bottom:none;
	color:#fff;
	text-decoration:none;
}
</style>
</head>
<body style="background-image:url(images/centerback.jpg);
                background-positon: 100%, 100%;             
                -moz-background-size:100% 100%;
                background-size:100% 100%;
                background-repeat: no-repeat;">
<%
Teacher teacher = (Teacher)session.getAttribute("teacher1");
//判断user是否为空，如果不为空才操作以下。不然会报空指针异常。 
if(teacher != null){ 
 System.out.println("个人中心--Session数据获取--Center.jsp："+teacher.getCode());
} else{
	 System.out.println("个人中心--Session数据获取--Center.jsp：Session获取失败 ");
}
String name = teacher.getName();
String code = teacher.getCode();
String schoolCode = teacher.getSchoolCode();
String password = teacher.getPassword();
%> 

       <div class="contain_center">
        <h3 style="margin-top:10px; margin-left:29%;margin-top:10%">个人信息管理</h3>
            <p>${infor}</p>
			<section class="content" style="font-size:100%;padding-top:0px;">
			    <c:url value="/updateinfor" var="updateAction" /> 
                <form name="form" id="regUser" accept-charset="utf-8"  action="${updateAction}" method="post">
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-4" readonly="readonly" name="name" value=<%=name%>></input>
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
						<span class="input__label-content input__label-content--hoshi">教师姓名</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-5" readonly="readonly" name="code" value=<%=code%>></input>
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-5">
						<span class="input__label-content input__label-content--hoshi">教职工号码</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-6" readonly="readonly" name="schoolCode" value=<%=schoolCode%>></input>
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">所属大学</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi" style="display:none;" >
					<input class="input__field input__field--hoshi" type="hidden" onblur="but()" name="" value=<%=password%> id="userpass" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">用户密码</span>
					</label>
				</span>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" onblur="but()" name="" id="putpass" onkeyup="this.value=this.value.replace(/[^\w]/g,'');"/>
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">密码</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" name="password" id="input-9" onkeyup="this.value=this.value.replace(/[^\w]/g,'');" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">新密码</span>
					</label>
				</span>
				<br>
				<input type="submit" id="btn" disabled="disabled" value="确认更改信息" style="width:150px; margin-left:29%;" class="button_blue"/></div>
		       </form>
			</section>			
		</div>
		<script type="text/javascript" language="javaScript">
		
			function but(){
				   var val1=document.getElementById('userpass').value;
				   var val2=document.getElementById('putpass').value;
				   var val3=document.getElementById('bnt');
				   if(val1 == val2){
				       $("#btn ").removeAttr("disabled");
				   }else if(val2!=null && val2!="")
				   {
					   $("#btn").attr({"disabled":"disabled"});
					   alert("若更改用户密码，请输入正确登录密码！");					     
					   val2 = "";
				   }
				   else{
					   $("#btn").attr({"disabled":"disabled"});
				   }
			}
		</script>
		<script src="js/teacher_classie.js"></script>
		<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
		</script>
</body>
</html>

<!-- <!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="gb2312" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Text Input Effects</title>
		<meta name="description" content="Simple ideas for enhancing text input interactions" />
		<meta name="keywords" content="input, text, effect, focus, transition, interaction, inspiration, web design" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/Iframe.css" />
        <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]
		<style>
		.contain_center {width:40%;height:80%;margin-left:30%;}
		</style>
	</head>


<body>
       <div class="contain_center">
        <h3 style="margin-top:10px; margin-left:35%;">个人信息管理</h3>
        <form action="" >
			<section class="content" style="font-size:100%;padding-top:0px;">
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-4" disabled="disabled" value="尚焕清" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-4">
						<span class="input__label-content input__label-content--hoshi">教师姓名</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-5" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-5">
						<span class="input__label-content input__label-content--hoshi">教职工号码</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-6" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">所属大学</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-7" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">密码</span>
					</label>
				</span>
				<br/>
				<span class="input input--hoshi">
					<input class="input__field input__field--hoshi" type="text" id="input-8" />
					<label class="input__label input__label--hoshi input__label--hoshi-color-1" for="input-6">
						<span class="input__label-content input__label-content--hoshi">新密码</span>
					</label>
				</span>
			</section>
			<div style="padding-left:50px;margin-top:20px;"><input type="submit" value="确认更改信息" style="width:150px;" class="button_blue"/></div>
		</form>
		</div>
		<script src="js/classie.js"></script>
		<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
		</script>
</body>
</html>
 -->