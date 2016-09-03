package com.kuyun.mps.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
 * 
 * @author liangbz 2016-8-27
 */

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	private IEvnetService eventService;
	
	
	/**
	 * 查询产品List
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/initEventPage.do", method = RequestMethod.GET)
	public String initEventPage(HttpServletRequest request) {
		
		return "event/event";
	}

	/**
	 * 查询产品List
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getEventList.do", method = RequestMethod.GET)
	public String getEventList(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		String pageNo = request.getParameter("pageNo");
		String eventId = request.getParameter("eventId");
		String appCode = request.getParameter("appCode");
		if (pageNo == null || "".equals(pageNo)) {
			pageNo = "1";
		}
		String pageSize = GlobalConstants.DEFAULT_PAGE_SIZE + "";
		map.put("pageNo", pageNo);
		map.put("pageSize", pageSize);
		map.put("eventId", eventId);
		map.put("appCode", appCode);
		Page eventPage = eventService.getEventList(map);
		request.setAttribute("eventPage", eventPage);
		return "event/event_list";
	}


	/**
	 * 查询产品List
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveEvent.do", method = RequestMethod.POST)
	public String saveEvent(HttpServletRequest request) {
		String app_code = request.getParameter("app_code");
		String event_name = request.getParameter("event_name");
		String event_desc = request.getParameter("event_desc");
		String op_type = request.getParameter("op_type");
		String score = request.getParameter("score");
		TEvent  event = new  TEvent();
		event.setApp_code(app_code);
		event.setEvent_name(event_name);
		event.setEvent_desc(event_desc);
		event.setOp_type(op_type);
		event.setScore(Integer.parseInt(score));
		
		eventService.saveEvent(event);
        
		return "/event/event";
	}

	

	/**
	 * 查询产品List
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/openEventPage.do", method = RequestMethod.POST)
	public String openEventPage(@PathVariable String eventId,
			HttpServletRequest request) {
		// return eventService.deleteEvent(eventId);
		return "";
	}
	
	/**
	 * 查询应用列表，拼装为下拉框
	 * @param request   HttpServletRequest
	 * @param response  HttpServletResponse
	 * @return   拼装下拉列表
	 */
	@RequestMapping(value = "/getEventByappCode.do", method = RequestMethod.GET)
	public void getEventByappId(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String appCode = request.getParameter("appCode");
			List<TEvent> eventList = eventService.getEventByappCode(appCode);		
			StringBuffer strSelect = new StringBuffer();
			if (null != eventList && !eventList.isEmpty()) {
				for (int i = 0; i < eventList.size(); i++) {
					TEvent event = eventList.get(i);
					strSelect.append("<option  value='"+ event.getEvent_id() + "'>"+ event.getEvent_id() + "|"+ event.getEvent_name() + "<option>");
				}
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(strSelect.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 查询应用列表，拼装为下拉框
	 * @param request   HttpServletRequest
	 * @param response  HttpServletResponse
	 * @return   拼装下拉列表
	 * @throws IOException 
	 */
	@RequestMapping(value = "/deleteEventById.do", method = RequestMethod.GET)
	public void deleteEventById(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		try {
			String eventId = request.getParameter("eventId");
			List<String>  eventList = new ArrayList<String>();
			String[]  eventIdArray = eventId.split(",");// Id由逗号分隔
			for (int i = 0; i < eventIdArray.length; i++) {
				eventList.add(eventIdArray[i]);
			}
			// 做业务规则的判断，判断是否可以删除
			eventService.deleteEventById(eventList);		

			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("删除成功");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("删除发生错误，异常为"+e.getMessage());
		}
		
	}
	
	
	
	/**
	 * 查询应用列表，拼装为下拉框
	 * @param request   HttpServletRequest
	 * @param response  HttpServletResponse
	 * @return   拼装下拉列表
	 */
	@RequestMapping(value = "/getEventByEventId.do", method = RequestMethod.GET)
	public void getEventByEventId(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String eventId = request.getParameter("eventId");
			TEvent event = eventService.getEventByEventId(eventId);	
			String strEvnet = event.getApp_code() +","+event.getEvent_id()+","+event.getEvent_name()+","+event.getEvent_desc()+","+event.getOp_type()+","+event.getScore();
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(strEvnet.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
