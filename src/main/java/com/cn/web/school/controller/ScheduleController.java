package com.cn.web.school.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cn.web.school.dao.ScheduleMapper;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.ScheduleList;
import com.cn.web.school.po.Teacher;
import com.cn.web.school.service.ScheduleService;
import com.cn.web.school.service.TeacherLoginService;

@Controller
public class ScheduleController {
	
	
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");  
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
    } 

	@Resource
	private ScheduleService scheduleService;
	@Resource
	private TeacherLoginService teacherLoginService;
	
	@RequestMapping(value="/chooseclassInformation",method = RequestMethod.GET)
	public String studentchoose1(@ModelAttribute Schedule schedule, ModelMap model, HttpSession httpSession)
	{
		return"/BLANK";
	}
	
	@RequestMapping(value="/chooseclassInformation",method = RequestMethod.POST)
	public String studentchoose(@ModelAttribute Schedule schedule, ModelMap model, HttpSession httpSession)
	{
		String codenum = schedule.getCode();
		List<Schedule> a1 = scheduleService.selectinfoByonlyCode(codenum);		
		if(a1.size()!=0)
		{
			Schedule kk = a1.get(0);
			String tn = kk.getTeacherCode()	;
			Integer d1 = kk.getId();
			String d2 = kk.getCode();
			String d3 = kk.getName();
			String d4 = kk.getTime();
			String d5 = kk.getSite();
			String d6 = kk.getPeriod();
			String d7 = kk.getCredit();
			String d8 = kk.getSchoolCode();
			String d9 = kk.getTeacherCode();
			Date d10 = kk.getStart();
			Date d11 = kk.getEnd();
			String t1 = teacherLoginService.selectnameBycode(tn);
			//System.out.println("选课信息的展示："+ d1+" "+d2+" "+d3+" "+d4+" "+d5+" "+d6+" "+d7+" "+d8+" "+d9+" "+d10+" "+d11+" ");
			model.put("classnamw",a1.get(0).getName());
			model.put("classteacher",a1.get(0).getTeacherCode());
			model.put("classteachername", t1);
			return "/chooseclassInfo";
		}
		else
		{
			return "/BLANK";
		}		
	}
	
	
	
	@RequestMapping(value="/courseShow", method = RequestMethod.GET)
	public String courseShow(@ModelAttribute Schedule schedule, ModelMap model,HttpSession httpSession){
		Teacher teacher;
		teacher = (Teacher) httpSession.getAttribute("teacher1");
		//System.out.println("(๑•̀ㅂ•́)و✧  :  "+teacher.getCode());		
		List<Schedule> A2 = scheduleService.selectAllByteacherCode(teacher.getCode());
		if(A2.size()==0)
		{
			model.addAttribute("courcesshowr1","该教师还未发布课程");
			return "/courseTable";
		}else{
			System.out.println("ZP:  "+A2.size()+" "+A2.get(A2.size()-1).getStart());	
			model.addAttribute("courcesshowr", scheduleService.selectAllByteacherCode(teacher.getCode()));
			return "/courseTable";
		}	
	
	}
	
	
	
	//courseInformation
	//** 教师管理平台个人信息action
	@RequestMapping(value="/courseInformation")
	public String courseinformation(@ModelAttribute Schedule schedule, ModelMap model,HttpSession httpSession){
		Teacher teacher;
		teacher = (Teacher) httpSession.getAttribute("teacher1");
		List<Schedule> A2 = scheduleService.selectAllByteacherCode(teacher.getCode());
		if(A2.size()==0)
		{
			model.put("courcesshowr1","该教师还未发布课程");
			return "/courseInfor";
		}else{
			//System.out.println("ZP:  "+A2.size()+" "+A2.get(A2.size()-1).getStart());			
    		int size = A2.size();
    		Schedule[] arr = (Schedule[])A2.toArray(new Schedule[size]);
    		JSONArray jsonarray = JSONArray.fromObject(arr);
    		System.out.println(jsonarray);	
    		String json = jsonarray.toString();
    		System.out.println("课程信息："+json);	
    		model.put("jsoninfo",json);   		
			//model.addAttribute("courcesshowr", scheduleService.selectAllByteacherCode(teacher.getCode()));
			return "/courseInfor";
		}
	}
	
	@RequestMapping(value = "/putcourseinsert", method = RequestMethod.POST)
	public String coursePut(@ModelAttribute ScheduleList schedulelist, ModelMap model,HttpSession httpSession){
		  
		
		//SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); //格式化数据
		//String as = sdf.format(schedule.getStart());		
		//System.out.println("转换时间格式: "+as); 
		//Time.valueOf(as);
		//SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		//Date date = sdf1.parse(as);
		//Date as1 = sdf.parse(as);
		//System.out.println("转换时间date格式--date: "+date);
		//schedule.setStart(as1);
		System.out.println("添加课程--获取数据--Schedulecontroller。coursePut: "+"注册姓名: "+schedulelist.getName()+" ;注册学校: "+schedulelist.getSchoolCode()+" ;上课地点: "+schedulelist.getSite()+" ;上课时间: "+schedulelist.getStart());
		
		//固定的数据字段：code（课程编码）、name（课程名称）、school_code（学校名称）、teacher_code（教师编码）、period（学时）、credit（学分）
		
		String code1 = schedulelist.getCode();
		String name1 = schedulelist.getName();
		String school_code1 = schedulelist.getSchoolCode();
		String teacher_code1 = schedulelist.getTeacherCode();
		String period1 = schedulelist.getPeriod();
		String credit1 = schedulelist.getCredit();
		
		 System.out.println("--"+code1); 
		
		//变动数据：time（上课周数）、start（起始时间）、end（结束时间）、site（上课地点）
		String time1 = schedulelist.getTime();
		String start1 = schedulelist.getStart();
		String end1 = schedulelist.getEnd();
		String site1 = schedulelist.getSite();
		
		String [] timeA = time1.split(",");
		String [] startA = start1.split(",");
		String [] endA = end1.split(",");
		String [] siteA = site1.split(",");
		List<Schedule> A1 = new ArrayList<Schedule>();
		
	    for (int i = 0 ; i <startA.length ; i++ ) {
	    	Schedule scheduleA = new Schedule();
			SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
			Date start = null;
			Date end = null;
			try {
				start = sdf1.parse(startA[i]);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				end = sdf1.parse(endA[i]);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        System.out.println("--"+startA[i]); 
	        
            scheduleA.setCode(code1);
            scheduleA.setName(name1);
            scheduleA.setSchoolCode(school_code1);
            scheduleA.setTeacherCode(teacher_code1);
            scheduleA.setPeriod(period1);
            scheduleA.setCredit(credit1);
            scheduleA.setTime(timeA[i]);
            scheduleA.setStart(start);
            scheduleA.setEnd(end);
            scheduleA.setSite(siteA[i]);              
            A1.add(scheduleA);           
	      } 
		
	    for(int kk = 0 ; kk<A1.size(); kk++)
	    {
	    	if(scheduleService.insertinfor(A1.get(kk)))
	 	    {
	    		if(kk+1 == A1.size())
	    		{
		 	    	model.put("message", "*添加课程成功");
		 	    	return "/operSuccess";
	    		}else
	    		{
	    			continue;
	    		}	 	    	
	 	    }else {
	 	    	model.put("message", "*发布的课程与本校课程已发布课程有时间重叠，请查证信息重试");
	 	    	scheduleService.deleteallinfor(A1.get(kk).getCode());
	 			return "/coursePut";
	 		}	
	    }
	    
		return "/operSuccess";
		/*	    if(scheduleService.insertinfor(schedule))
	    {
	    	model.put("message", "*添加课程成功");
	    	return "/operSuccess";
	    	
	    }else {
	    	model.put("message", "*发布的课程与本校课程已发布课程有时间重叠，请查证信息重试");
			return "/coursePut";
		}	*/	  
	} 

}

