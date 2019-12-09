package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Attendance;
import com.cn.web.school.po.Record;
import com.cn.web.school.po.Schedule;

/** * @author  作者 :ZJUT Shanghq 
 * @date 创建时间：2016年1月23日 上午11:30:53
 * @version 1.0 
 */
public interface AttendanceService {

	boolean insertattend(Attendance attendance);

	List<Attendance> selectAllByteacherCode(String code);

	List<Attendance> selectByattendcode(Attendance attendance);

}

