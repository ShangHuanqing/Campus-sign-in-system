package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;

/** * @author  ���� :ZJUT Shanghq 
 * @date ����ʱ�䣺2016��1��23�� ����11:30:53
 * @version 1.0 
 */
public interface AttendanceService {

	boolean insertattend(Attendance attendance);

	List<Attendance> selectAllByteacherCode(String code);

	List<Attendance> selectByattendcode(Attendance attendance);

}

