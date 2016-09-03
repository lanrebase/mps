package com.kuyun.mps.member.service;

import java.util.Map;

import com.kuyun.mps.common.bean.Page;

public interface IMemberService {

	public void saveTMember(Map<String, String> parmasMap) throws Exception;

	public void revokeTMember(Map<String, String> parmasMap) throws Exception;

	public Page selectMemberList(Map<String, Object> params) throws Exception;

	public int selectMemberCount(Map<String, Object> params) throws Exception;

}
