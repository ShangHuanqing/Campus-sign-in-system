package com.cn.web.school.dao;

import com.cn.web.school.po.Record;
import com.cn.web.school.po.RecordExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface RecordMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int countByExample(RecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int deleteByExample(RecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int insert(Record record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int insertSelective(Record record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    List<Record> selectByExample(RecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    Record selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int updateByExampleSelective(@Param("record") Record record, @Param("example") RecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int updateByExample(@Param("record") Record record, @Param("example") RecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int updateByPrimaryKeySelective(Record record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table record
     *
     * @mbggenerated Tue Jan 26 11:05:59 CST 2016
     */
    int updateByPrimaryKey(Record record);

	List<Record> selectRecordByAttendancecode(String code);

	void updateinfoByValid(Record record);

	void deleteBystudentcode(Record record);

	List<Record> selectallBycode(String code);
}