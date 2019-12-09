package com.cn.web.school.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Size;

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
import com.cn.web.school.dao.SubjectMapper;
import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.po.Subject;
import com.cn.web.school.po.Teacher;
import com.cn.web.school.service.AttendanceService;
import com.cn.web.school.service.RecordService;
import com.cn.web.school.service.ScheduleService;
import com.cn.web.school.service.SubjectService;
import com.cn.web.school.service.TeacherLoginService;

@Controller
public class AttendanceController {
	
	
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
    } 

	@Resource
	private AttendanceService attendanceService;
	@Resource
	private ScheduleService scheduleService;
	@Resource
	private RecordService recordService;
	@Resource
	private SubjectService subjectService;
	@Resource 
	private SubjectMapper subjectMapper;

	@RequestMapping(value="/mapInformation", method = RequestMethod.GET)
	public String mapinfor1(@ModelAttribute Record record, ModelMap model)
	{
		return "/indexMap";
	}
	
	@RequestMapping(value="/mapInformation", method = RequestMethod.POST)
	public String mapinfor(@ModelAttribute Attendance attendance, ModelMap model,HttpSession httpSession)
	{
		List<Attendance> A1 = attendanceService.selectByattendcode(attendance);
		A1.get(0);
		List<Record> A2 = recordService.selectRecordByAttendancecode(attendance.getAttendcode());
        if(A2.size() == 0)
        {   		
    		httpSession.setAttribute("attendcode", A1.get(0).getAttendcode());
    		httpSession.setAttribute("longitude", A1.get(0).getLongitude());
    		httpSession.setAttribute("latitude", A1.get(0).getLatitude());
    		httpSession.setAttribute("deviation", A1.get(0).getDeviation());
    		return "/map";
        }else {
    		httpSession.setAttribute("attendcode", A1.get(0).getAttendcode());
    		httpSession.setAttribute("longitude", A1.get(0).getLongitude());
    		httpSession.setAttribute("latitude", A1.get(0).getLatitude());
    		httpSession.setAttribute("deviation", A1.get(0).getDeviation());
    		
    		//=================================================================
    		int size = A2.size();
    		Record[] arr = (Record[])A2.toArray(new Record[size]);
    		int alr = arr.length;	
    		System.out.println(arr[0].getStudentCode());
    		
    		String[][] arr1 = new String [size][3];
    		for(int i=0; i <size; i++)
    		{
    			System.out.println(arr[i].getStudentCode());
    			arr1[i][0] = arr[i].getStudentCode();
    			arr1[i][1] = arr[i].getLongitude()+","+arr[i].getLatitude();
    			arr1[i][2] = arr[i].getValid();
    		}   		
    		JSONArray jsonarray = JSONArray.fromObject(arr);
    		System.out.println(jsonarray);	
    		String json = jsonarray.toString();
    		System.out.println(json);	
    		model.put("jsoninfo",json);
    		return "/map";
		}
	}
		
	@RequestMapping(value="/recordInformation", method = RequestMethod.GET)
	public String recordinfor(@ModelAttribute Record record, ModelMap model)
	{
		String code =record.getAttendcode();
		if(code=="" || code == null)
		{
			return "/recordTable";
		}
		List<Record> A1 = recordService.selectRecordByAttendancecode(code);
		if(A1.size()==0)
		{
			model.put("recordinfor","*还未有学生进行签到");
			return "/recordTable";
		}else{
			model.addAttribute("recordinfor", A1);
			return "/recordTable";
		}
	}
	
	@RequestMapping(value="/recordInformation", method = RequestMethod.POST)
	public String recordinfor1(@ModelAttribute Record record, ModelMap model)
	{
		String code =record.getAttendcode();
        String sch = record.getSchedulCode();
        System.out.println("BUG:  "+code+" "+sch);
		if(code=="" || code == null)
		{
			return "/recordTable";
		}
		List<Record> A1 = recordService.selectRecordByAttendancecode(code);
		List<Subject> A2 = subjectService.selectstuinforBy(record);
		List<Subject> A3 = subjectMapper.selectchoseclass(sch); 
		if(A3.size() == 0)
		{
			model.put("recordinfor1","*还未有学生选择本节课");
			return "/recordTable";
		}else{
			model.addAttribute("subjectinfo",A2);
			model.addAttribute("recordinfor", A1);
			return "/recordTable";
		}
	}
	
	
	@RequestMapping(value="/attendanceInformation", method = RequestMethod.GET)
	public String attendanceInfo(@ModelAttribute Attendance attendance, ModelMap model,HttpSession httpSession){
		Teacher teacher;
		teacher = (Teacher) httpSession.getAttribute("teacher1");
		List<Attendance> A2 = attendanceService.selectAllByteacherCode(teacher.getCode());
		if(A2.size()==0)
		{
			model.addAttribute("attendanceput2","*该教师还未发布考勤");
			return "/attendanceInfor";
		}else{
			//System.out.println("ZP:  "+A2.size()+" "+A2.get(A2.size()-1).getStart());	
			//Attendance A3 = A2.get(0);
			//System.out.println("ATTENDANCEController： "+A3.getStart());
	 		model.addAttribute("attendanceinfor1", attendanceService.selectAllByteacherCode(teacher.getCode()));
			return "/attendanceInfor";
		}	
	}
	
	
	@RequestMapping(value="/putattendanceinsert", method = RequestMethod.POST)
	public String attendanceIn(@ModelAttribute Attendance attendance,ModelMap model){
		if(attendanceService.insertattend(attendance))
		{
			model.put("attendanceput2","添加成功！");
			return "/operSuccess";
		}else{
			model.put("attendanceput2","添加失败！");
			return "/operError";
		}		
	}
	
	
	@RequestMapping(value="/attendancePut", method = RequestMethod.GET)
	public String courseShow(@ModelAttribute Schedule schedule, ModelMap model,HttpSession httpSession){
		Teacher teacher;
		teacher = (Teacher) httpSession.getAttribute("teacher1");
		List<Schedule> A2 = scheduleService.selectAllByteacherCode(teacher.getCode());
		if(A2.size()==0)
		{
			model.addAttribute("attendanceput2","*该教师还未发布课程");
			return "/attendancePut";
		}else{
			//System.out.println("ZP:  "+A2.size()+" "+A2.get(A2.size()-1).getStart());	
			model.addAttribute("attendanceput1", scheduleService.selectAllByteacherCode(teacher.getCode()));
			return "/attendancePut";
		}	
	
	}
	
}