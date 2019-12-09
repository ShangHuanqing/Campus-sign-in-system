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
<title>考勤系统管理平台</title>
<link rel="stylesheet" type="text/css" href="css/Iframe.css" />
<script language="javascript" type="text/javascript" src="js/niceforms.js"></script> 
<link rel="stylesheet" type="text/css" media="all" href="css/niceforms-default.css" />
<script language="javascript" type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>

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
 System.out.println("课程发布平台--Session数据获取--coursePut.jsp: "+teacher.getCode());
 
} else{
	 System.out.println("课程发布平台--Session数据获取--coursePut.jsp: 未获取Session");
}
String name = teacher.getName();
String school = teacher.getSchoolCode();
String teachercode = teacher.getCode();

Class.forName("com.mysql.jdbc.Driver").newInstance();                         
String url="jdbc:mysql://localhost:3306/school";  
String user="root";  
String password="123456";  
Connection conn = DriverManager.getConnection(url, user, password);  
Statement st = conn.createStatement();  
ResultSet rs = st.executeQuery("SELECT code FROM school where name='"+school+"'"); 
String schoolcode="";
String schoolid="";
String newschool="";
String s="";
String schoolstart="";
if(rs.next())
{
	schoolcode = rs.getString("code");
	System.out.println("课程发布平台--获取学校代码--coursePut.jsp: "+schoolcode);
}
ResultSet rs1 = st.executeQuery("select code from schedule where id in (select max(id) from schedule where id in(select id from schedule where school_code = '"+school+"'))"); 
if(rs1.next())
{
	schoolid = rs1.getString("code");
	System.out.println("课程发布平台--获取本校最大课程号码--coursePut.jsp: "+schoolid);
}
ResultSet rs2 = st.executeQuery("SELECT start FROM schedule where code='"+schoolid+"'"); 
if(rs2.next())
{
	schoolstart = rs2.getString("start");
	System.out.println("课程发布平台--获取本校课程时间--coursePut.jsp: "+schoolstart);
}
int a = schoolcode.length();
if(schoolid == null || schoolid == "")
{
    newschool = schoolcode+"001";
    s= newschool;
    System.out.println("课程发布平台--新课程标识--coursePut.jsp: "+newschool);
}else{
	String num = schoolid.substring(a);
	int b = Integer.parseInt(num);
	System.out.println("课程发布平台--获取最大课程标识--coursePut.jsp: "+num+"  "+b);
	int c = b+1;
	s=String.format("%03d",c);
	s = schoolcode + s;
	System.out.println("课程发布平台--新课程标识--coursePut.jsp: "+s);
}

//学校的课程时间直接获取
String classnum = "";
int classallnum = 0;
ResultSet rs3 = st.executeQuery("select count(*) from classtime where school_code='"+school+"'");
if(rs3.next())
{
	classnum = rs3.getString("count(*)");
	classallnum = Integer.parseInt(classnum);
}
if(classallnum == 0)
{
	System.out.println("该高校还未曾有课程上课时间的数据");
}else
{
	System.out.println("该高校存有数据");
}

//写死的时间表值 

