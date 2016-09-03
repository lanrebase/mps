package com.kuyun.mps.grade.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kuyun.mps.grade.mapper.GradeMapper;
import com.kuyun.mps.grade.model.TGrade;
import com.kuyun.mps.grade.service.IGradeService;

@Service("gradeService")
@Transactional
public class GradeService implements IGradeService {

	@Autowired
	private GradeMapper gradeMapper;

	public void saveTGrade(TGrade tGrade) throws Exception {
		setDefualt(tGrade);
		gradeMapper.saveTGrade(tGrade);
	}

	public List<TGrade> selectGradeList() throws Exception {
		return gradeMapper.selectGradeList();
	}

	@Override
	public int selectGradeByLevel(TGrade tGrade) throws Exception {
		return gradeMapper.selectGradeByLevel(tGrade);
	}

	@Override
	public int selectGradeByName(TGrade tGrade) throws Exception {
		return gradeMapper.selectGradeByName(tGrade);
	}

	private void setDefualt(TGrade tGrade) {
		tGrade.setCreated(new Date());
		tGrade.setState("1");
	}

	@Override
	public TGrade selectTGrade(String gradeId) throws Exception {
		return gradeMapper.selectTGrade(gradeId);
	}

	@Override
	public void updateTGrade(TGrade tGrade) throws Exception {
		gradeMapper.updateTGrade(tGrade);
	}

	@Override
	public void deleteTGrade(String gradeId) throws Exception {
		gradeMapper.deleteTGrade(gradeId);
	}
}
