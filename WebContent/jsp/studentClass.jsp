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
	html,body {width:100%; height:100%;margin:0px auto;}
	.containerS{width:100%; height:100%; float:left;}
	th{width:10%;height:7%;text-align:center;}	
	.blockS { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:10px 10px 0px 0px;}
	.blockS2 { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);}
	.blockS3 { height: 10px;  background-color: blue; background-color: rgba(138, 185, 210, 0.87);border-radius:0px 0px 10px 10px; 
    border-bottom-width: 3px;}
	</style>
</head>
<body>
<input type="hidden" id = "json" value=${jsoninfo} >

<!--   <div data-role="header">
   <a href="" data-transition="slide" data-direction="reverse" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left">主页</a>
    <h1>&nbsp;</h1>
  </div> -->
  

  <p style="color:red;">${message}</p>
    <table data-role="table" data-mode="columntoggle" class="ui-responsive" id="test">
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
                	var td1 = tb.rows[hang+ooo].cells[weeknum];//获取0行0列的td单元格
                    td1.innerHTML = date[i].name+"</br>"+ date[i].site+"</br>";//+start+":"+startm+":"+starts+"-"+end+":"+endm+":"+ends;//动态修改表格的内容为222
            		td1.className = "blockS";	
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