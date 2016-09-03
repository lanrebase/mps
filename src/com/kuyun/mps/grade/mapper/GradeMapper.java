package com.kuyun.mps.grade.mapper;

import java.util.List;

import com.kuyun.mps.grade.model.TGrade;

public interface GradeMapper {

	public void saveTGrade(TGrade tGrade) throws Exception;
	
	public List<TGrade> selectGradeList() throws Exception;
	
	public int selectGradeByName(TGrade tGrade) throws Exception;
	
	public int selectGradeByLevel(TGrade tGrade) throws Exception;
	
	public TGrade selectTGrade(String gradeId) throws Exception;
	
	public void updateTGrade(TGrade tGrade) throws Exception;

	public void deleteTGrade(String gradeId) throws Exception;
}
