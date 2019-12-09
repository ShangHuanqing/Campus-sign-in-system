package com.cn.web.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.web.school.dao.AttendanceMapper;
import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;
import com.cn.web.school.service.AttendanceService;

/** * @author  ���� :ZJUT Shanghq 
 * @date ����ʱ�䣺2016��1��23�� ����11:31:56
 * @version 1.0 
 */

@Service("AttendanceService")
@Transactional
public class AttendanceServiceImpl implements AttendanceService{
	@Resource
	AttendanceMapper attendanceMapper;

	@Override
	public boolean insertattend(Attendance attendance) {
		// TODO Auto-generated method stub
		String a =attendanceMapper.selectDayByTime(attendance);		
		if(a == null || a == "")
		{
			attendanceMapper.insert(attendance);
			return true;
		}else {		
			int b = Integer.parseInt(a);
			System.out.print(b);
			if(b<=1){
				return false;
			}else {
				attendanceMapper.insert(attendance);
				return true;
			}
		}

	}

	@Override
	public List<Attendance> selectAllByteacherCode(String code) {
		// TODO Auto-generated method stub
		return attendanceMapper.selectAllByteacherCode(code);
	}

	@Override
	public List<Attendance> selectByattendcode(Attendance attendance) {
		// TODO Auto-generated method stub
		return attendanceMapper.selectByattendcode(attendance);
	}

}