String[] starttime = new String[20];
String[] endtime = new String[20];
/* String start1 = ""; String end1 = "";
String start2 = ""; String end2 = "";
String start3 = ""; String end3 = "";
String start4 = ""; String end4 = "";
String start5 = ""; String end5 = "";
String start6 = ""; String end6 = "";
String start7 = ""; String end7 = "";
String start8 = ""; String end8 = "";
String start9 = ""; String end9 = "";
String start10 = ""; String end10 = "";
String start11 = ""; String end11 = "";
String start12 = ""; String end12 = "";
String start13 = ""; String end13 = ""; */
for(int h = 0; h <= classallnum; h++ )
{
	ResultSet st1 = st.executeQuery("SELECT start FROM classtime where id ="+h); 
	if(st1.next())
	{
		starttime[h] = st1.getString("start");
		//System.out.println("课程发布平台--获取本校设定的第"+h+"节课程上课时间--coursePut.jsp: "+starttime[h]);
	}
	ResultSet ed1 = st.executeQuery("SELECT end FROM classtime where id ="+h); 
	if(ed1.next())
	{
		endtime[h] = ed1.getString("end");
		//System.out.println("课程发布平台--获取本校设定的第"+h+"节课程下课时间--coursePut.jsp: "+endtime[h]);
	}
}
//System.out.println("课程发布平台--循环外--获取本校设定的课程下课时间--coursePut.jsp: "+endtime[10]);
rs.close();  
rs1.close(); 
conn.close(); 
%>
<%-- <%=name%>想要发布课程，速度编辑<br/>
新课程唯一标识:  <%=s%><br/>
本校最大的课程编号:  <%=schoolid%><br/>
本校校名:  <%=school%> <br/>
上课时间:  <%=schoolstart%><br/> --%>
<div id="container" ng-app="myApp" ng-controller = "myCtrl">
<p style="color:red;margin-left:8%;margin-top:5%;">${message}</p>
<c:url value="/putcourseinsert" var="InsertCourse" /> 
<form action="${InsertCourse}" method="post" class="niceform"  onsubmit="return checkForm();" style="padding-bottom:100px;">
	<fieldset style="border-radius:10px;margin-left:5%;width:100%;">
    	<legend style="border-radius:0 10px 10px 0;">Course Info&nbsp;&nbsp;&nbsp;</legend>
        <dl>
        	<dt><label for="schoolCode">学校名称:</label></dt>
            <dd>
	            <img src="images/0.png" class="NFTextLeft">
		            <div class="NFTextCenter">
		           	 <input type="text" name="schoolCode"  size="32" maxlength="128" readonly="readonly" value=<%=school%> id="schoolCode" class="NFText"/>
		            </div>
	            <img src="images/0.png" class="NFTextRight">
            </dd>
        </dl>
        <dl>
        	<dt><label for="code">课程标识:</label></dt>
            <dd>
	            <img src="images/0.png" class="NFTextLeft">
		            <div class="NFTextCenter">      
           			 <input type="text" name="code"  size="32" maxlength="128" readonly="readonly" value=<%=s%> id="code"  class="NFText"/>
       				</div>
       			<img src="images/0.png" class="NFTextRight">
       		</dd>
        </dl>
        <dl>
        	<dt><label for="teacherCode">职工编号:</label></dt>
            <dd>
	            <img src="images/0.png" class="NFTextLeft">
		            <div class="NFTextCenter">             
           				 <input type="text" name="teacherCode"  size="32" maxlength="128" readonly="readonly" value=<%=teachercode%> id="teacherCode"  class="NFText"/>
     			   </div>
        	       <img src="images/0.png" class="NFTextRight">
       		</dd>
        </dl>
		<dl>
        	<dt><label for="name">课程名称:</label></dt>
            <dd>
            <img src="images/0.png" class="NFTextLeft">
		    <div class="NFTextCenter"> 
            	<input type="text" name="name" id="name" size="32" maxlength="128"  class="NFText" />
            </div>
            <img src="images/0.png" class="NFTextRight">
            </dd>
        </dl>
        <dl>
        	<dt><label for="period">课程学时:</label></dt>
            <dd>
             <img src="images/0.png" class="NFTextLeft">
		   	 <div class="NFTextCenter"> 
           	 <input type="text" name="period" id="period" size="32" maxlength="128"  class="NFText" />
           	 </div>
             <img src="images/0.png" class="NFTextRight">
            </dd>
        </dl>
		<dl>
        	<dt><label for="credit">课程学分:</label></dt>
            <dd>
             <img src="images/0.png" class="NFTextLeft">
		    <div class="NFTextCenter"> 
            <input type="text" name="credit" id="credit" size="32" maxlength="128"   class="NFText"/>
            </div>
             <img src="images/0.png" class="NFTextRight">
            </dd>
        </dl>
        <dl>
       		 <br/><hr><br/>
        </dl>
        <div >  
       	<div ng-repeat="time in list">     
        <dl>
        	<dt><label for="time">上课时间:</label></dt>
            <dd>
            	<select size="1" name="time" id="time" ng-model="time.time">
            	    <option value=''>--请选择上课周数--</option>
                    <option value="周一">   周一   </option>
                    <option value="周二">   周二   </option>
                    <option value="周三">   周三   </option>
                    <option value="周四">   周四   </option>
                    <option value="周五">   周五   </option>
                    <option value="周六">   周六   </option>
                    <option value="周日">   周日   </option>
            	</select>
            </dd>
        </dl>
        <dl>
        	<dt><label for="num1">起始课程:</label></dt>
            <dd>
            	<select size="1" name="start" id="num{{$index}}" ng-model="time.start" ng-change="fun(time.start,$index)">    
            		<option value=''>--请选择上课时间--</option>       	
				    <option value=<%=starttime[1]%>>第一节</option>
                 	<option value=<%=starttime[2]%>>第二节</option>
                    <option value=<%=starttime[3]%>>第三节</option>
                    <option value=<%=starttime[4]%>>第四节</option>
                    <option value=<%=starttime[5]%>>第五节（午休）</option>
                    <option value=<%=starttime[6]%>>第六节</option>
                    <option value=<%=starttime[7]%>>第七节</option>
                    <option value=<%=starttime[8]%>>第八节</option>
                    <option value=<%=starttime[9]%>>第九节</option>
                    <option value=<%=starttime[10]%>>第十节（晚休）</option>
                    <option value=<%=starttime[11]%>>第十一节</option>
                    <option value=<%=starttime[12]%>>第十二节</option>
                    <option value=<%=starttime[13]%>>第十三节</option>              
                </select>           
            </dd>
        </dl>
        <dl>
        	<dt><label for="num4">结束时间:</label></dt>
            <dd>
            	<select size="1" name="end" id="num{{$index}}"  ng-model="time.end" ng-change="fun3(time.end,$index)">
            	    <option value=''>--请选择下课时间--</option>
				    <option value=<%=endtime[1]%>>第一节</option>
                 	<option value=<%=endtime[2]%>>第二节</option>
                    <option value=<%=endtime[3]%>>第三节</option>
                    <option value=<%=endtime[4]%>>第四节</option>
                    <option value=<%=endtime[5]%>>第五节（午休）</option>
                    <option value=<%=endtime[6]%>>第六节</option>
                    <option value=<%=endtime[7]%>>第七节</option>
                    <option value=<%=endtime[8]%>>第八节</option>
                    <option value=<%=endtime[9]%>>第九节</option>
                    <option value=<%=endtime[10]%>>第十节（晚休）</option>
                    <option value=<%=endtime[11]%>>第十一节</option>
                    <option value=<%=endtime[12]%>>第十二节</option>
                    <option value=<%=endtime[13]%>>第十三节</option>  
                </select>
            </dd>
        </dl>
        <dl>
           	<!-- <input type="text" name="" id="start" size="32" maxlength="128"  />      >ng-model="time.start" -->
            <!-- <input type="text" name="" id="end" size="32" maxlength="128"  /> ng-model="time.end"-->
        </dl>
		<dl>
        	<dt><label for="site">上课地点:</label></dt>
            <dd>
            <img src="images/0.png" class="NFTextLeft">
		     <div class="NFTextCenter"> 
            <input type="text" name="site" id="site" size="32" maxlength="128"  ng-model="time.site"  class="NFText"/>
            </div>
             <img src="images/0.png" class="NFTextRight">
            </dd>
        </dl>
        <dl>
			    <dt><label for="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></dt>
				<dd>  				
					<input type="button" name="deleteTime" id="num{{$index}}" value="Ｘ  删除当前课程时间" ng-click="deleteTime($index)"/>
				</dd>
		</dl>
        <dl>
       		 <hr><br/>
        </dl>
     	</div>
	        <dl>
			    <dt><label for="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></dt>
				<dd><input type="button" name="addTime" id="addTime" value="＋  增加新的课程时间" ng-click="addTime()"/></dd>
			</dl>
        </div>		

		<input type="submit" disabled="disabled" name="submit" id="submit" value="√  确认信息无误后添加课程" />
		
		

		
    </fieldset>	
