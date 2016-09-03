package com.kuyun.mps.grade.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kuyun.mps.common.interceptor.Token;
import com.kuyun.mps.common.web.RestfulResponse;
import com.kuyun.mps.grade.model.TGrade;
import com.kuyun.mps.grade.service.IGradeService;

@Controller
@RequestMapping("/grade")
public class GradeController {

	@Autowired
	private IGradeService gradeService;

	@RequestMapping("gradePage")
	@Token(save = true)
	public String queryGrade(Model model) throws Exception {
		List<TGrade> gradeList = gradeService.selectGradeList();
		model.addAttribute("gradeList", gradeList);
		return "/grade/gradePage";
	}

	@RequestMapping("saveGrade")
	@Token(remove = true)
	public String saveGrade(HttpServletRequest request,TGrade tGrade, Model model) throws Exception {
		if (tGrade.getGradeId() == null) {
			gradeService.saveTGrade(tGrade);
		} else {
			gradeService.updateTGrade(tGrade);
		}
		return queryGrade(model);
	}

	@ResponseBody
	@RequestMapping("valid")
	public Object validGrade(String gradeName, String gradeLevel) {
		RestfulResponse rep = new RestfulResponse();
		try {
			TGrade tGrade = new TGrade();
			tGrade.setGradeName(gradeName);
			tGrade.setGradeLevel(Integer.valueOf(gradeLevel));
			int existLevel = gradeService.selectGradeByLevel(tGrade);
			if (existLevel > 0) {
				rep.setCode("999");
				rep.setMsg("不能添加级别相同的等级！");
				return rep;
			}
			int existName = gradeService.selectGradeByName(tGrade);
			if (existName > 0) {
				rep.setCode("999");
				rep.setMsg("[" + gradeName + "]已存在，请不要重复添加！");
				return rep;
			}
		} catch (Exception e) {
			e.printStackTrace();
			rep.setCode("999");
			rep.setMsg("系统错误！");
			return rep;
		}
		rep.setCode("200");
		return rep;
	}

	@ResponseBody
	@RequestMapping("editGrade")
	public Object editGrade(String gradeId) throws Exception {
		return gradeService.selectTGrade(gradeId);
	}

	@RequestMapping("deleteGrade")
	public String deleteGrade(String gradeId, Model model) throws Exception {
		gradeService.deleteTGrade(gradeId);
		return queryGrade(model);
	}

}
