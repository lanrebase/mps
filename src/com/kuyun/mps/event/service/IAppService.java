package com.kuyun.mps.event.service;

import java.util.List;

import com.kuyun.mps.event.model.TApp;

/**
 * 应用操作的Service
 * @author liangbz
 * 2016-8-30
 */
public interface IAppService {

	/**
	 * 查询所有App的列表
	 * @return  List<TApp>
	 */
	List<TApp>  queryAppList();
}