</form>
</div>
	<script  language="javascript" type="text/javascript">
 			 var app = angular.module('myApp', []);
		     app.controller('myCtrl', function ($scope) {
		    	 $scope.list=[{time:'',start:'',end:'',site:''}];
		    	 $scope.deleteTime=function(index){
		    		 $scope.list.splice(index,1);
		    	 }
		    	 $scope.addTime=function(){
		    		 $scope.list.push({time:'',start:'',end:'',site:''});
		    	 }
		    	 $scope.firstClassTime = '';
		    	 $scope.secondClassTime = '';
		    	 
		    	 $scope.fun = function(time,index){
					//console.log(time);
					$scope.list[index].start = time;	
					
					var a,b;
					a = $scope.list[index].start; 
					b = $scope.list[index].end;
					
					if(b)
					{
						var class1 = a.split(':');
						var class1h = class1[0];
						var class1m = class1[1];
						var class1s = class1[2];
						var class1all = class1h * 3600 + class1m * 60 + class1s * 1;
						
						var class2 = b.split(':');
						var class2h = class2[0];
						var class2m = class2[1];
						var class2s = class2[2];
						var class2all = class2h * 3600 + class2m * 60 + class2s * 1;
						
						var timecha = class2all - class1all;
						
						if( timecha == 0) 
							{
							   alert("设定时间有误，请重新设定");
							   $("#submit").attr({"disabled":"disabled"});
							   
							}else if( timecha < 0 )  {
								
							   alert("下课时间不能早于上课时间，请重新设定");
							   $("#submit").attr({"disabled":"disabled"});
							   
							}else{							
								$("#submit ").removeAttr("disabled");
							}
						}
			    	 }
		    	 
		    	 $scope.fun3 = function(time,index){
						$scope.list[index].end = time;	
						var a,b;
						a = $scope.list[index].start; 
						b = $scope.list[index].end;
						var class1 = a.split(':');
						var class1h = class1[0];
						var class1m = class1[1];
						var class1s = class1[2];
						var class1all = class1h * 3600 + class1m * 60 + class1s * 1;
						
						var class2 = b.split(':');
						var class2h = class2[0];
						var class2m = class2[1];
						var class2s = class2[2];
						var class2all = class2h * 3600 + class2m * 60 + class2s * 1;
						
						var timecha = class2all - class1all;
						
						if( timecha == 0) 
							{
							   alert("设定时间有误，请重新设定");
							   $("#submit").attr({"disabled":"disabled"});
							   
							}else if( timecha < 0 )  {
								
							   alert("下课时间不能早于上课时间，请重新设定");
							   $("#submit").attr({"disabled":"disabled"});
							   
							}else{							
								$("#submit ").removeAttr("disabled");
							}
					}
		     }); 

			function checkForm(){//js表单验证方法
				   var name,time,site,period,credit,start,end;
			       name = $("#name").val();
			       time = $("#time").val();
			       site = $("#site").val();
			       period = $("#period").val();
			       credit = $("#credit").val();
			       start = $("#start").val();
			       end = $("#end").val();
				   if(name==""||time==""||site==""||period==""||credit==""||start==""||end==""){//当上面获取的值为空时
				     alert("提示：请完善表单提交");//弹出提示
				     return false;//返回false（不提交表单）
				   }
				   return true;//提交表单
			} 			
    </script>
</body>
</html>





