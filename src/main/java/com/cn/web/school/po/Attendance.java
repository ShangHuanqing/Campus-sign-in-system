package com.cn.web.school.po;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Attendance {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.id
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.schedule_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String scheduleCode;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.longitude
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String longitude;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.latitude
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String latitude;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.start
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date start;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.end
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date end;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.deviation
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String deviation;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String code;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.teacher_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String teacherCode;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.attendcode
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String attendcode;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column attendance.school_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	private String schoolCode;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.id
	 * @return  the value of attendance.id
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.id
	 * @param id  the value for attendance.id
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.schedule_code
	 * @return  the value of attendance.schedule_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getScheduleCode() {
		return scheduleCode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.schedule_code
	 * @param scheduleCode  the value for attendance.schedule_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setScheduleCode(String scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.longitude
	 * @return  the value of attendance.longitude
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getLongitude() {
		return longitude;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.longitude
	 * @param longitude  the value for attendance.longitude
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.latitude
	 * @return  the value of attendance.latitude
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getLatitude() {
		return latitude;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.latitude
	 * @param latitude  the value for attendance.latitude
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.start
	 * @return  the value of attendance.start
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStart() {
		return start;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.start
	 * @param start  the value for attendance.start
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setStart(Date start) {
		this.start = start;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.end
	 * @return  the value of attendance.end
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEnd() {
		return end;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.end
	 * @param end  the value for attendance.end
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setEnd(Date end) {
		this.end = end;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.deviation
	 * @return  the value of attendance.deviation
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getDeviation() {
		return deviation;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.deviation
	 * @param deviation  the value for attendance.deviation
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setDeviation(String deviation) {
		this.deviation = deviation;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.code
	 * @return  the value of attendance.code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getCode() {
		return code;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.code
	 * @param code  the value for attendance.code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.teacher_code
	 * @return  the value of attendance.teacher_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getTeacherCode() {
		return teacherCode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.teacher_code
	 * @param teacherCode  the value for attendance.teacher_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setTeacherCode(String teacherCode) {
		this.teacherCode = teacherCode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.attendcode
	 * @return  the value of attendance.attendcode
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getAttendcode() {
		return attendcode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.attendcode
	 * @param attendcode  the value for attendance.attendcode
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setAttendcode(String attendcode) {
		this.attendcode = attendcode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column attendance.school_code
	 * @return  the value of attendance.school_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public String getSchoolCode() {
		return schoolCode;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column attendance.school_code
	 * @param schoolCode  the value for attendance.school_code
	 * @mbggenerated  Sun Jan 24 13:08:21 CST 2016
	 */
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
}