package com.kuyun.mps.common.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import com.kuyun.mps.common.constant.ConfigConstants;

@WebServlet("/InitServlet")
public class InitServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Logger logger = Logger.getLogger(InitServlet.class);

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			// 初始化配置信息并读入内存
			ConfigConstants.getInstance().init();
			logger.info("读取配置文件完成...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
