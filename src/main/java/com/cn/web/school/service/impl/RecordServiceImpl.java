package com.cn.web.school.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.web.school.dao.RecordMapper;
import com.cn.web.school.po.Record;
import com.cn.web.school.service.RecordService;

/** * @author  作者 :ZJUT Shanghq 
 * @date 创建时间：2016年1月26日 下午12:03:41
 * @version 1.0 
 */

@Service("RecordService")
@Transactional
public class RecordServiceImpl implements RecordService{

	@Resource
	RecordMapper recordMapper;

	@Override
	public List<Record> selectRecordByAttendancecode(String code) {
		// TODO Auto-generated method stub
		return recordMapper.selectRecordByAttendancecode(code);
	}

	@Override
	public void updaterecordinfor(Record record) {
		// TODO Auto-generated method stub
		//String a = record.getValid();
		recordMapper.updateinfoByValid(record);
	}

	@Override
	public void recorddelete(Record record) {
		// TODO Auto-generated method stub
		recordMapper.deleteBystudentcode(record);
	}

	@Override
	public List<Record> selectallBystu(String code) {
		// TODO Auto-generated method stub
		return recordMapper.selectallBycode(code);
	}
}

