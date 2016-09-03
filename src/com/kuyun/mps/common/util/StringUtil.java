package com.kuyun.mps.common.util;

import java.util.Random;

public class StringUtil {

	public static String getRandom(int length) {
		StringBuffer sb = new StringBuffer();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			sb.append(String.valueOf(random.nextInt(10)));
		}
		return sb.toString();
	}

}
