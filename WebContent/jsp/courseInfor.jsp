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
 <link href="css/bootstrap.min.css" rel="stylesheet"> 
	<style>
	html,body {width:100%; height:100%;margin:0px auto;}
	.containerS{width:100%; height:100%; float:left;}
	th{width:10%;height:7%;text-align:center;}	
	.blockS { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px 10px 0px 0px;}
	.blockS2 { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);}
	.blockS3 { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:0px 0px 10px 10px; 
    border-bottom-width: 2px;}
    .blockS4 { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px 10px 10px 10px; 
    border-bottom-width: 2px;}
	</style>
  </head>
<body style="background-color:#CCC; background-image:url(images/centerback.jpg);
                background-positon: 100%, 100%;             
                -moz-background-size:100% 100%;
                background-size:100% 100%;
                background-repeat: no-repeat;">
<%-- <%
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
ResultSet rs2 = st.executeQuery("SELECT start FROM schedule where code='ZJUT002'"); 
/* ResultSet rs2 = st.executeQuery("SELECT start FROM schedule where code='"+schoolid+"'"); */
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
rs.close();  
rs1.close(); 
conn.close(); 
%>
<%=name%>想要发布课程，速度编辑<br/>
新课程唯一标识:  <%=s%><br/>
本校最大的课程编号:  <%=schoolid%><br/>
本校校名:  <%=school%> <br/>
上课时间:  <%=schoolstart%><br/>
我能进来
进来啊 --%>
<input type="hidden" id = "json" value=${jsoninfo} >
 <div class="containerS">   
   <table class="table"  id = "test" align="center" border="1"  cellpadding="1" cellspacing="1" style="border-color:snow;background-color:snow;height:100%;width:100%;margin-left:0%;">
	
	<thead style="text-align:center;">
		<tr>
			<th scope="row">&nbsp;</th>
			<th scope="col"><sub><sup>周一</sup></sub></th>
			<th scope="col"><sub><sup>周二</sup></sub></th>
			<th scope="col"><sub><sup>周三</sup></sub></th>
			<th scope="col"><sub><sup>周四</sup></sub></th>
			<th scope="col"><sub><sup>周五</sup></sub></th>
			<th scope="col"><sub><sup>周六</sup></sub></th>
			<th scope="col"><sub><sup>周日</sup></sub></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第一节</th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第二节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第三节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第四节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第五节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第六节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第七节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第八节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第九节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第十节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第十一节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第十二节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
				<tr>
			<th scope="row"><span style="font-weight: bold; text-align: center;">第十三节</span></th>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</tbody>
</table>
</div>
<p>${courcesshowr1}</p>
<p>&nbsp;</p>

	<script type="text/javascript">
		 var tb = document.getElementById('test');//获取表格的dom节点
