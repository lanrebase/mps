package com.kuyun.mps.event.mapper;

import java.util.List;

import com.kuyun.mps.event.model.TApp;

/**
 * 应用操作的Dao
 * @author 1
 *
 */
public interface TAppMapper {

	/**
	 * 查询应用列表的List
	 * @return   List<TApp>
	 */
	public  List<TApp>  queryTAppList();
}
