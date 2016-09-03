package com.kuyun.mps.common.constant;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class ConfigConstants {
	
	/** 单体实例 */
	private static ConfigConstants instance;

	/** 配置属性 */
	private Map<String, String> configMap;

	/**
	 * 私有构造器
	 */
	private ConfigConstants() {
	}

	/**
	 * @return 返回 instance。
	 */
	public static ConfigConstants getInstance() {
		if (instance == null) {
			instance = new ConfigConstants();
		}
		return instance;
	}

	/**
	 * 获取配置属性
	 * 
	 * @param key
	 * @return
	 */
	public String get(String key) {
		return configMap.get(key);
	}

	/**
	 * 初始化配置属性
	 */
	public void init() throws Exception {
		InputStream is = null;
		Properties props = new Properties();
		configMap = new HashMap<String, String>();
		try {
			is = ConfigConstants.class
					.getResourceAsStream("/config.properties");
			props.load(is);
			Enumeration<?> propKeys = props.propertyNames();
			while (propKeys.hasMoreElements()) {
				String propName = (String) propKeys.nextElement();
				String propValue = props.getProperty(propName);
				configMap.put(propName, propValue);
			}
		} finally {
			if (is != null) {
				is.close();
			}
		}
	}
}
