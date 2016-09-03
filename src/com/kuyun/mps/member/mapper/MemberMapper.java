package com.kuyun.mps.member.mapper;

import java.util.List;
import java.util.Map;

import com.kuyun.mps.member.model.TMember;

public interface MemberMapper {

	public void saveTMember(TMember tMember) throws Exception;

	public TMember selectMember(TMember tMember) throws Exception;

	public void revokeMember(String memberId) throws Exception;

	public List<TMember> selectMemberList(Map<String, Object> params)
			throws Exception;

	public int selectMemberCount(Map<String, Object> params) throws Exception;

}
