package com.kuyun.mps.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import com.kuyun.mps.common.bean.Page;
import com.kuyun.mps.common.constant.GlobalConstants;
import com.kuyun.mps.common.web.RestfulResponse;
import com.kuyun.mps.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	final Logger logger = Logger.getLogger(MemberController.class);

	public static final String CHARSET_UTF8 = "UTF-8";

	private final Gson gson = new Gson();

	@Autowired
	private IMemberService memberService;

	@RequestMapping("memberPage")
	public String memberPage(Model model) {
		model.addAttribute("pageCount", 0);
		return "/member/memberPage";
	}

	@RequestMapping("queryMember")
	public String queryMember(HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String pageNo = request.getParameter("pageNo");
		String appCode = request.getParameter("appCode");
		String memberName = request.getParameter("memberName");
		if (StringUtils.isEmpty(pageNo)) {
			pageNo = "1";
		}
		map.put("pageNo", pageNo);
		map.put("pageSize", GlobalConstants.DEFAULT_PAGE_SIZE);
		map.put("memberName", memberName);
		map.put("appCode", appCode);
		Page page = memberService.selectMemberList(map);
		model.addAttribute("page", page);
		model.addAttribute("pageCount", page.getCount());
		return "/member/memberPage";
	}

	@ResponseBody
	@RequestMapping("create_member")
	public RestfulResponse createMember(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String params = IOUtils.toString(request.getInputStream(),
					CHARSET_UTF8);
			System.out.println("=============" + params);
			if (StringUtils.isBlank(params)) {
				return response("999", "参数为空！");
			}
			Map<String, String> parmasMap = parseParams(params);
			String msg = validCreate(parmasMap);
			if (StringUtils.isNotEmpty(msg)) {
				return response("999", msg);
			}
			memberService.saveTMember(parmasMap);
		} catch (Exception e) {
			logger.error("", e);
			return response("999", "系统错误！");
		}
		return response("200", "操作成功！");
	}

	@ResponseBody
	@RequestMapping("revoke_member")
	public RestfulResponse revokeMember(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String params = IOUtils.toString(request.getInputStream(),
					CHARSET_UTF8);
			System.out.println("=============" + params);
			if (StringUtils.isBlank(params)) {
				return response("999", "参数为空！");
			}
			Map<String, String> parmasMap = parseParams(params);
			String msg = validRevoke(parmasMap);
			if (StringUtils.isNotEmpty(msg)) {
				return response("999", msg);
			}
			memberService.revokeTMember(parmasMap);
		} catch (Exception e) {
			logger.error("", e);
			return response("999", "系统错误！");
		}
		return response("200", "操作成功！");
	}

	private String validCreate(Map<String, String> parmasMap) {
		String appCode = parmasMap.get("appCode");
		String memberId = parmasMap.get("memberId");
		String memberName = parmasMap.get("memberName");
		if (StringUtils.isBlank(appCode)) {
			return "应用代码[appCode]为空！";
		}
		if (appCode.length() != 4) {
			return "应用代码[appCode]格式错误！";
		}
		if (StringUtils.isBlank(memberId)) {
			return "会员编号[memberId]为空！";
		}
		if (memberId.length() != 13) {
			return "会员编号[memberId]格式错误！";
		}
		if (StringUtils.isBlank(memberName)) {
			return "会员名称[memberName]为空！";
		}
		return "";
	}

	private String validRevoke(Map<String, String> parmasMap) {
		String appCode = parmasMap.get("appCode");
		String memberId = parmasMap.get("memberId");
		if (StringUtils.isBlank(appCode)) {
			return "应用代码[appCode]为空！";
		}
		if (appCode.length() != 4) {
			return "应用代码[appCode]格式错误！";
		}
		if (StringUtils.isBlank(memberId)) {
			return "会员编号[memberId]为空！";
		}
		if (memberId.length() != 13) {
			return "会员编号[memberId]格式错误！";
		}
		return "";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private Map<String, String> parseParams(String params) {
		Map<String, String> map = new HashMap<String, String>();
		Map<String, Object> parmasMap = gson.fromJson(params, Map.class);
		Map<String, String> dataMap = (LinkedTreeMap) parmasMap.get("data");
		if (dataMap == null || dataMap.isEmpty()) {
			return map;
		}
		String appCode = dataMap.get("appCode");
		String memberId = dataMap.get("memberId");
		String memberName = dataMap.get("memberName");
		if (StringUtils.isNotBlank(appCode)) {
			map.put("appCode", appCode);
		}
		if (StringUtils.isNotBlank(memberId)) {
			map.put("memberId", memberId);
		}
		if (StringUtils.isNotBlank(memberName)) {
			map.put("memberName", memberName);
		}
		return map;
	}

	private RestfulResponse response(String code, String msg) {
		RestfulResponse rep = new RestfulResponse();
		rep.setCode(code);
		rep.setMsg(msg);
		return rep;
	}
}
