package com.kuyun.mps.event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kuyun.mps.event.model.TApp;
import com.kuyun.mps.event.service.IAppService;

/**
 * 事件定义的Controller
 * 
 * @author liangbz 2016-8-27
 */
@Controller
@RequestMapping("/app")
public class AppController {

	/**
	 * 应用的service
	 */
	@Autowired
	private IAppService appService;
	
	
	/**
	 * 查询应用列表，拼装为下拉框
	 * @param request   HttpServletRequest
	 * @param response  HttpServletResponse
	 * @return   拼装下拉列表
	 */
	@RequestMapping(value = "/getAppListString.do", method = RequestMethod.GET)
	public void getAppListString(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			List<TApp> appList = appService.queryAppList();		
			StringBuffer strSelect = new StringBuffer();
			if (null != appList && !appList.isEmpty()) {
				for (int i = 0; i < appList.size(); i++) {
					TApp app = appList.get(i);
					strSelect.append("<option  value='"+ app.getApp_code() + "'>"+ app.getApp_name() + "<option>");
				}
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(strSelect.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