/*       var td = tb.rows[7].cells[1];//获取0行0列的td单元格
         td.innerHTML = '222';//动态修改表格的内容为222
         td.rowSpan = "2";
		 td.className = "blockS";	 
		 		 
         var td1 = tb.rows[8].cells[3];//获取0行0列的td单元格
         td1.innerHTML = '222';//动态修改表格的内容为222
         td1.rowSpan = "4";
		 td1.className = "blockS";	  */
         
         var jsoninfo1 = document.getElementById("json").value;
         //console.log("json:::"+jsoninfo1);
         //alert(jsoninfo1);
         var date = eval(jsoninfo1);
         //var myobj=eval(jsonst); 
         //alert("test2");
         for(var i =0 ; i<date.length;i++)
         {
        	var weeknum,hang;
        	//alert("test1");
        	var week = date[i].time; 
        	//列数
        	if(week == "周一"){ weeknum = 1; }
        	if(week == "周二"){ weeknum = 2; }
        	if(week == "周三"){ weeknum = 3; }
        	if(week == "周四"){ weeknum = 4; }
        	if(week == "周五"){ weeknum = 5; }
        	if(week == "周六"){ weeknum = 6; }
        	if(week == "周日"){ weeknum = 7; }
        	//规范化时间数据找行数
        	var start = date[i].start.hours;       	
        	var startm = date[i].start.minutes;       	
        	var starts = date[i].start.seconds;
      	    //=======================================================
        	var end = date[i].end.hours;      	    
        	var endm = date[i].end.minutes;    	
        	var ends = date[i].end.seconds;
        	//=======================================================
        	var fiveend = 13*3600+30*60+0*1 ;
        	var fivestart = 11*3600+35*60+0*1;
        	var fiveclass = fiveend - fivestart;
        	
        	var tenend = 18*3600+30*60+0*1 ;
        	var tenstart = 17*3600+5*60+0*1;
        	var tenclass = tenend - tenstart;
        	
        	var startall = start * 3600 + startm * 60 + starts * 1 ;       	
        	var chushu = 45 * 60 ; 
        	var endall = end * 3600 + endm * 60 + ends * 1 ;
        	var cha = endall - startall;
        	var classnum;
        	
        	if(start == 8)
        	{
        		if(startm == 55)
        		{
        			hang = 2;
        		}
        		else
        		{
        			hang = 1;
        		}
        	}
        	if(start == 9) { hang=3; }
        	if(start == 10) { hang=4; }
        	if(start == 11) { hang=5; }
        	if(start == 13) { hang=6; }
        	if(start == 14) { hang=7; }
        	if(start == 15) { hang=8; }
        	if(start == 16) { hang=9; }
        	if(start == 17) { hang=10; }
        	if(start == 18) { hang=11; }
        	if(start == 19) { hang=12; }
        	if(start == 20) { hang=13; }
        	
        	//alert("test2");
        	
        	if(end == 8) { hangE=1; }
          	if(end == 9) { hangE=2; }
        	if(end == 10) { hangE=3; }
        	if(end == 11) { hangE=4; }
        	if(end == 13) { hangE=5; }
        	if(end == 14) { hangE=6; }
        	if(end == 15) { hangE=7; }
        	if(end == 16) { hangE=8; }
        	if(end == 17) { hangE=9; }
        	if(end == 18) { hangE=10; }
        	if(end == 19) { hangE=11; }
        	if(end == 20) { hangE=12; }
        	if(end == 21) { hangE=13; }
        	
        	classnum = hangE - hang + 1;
       	   // System.out.println(classnum +" "+hang );
       	    //console.log("hang"+weeknum);
        	//alert(hang+" "+weeknum);
        	for(var ooo = 0; ooo<classnum; ooo++){
        		if(ooo == 0)
        		{
        			if(classnum == 1)
        			{
	                	var td1 = tb.rows[hang+ooo].cells[weeknum];//获取0行0列的td单元格
	                    td1.innerHTML = date[i].name+"</br>"+ date[i].site+"</br>";//+start+":"+startm+":"+starts+"-"+end+":"+endm+":"+ends;//动态修改表格的内容为222
	            		td1.className = "blockS4";	       				
        			}else{
	                	var td1 = tb.rows[hang+ooo].cells[weeknum];//获取0行0列的td单元格
	                    td1.innerHTML = date[i].name+"</br>"+ date[i].site+"</br>";//+start+":"+startm+":"+starts+"-"+end+":"+endm+":"+ends;//动态修改表格的内容为222
	            		td1.className = "blockS";	
        			}
        		}else
        		{
        			if(ooo+1 == classnum)
        			{
                    	var td1 = tb.rows[hang+ooo].cells[weeknum];//获取0行0列的td单元格
                        //td1.innerHTML = date[i].name+"</br>"+"("+(ooo+1)+")";//+start+":"+startm+":"+starts+"-"+end+":"+endm+":"+ends;//动态修改表格的内容为222
                		td1.className = "blockS3";	
        			}else
        			{
                    	var td1 = tb.rows[hang+ooo].cells[weeknum];//获取0行0列的td单元格
                        //td1.innerHTML = date[i].name+"</br>"+"("+(ooo+1)+")";//+start+":"+startm+":"+starts+"-"+end+":"+endm+":"+ends;//动态修改表格的内容为222
                		td1.className = "blockS2";	
        			}

        		}
        	}  	
         }
                 
    </script>
		 
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.9.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>