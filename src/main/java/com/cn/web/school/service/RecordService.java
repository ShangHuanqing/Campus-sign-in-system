package com.cn.web.school.service;

import java.util.List;

import com.cn.web.school.po.Record;

/** * @author  作者 :ZJUT Shanghq 
 * @date 创建时间：2016年1月26日 下午12:03:27
 * @version 1.0 
 */
public interface RecordService {

	List<Record> selectRecordByAttendancecode(String code);

	void updaterecordinfor(Record record);

	void recorddelete(Record record);

	List<Record> selectallBystu(String code);

}

