package com.finance.entity;

/**
 * 数据库管理层的实体
 * @author mickkong
 *
 */
public class Database {
	private Integer id; // 编号
	private Integer userid; // 用户编号
	private String filename; // 时间
	private String time; // 时间
	private String location; // 路径
	private Integer dataid; // 操作类型编号
	
	private String username;//搜索用户名
	private String starttime;//搜索起始时间
	private String endtime;//搜索截止时间
	private String datadicvalue;//操作名
	private Integer startid;
	private Integer endid;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getDatadicvalue() {
		return datadicvalue;
	}
	public void setDatadicvalue(String datadicvalue) {
		this.datadicvalue = datadicvalue;
	}
	public Integer getStartid() {
		return startid;
	}
	public void setStartid(Integer startid) {
		this.startid = startid;
	}
	public Integer getEndid() {
		return endid;
	}
	public void setEndid(Integer endid) {
		this.endid = endid;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Integer getDataid() {
		return dataid;
	}
	public void setDataid(Integer dataid) {
		this.dataid = dataid;
	}
	
}
