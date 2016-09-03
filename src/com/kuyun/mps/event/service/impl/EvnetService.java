package com.kuyun.mps.event.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kuyun.mps.common.bean.Page;
import com.kuyun.mps.common.util.StringUtil;
import com.kuyun.mps.event.mapper.EventMapper;
import com.kuyun.mps.event.model.TEvent;
import com.kuyun.mps.event.service.IEvnetService;

@Service("eventService")
@Transactional
public class EvnetService implements IEvnetService {

	/**
	 * 事件操作的Dao
	 */
	@Autowired
	private EventMapper eventDao;

	/**
	 * 查询事件列表
	 * 
	 * @param map
	 * @return Page
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Page getEventList(Map<String, String> map) {
		int count = this.getCount(map);
		int pageNo = Integer.parseInt(map.get("pageNo"));
		int pageSize = Integer.parseInt(map.get("pageSize"));
		int startNo = 0;
		int endNo = 0;
		startNo = (pageNo - 1) * pageSize;
		endNo = pageNo * pageSize;
		@SuppressWarnings("rawtypes")
		Map paramsMap = new HashMap();
		paramsMap.put("startNo", startNo);
		paramsMap.put("eventName", map.get("eventName"));
		paramsMap.put("appCode", map.get("appCode"));
		paramsMap.put("endNo", endNo);
		return new Page(eventDao.getEventList(paramsMap), count, pageNo,
				pageSize);
	}

	/**
	 * 查询记录条数
	 * 
	 * @return
	 */
	public int getCount(Map<String, String> map) {
		return eventDao.getCount(map);
	}

	/**
	 * 添加配置Event
	 * 
	 * @param event
	 *            Event
	 * @return 成功返回1，失败返回0
	 */
	public void saveEvent(TEvent event) {
		String eventId = "E" + event.getApp_code() + StringUtil.getRandom(8);
		event.setEvent_id(eventId);
		eventDao.saveEvnet(event);
	}

	/**
	 * 修改Event事件
	 * 
	 * @param event
	 * @return
	 */
	public boolean updateEvent(TEvent event) {
		return eventDao.updateEvent(event);
	}

	/**
	 * 删除Event事件
	 * 
	 * @param event
	 * @return
	 */
	public void deleteEventById(List<String> list) {
		eventDao.deleteEventById(list);
	}
	
	
	/**
	 * 根据appId查询event列表
	 * @param appId   应用Id
	 * @return  List<TEvent>
	 */
	public List<TEvent> getEventByappCode(String appCode){
		return eventDao.getEventByappCode(appCode);
	}
	
	
	
	/**
	 * 根据eventId查询Evnet
	 * @param eventId   事件Id
	 * @return  List<TEvent>
	 */
	public TEvent  getEventByEventId(String eventId){
		return eventDao.getEventByEventId(eventId);
	}
}
