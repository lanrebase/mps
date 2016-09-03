package com.kuyun.mps.event.model;

/**
 * 事件源定义
 * 
 * @author liangbz 2016-8-27
 */
public class TEvent {
	/**
	 * 事件Id
	 */
	private String event_id;

	/**
	 * app_code
	 */
	private String app_code;

	/**
	 * 事件名称
	 */
	private String event_name;

	/**
	 * 事件描述
	 */
	private String event_desc;

	/**
	 * 操作类型
	 */
	private String op_type;

	/**
	 * 积分数
	 */
	private int score;

	public String getEvent_id() {
		return event_id;
	}

	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}

	public String getApp_code() {
		return app_code;
	}

	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getEvent_desc() {
		return event_desc;
	}

	public void setEvent_desc(String event_desc) {
		this.event_desc = event_desc;
	}

	public String getOp_type() {
		return op_type;
	}

	public void setOp_type(String op_type) {
		this.op_type = op_type;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}
