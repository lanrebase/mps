package com.kuyun.mps.event.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kuyun.mps.event.mapper.TAppMapper;
import com.kuyun.mps.event.model.TApp;
import com.kuyun.mps.event.service.IAppService;
/**
 * 应用操作的Service
 * @author liangbz
 * 2016-8-30
 */
 @Service("appService")
 @Transactional
public class AppService implements IAppService {

	/**
	 * 事件操作的Dao
	 */
	@Autowired
	private TAppMapper appDao;
	/**
	 * 查询所有App的列表
	 * @return  List<TApp>
	 */
	@Override
	public List<TApp> queryAppList() {
		return appDao.queryTAppList();
	}

}
