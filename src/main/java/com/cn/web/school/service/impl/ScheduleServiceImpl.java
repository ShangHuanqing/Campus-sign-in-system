package com.cn.web.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.web.school.dao.ScheduleMapper;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.service.ScheduleService;


@Service("ScheduleService")
@Transactional
public class ScheduleServiceImpl implements ScheduleService{

	@Resource
	private ScheduleMapper scheduleMapper;
	
	
	@Override
	public List<Schedule> selectAllByteacherCode(String teachercode)
	{
		return scheduleMapper.selectAllByteacherCode(teachercode);
	}
	
	
	
	@Override
	public boolean insertinfor(Schedule schedule){
		System.out.println("添加课程--数据获取--ScheduleServiceImpl。insertinfor: 标识号码: "+schedule.getCode()+" 上课时间:"+schedule.getTime()+" "+schedule.getStart());
		try {			
			List<String> problem1 = scheduleMapper.selectcodeBycheck(schedule); //学校范围教室分布
			List<String> problem2 = scheduleMapper.selectcodeBytimecheck(schedule); //个人上课时间范围
			System.out.print("添加课程--数据获取--ScheduleServiceImpl。insertinfor: 重叠信息: "+problem1);
			if(problem1.size() == 0 && problem2.size() == 0)
			{				 
				scheduleMapper.insert(schedule);
			    return true ;	
				 
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}



	@Override
	public List<Schedule> selectinfoBySchCode(Schedule b1) {
		// TODO Auto-generated method stub
		return scheduleMapper.selectInforByCode(b1);
	}



	@Override
	public void deleteallinfor(String code) {
		// TODO Auto-generated method stub
		scheduleMapper.deleteByCode(code);
	}



	@Override
	public List<Schedule> selectinfoByonlyCode(String codenum) {
		// TODO Auto-generated method stub
		return scheduleMapper.selectallBycode(codenum);
	}

}

