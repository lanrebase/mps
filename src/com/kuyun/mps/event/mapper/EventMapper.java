package com.kuyun.mps.event.mapper;

import java.util.List;
import java.util.Map;

import com.kuyun.mps.event.model.TEvent;

/**
 * 事件操作的Dao
 * @author liangbz
 * 2016-8-27
 */
public interface EventMapper {
	/**
	 * 查询记录条数
	 * @return
	 */
    public int getCount(Map<String,String> map);
	
    /**
     * 查询事件的List
     * @param map  查询条件
     * @return     List<Event>
     */
	public List<TEvent> getEventList(Map<String,String> map);
	
	
	/**
	 * 保存事件
	 * @param event
	 */
	public void saveEvnet(TEvent event);
	
	
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
	public List<TEvent> getEventByappCode(String appCode);

	/**
	 * 根据eventId查询Evnet
	 * @param eventId   事件Id
	 * @return  List<TEvent>
	 */
	public TEvent getEventByEventId(String eventId);
}
