package com.kuyun.mps.member.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kuyun.mps.common.bean.Page;
import com.kuyun.mps.common.constant.GlobalConstants;
import com.kuyun.mps.common.util.CryptTools;
import com.kuyun.mps.member.mapper.MemberMapper;
import com.kuyun.mps.member.model.TMember;
import com.kuyun.mps.member.service.IMemberService;

@Service("memberService")
@Transactional
public class MemberService implements IMemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void saveTMember(Map<String, String> parmasMap) throws Exception {
		TMember tMember = buildTMember(parmasMap);
		memberMapper.saveTMember(tMember);
	}

	@Override
	public void revokeTMember(Map<String, String> parmasMap) throws Exception {
		String memberId = parmasMap.get("memberId");
		memberMapper.revokeMember(memberId);
	}

	private TMember buildTMember(Map<String, String> parmasMap)
			throws Exception {
		TMember tMember = new TMember();
		String appCode = parmasMap.get("appCode");
		String memberId = parmasMap.get("memberId");
		String memberName = parmasMap.get("memberName");
		// 应用系统代码
		tMember.setAppCode(appCode);
		// 会员编号
		tMember.setMemberId(memberId);
		// 会员名称
		tMember.setMemberName(memberName);
		// 设置默认密码12345（加密）
		tMember.setMemberPassword(CryptTools
				.md5Digest(GlobalConstants.DEFAULT_PASSWORD));
		// 设置会员默认等级为1
		tMember.setMemberLevel(1);
		// 设置会员默认为非超级管理员
		tMember.setIsAdmin("0");
		// 设置会员默认积分为0
		tMember.setScore(0);
		// 创建日期
		tMember.setCreated(new Date());
		// 是否已销户
		tMember.setIsDel("0");
		return tMember;
	}

	@Override
	public Page selectMemberList(Map<String, Object> params) throws Exception {
		int count = selectMemberCount(params);
		int pageNo = Integer.parseInt((String) params.get("pageNo"));
		int pageSize = (int) params.get("pageSize");
		int startNo = 0;
		int endNo = 0;
		startNo = (pageNo - 1) * pageSize;
		endNo = pageNo * pageSize;
		params.put("startNo", startNo);
		params.put("endNo", endNo);
		return new Page(memberMapper.selectMemberList(params), count, pageNo,
				pageSize);
	}

	@Override
	public int selectMemberCount(Map<String, Object> params) throws Exception {
		return memberMapper.selectMemberCount(params);
	}

}
