package com.cn.web.school.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.scripting.xmltags.VarDeclSqlNode;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cn.web.school.dao.AttendanceMapper;
import com.cn.web.school.dao.RecordMapper;
import com.cn.web.school.dao.ScheduleMapper;
import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Subject;
import com.cn.web.school.service.RecordService;
import com.cn.web.school.service.SubjectService;


@Controller
public class RecordController {
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
    } 
	
	@Resource
	private RecordService recordService;
	
	@Resource
	private SubjectService subjectService;
	
	@Resource
	private AttendanceMapper attendanceMapper;
		
	@Resource
	private ScheduleMapper scheduleMapper;
	
	@Resource
	private RecordMapper recordMapper;
	
	 static double DEF_PI = 3.14159265359; // PI
     static double DEF_2PI= 6.28318530712; // 2*PI
     static double DEF_PI180= 0.01745329252; // PI/180.0
     static double DEF_R =6370693.5; // radius of earth
             //适用于近距离
     public static double GetShortDistance(double lon1, double lat1, double lon2, double lat2)
     {
         double ew1, ns1, ew2, ns2;
         double dx, dy, dew;
         double distance;
         // 角度转换为弧度
         ew1 = lon1 * DEF_PI180;
         ns1 = lat1 * DEF_PI180;
         ew2 = lon2 * DEF_PI180;
         ns2 = lat2 * DEF_PI180;
         // 经度差
         dew = ew1 - ew2;
         // 若跨东经和西经180 度，进行调整
         if (dew > DEF_PI)
         dew = DEF_2PI - dew;
         else if (dew < -DEF_PI)
         dew = DEF_2PI + dew;
         dx = DEF_R * Math.cos(ns1) * dew; // 东西方向长度(在纬度圈上的投影长度)
         dy = DEF_R * (ns1 - ns2); // 南北方向长度(在经度圈上的投影长度)
         // 勾股定理求斜边长
         distance = Math.sqrt(dx * dx + dy * dy);
         return distance;
     }
	
    public static int gettimenumber(String times)
    {
    	int numbers=0;
    	String sourceStr = times;
        String[] A1 = sourceStr.split(":");
        int hour = Integer.parseInt(A1[0]);
        int minutes = Integer.parseInt(A1[1]);
        int seconds = Integer.parseInt(A1[2]);
        numbers = hour*3600 + minutes*60 + seconds*1;
    	return numbers;
    }
	
    public static String getWeek(Date date){  
        String[] weeks = {"周日","周一","周二","周三","周四","周五","周六"};  
        Calendar cal = Calendar.getInstance();  
        cal.setTime(date);  
        int week_index = cal.get(Calendar.DAY_OF_WEEK) - 1;  
        if(week_index<0){  
            week_index = 0;  
        }   
        return weeks[week_index];  
    }  
    
	@RequestMapping(value="/studentRecordinfo", method = RequestMethod.POST)
	public String AddstudentRecord(@ModelAttribute Record record, ModelMap model)
	{
		System.out.println("获取的签到数据："+record.getAttendcode()+" "+record.getLongitude()+" "+record.getLatitude()+" "+record.getStudentCode());
		//===========签到坐标
		String longitude1 = record.getLongitude();
		String latitude = record.getLatitude();
		Double long1 = Double.parseDouble(longitude1);
		Double lati1 = Double.parseDouble(latitude);
		
		//new date设置签到时间		
		Date recordtimeDat = new Date();
		SimpleDateFormat riqi= new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String biaodan=riqi.format(recordtimeDat);
		System.out.println("签到时间："+biaodan);
		String[] nowtimeyear = biaodan.split(" ");
		String nowyear = nowtimeyear[0];//年份
		int nowtimes = gettimenumber(nowtimeyear[1]);//小时
		
		
		//获取该考勤号码下的课程号码
		Attendance A1 = attendanceMapper.seletBycode(record.getAttendcode());		
		String schedule_codeString = A1.getScheduleCode();
			
		//===========考勤坐标
		String longitude2 = A1.getLongitude();
		String latitude2 = A1.getLatitude();
		Double long2 = Double.parseDouble(longitude2);
		Double lati2 = Double.parseDouble(latitude2);
		
		//==计算距离(根据距离判断)		
		Double distance = GetShortDistance(long1, lati1, long2, lati2); //点之间的距离
		Double classfanweiDouble = Double.parseDouble(A1.getDeviation());//误差允许范围
		System.out.println("坐标距离 ："+distance);
		
		//获取发布考勤的结束时间
		
		Date endtime = A1.getEnd();
		
		String weektime1 = getWeek(endtime);
		
		String biaodan1=riqi.format(endtime);
		System.out.println("考勤结束时间："+biaodan1+" "+weektime1);
		String[] endtimeyear = biaodan1.split(" ");
		String endyear = endtimeyear[0];//年份
		int endtimes = gettimenumber(endtimeyear[1]);//小时
		
		
		//获取上课的结束时间
		Schedule ddddd = new Schedule();
		ddddd.setCode(schedule_codeString);
		ddddd.setTime(weektime1);
		System.out.println("ddddd的测试："+ddddd.getCode()+"  "+ddddd.getTime());
		List<Schedule> A2 = scheduleMapper.selecttimeBycode(ddddd);
		Date classenDate = new Date();
		for(int kk=0 ; kk<A2.size(); kk++)
		{
			classenDate = A2.get(kk).getEnd();
			SimpleDateFormat riqi1= new SimpleDateFormat("HH:mm:ss");
			String biaodan3=riqi1.format(classenDate);
			int classtimes = gettimenumber(biaodan3);//课程下课小时数
					
			String biaodan4=riqi1.format(endtime);
			int attendancetimes = gettimenumber(biaodan4);
			
			if(attendancetimes < classtimes)
			{
				break;
			}else{
				continue;
			}
		}
		SimpleDateFormat riqi1= new SimpleDateFormat("HH:mm:ss");
		String biaodan3=riqi1.format(classenDate);
		System.out.println("下课时间："+biaodan3);
		int classtimes = gettimenumber(biaodan3);//小时
		
		String valid ="";
		//System.out.println("我在准备record的数据："+schedule_codeString+" "+ endtime+" "+classenDate);
		if(!endyear.equals(nowyear))//年份的判断
		{//年份不同
			valid="缺勤";
		}
		else
		{//年份相同，没有超过考勤结束时间
			if(nowtimes <= endtimes)
			{				
				//判断距离位置
				if(classfanweiDouble >= distance)
				{
					valid="准时";
				}
				else
				{
					valid="缺勤";
				}
			}
			else
			{//超过考勤时间，没超过下课时间
				if(nowtimes < classtimes)
				{
					//判断距离位置
					if(classfanweiDouble >= distance)
					{
						valid="迟到";
					}
					else
					{
						valid="缺勤";
					}
				}
				else
				{//超过下课时间
					valid="缺勤";
				}
			}
		}
		
		System.out.println("我是："+valid);
		record.setValid(valid);
		record.setSchedulCode(schedule_codeString);
		record.setTime(recordtimeDat);
		
		recordMapper.insert(record); 
		return "index";
	}
	
	@RequestMapping(value="/recorddelete", method = RequestMethod.POST)
	public  String recorddelete1(@ModelAttribute Record record, ModelMap model)
	{
		recordService.recorddelete(record);
		String code = record.getAttendcode();
		List<Record> A1 = recordService.selectRecordByAttendancecode(code);
		if(A1.size()==0)
		{
			model.put("recordinfor1","*还未有学生进行签到");
			return "/recordTable";
		}else{
			model.addAttribute("recordinfor", A1);
			return "/recordTable";
		}
	}
	

	@RequestMapping(value="/recordUpdate", method = RequestMethod.POST)
	public  String updaterecord1(@ModelAttribute Record record, ModelMap model)
	{
		recordService.updaterecordinfor(record);
		String code = record.getAttendcode();
		List<Record> A1 = recordService.selectRecordByAttendancecode(code);
		if(A1.size()==0)
		{
			model.put("recordinfor1","*还未有学生进行签到");
			return "/recordTable";
		}else{
			model.addAttribute("recordinfor", A1);
			return "/recordTable";
		}
	}
}

