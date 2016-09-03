package com.kuyun.mps.event.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kuyun.mps.common.bean.Page;
import com.kuyun.mps.common.constant.GlobalConstants;
import com.kuyun.mps.event.model.TEvent;
import com.kuyun.mps.event.service.IEvnetService;

/**
 * 事件定义的Controller
 * @author liangbz
 * 2016-8-27
 */

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private  IEvnetService  eventService;
	/**
	 * 查询产品List
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getEventList.do", method = RequestMethod.GET)
	public   String getEventList(HttpServletRequest request) {	
		Map<String,String> map = new  HashMap<String,String>();		
		String pageNo = request.getParameter("pageNo");
		String eventId = request.getParameter("eventId");
		String appCode = request.getParameter("appCode");
		if(pageNo == null || "".equals(pageNo)){
			pageNo = "1";
		}
		String pageSize = GlobalConstants.DEFAULT_PAGE_SIZE+"";
		map.put("pageNo", pageNo);
		map.put("pageSize", pageSize);
		map.put("eventId", eventId);
		map.put("appCode", appCode);
		Page  eventPage = eventService.getEventList(map);
		request.setAttribute("eventPage", eventPage);
		return "event/event";
	} 
	
	/**
	 * 查询产品List
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/deleteEvent/{eventId}", method=RequestMethod.POST)
	public   String deleteEvent(@PathVariable String eventId,HttpServletRequest request) {	
		// return eventService.deleteEvent(eventId);
		return "";
	} 
	
	/**
	 * 查询产品List
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/saveEvent.do", method=RequestMethod.POST)
	public   String saveEvent(TEvent tEvent) {
		eventService.saveEvent(tEvent);
		return "/event/event";
	} 
	
	
	/**
	 * 查询产品List
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/openEventPage.do", method=RequestMethod.POST)
	public   String openEventPage(@PathVariable String eventId,HttpServletRequest request) {	
		// return eventService.deleteEvent(eventId);
		return "";
	} 
}
