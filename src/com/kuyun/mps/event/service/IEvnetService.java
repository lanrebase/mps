package com.kuyun.mps.event.service;

import java.util.List;
import java.util.Map;

import com.kuyun.mps.common.bean.Page;
import com.kuyun.mps.event.model.TEvent;

public interface IEvnetService {
	
	/**
	 * 查询事件列表
	 * @param map
	 * @return  Page
	 */
	public  Page getEventList(Map<String,String> map);
	
	
	/**
	 * 查询记录条数
	 * @return
	 */
    public int getCount(Map<String,String> map);
	
	/**
	 * 添加配置Event
	 * @param event  Event
	 * @return  成功返回1，失败返回0
	 */
	public  void  saveEvent(TEvent event);
	
	
	/**
	 * 修改Event事件
	 * @param event
	 * @return
	 */
	public  boolean updateEvent(TEvent event);
	
	
	/**
	 * 删除Event事件
	 * @param event
	 * @return
	 */
	public  void  deleteEventById(List<String> list);


	/**
	 * 根据appId查询event列表
	 * @param appId   应用Id
	 * @return  List<TEvent>
	 */
	public List<TEvent> getEventByappCode(String appId);
	
	/**
	 * 根据eventId查询Evnet
	 * @param eventId   事件Id
	 * @return  List<TEvent>
	 */
	public TEvent  getEventByEventId(String eventId);
	
}
