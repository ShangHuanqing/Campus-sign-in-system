package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Schedule;

public interface ScheduleService {

	boolean insertinfor(Schedule schedule);

	List<Schedule> selectAllByteacherCode(String teachercode);

	List<Schedule> selectinfoBySchCode(Schedule b1);

	void deleteallinfor(String code);

	List<Schedule> selectinfoByonlyCode(String codenum);

}

