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
		System.out.println("��ӿγ�--���ݻ�ȡ--ScheduleServiceImpl��insertinfor: ��ʶ����: "+schedule.getCode()+" �Ͽ�ʱ��:"+schedule.getTime()+" "+schedule.getStart());
		try {			
			List<String> problem1 = scheduleMapper.selectcodeBycheck(schedule); //ѧУ��Χ���ҷֲ�
			List<String> problem2 = scheduleMapper.selectcodeBytimecheck(schedule); //�����Ͽ�ʱ�䷶Χ
			System.out.print("��ӿγ�--���ݻ�ȡ--ScheduleServiceImpl��insertinfor: �ص���Ϣ: "+problem1);
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

