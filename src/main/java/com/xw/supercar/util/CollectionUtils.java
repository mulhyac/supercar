package com.xw.supercar.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 集合工具类
 * @author wangsz 2017-07-06
 */
public class CollectionUtils  {

	/**
	 * 提取集合中的对象的属性(通过Getter函数), 组合成Map.
	 * 
	 * @param collection 来源集合.
	 * @param keyPropertyName 要提取为Map中的Key值的属性名.
	 * @param valuePropertyName 要提取为Map中的Value值的属性名.
	 */
	public static Map<?, ?> extractToMap(Collection<?> collection, String keyPropertyName, String valuePropertyName) {
		Map<?, ?> map = new HashMap<>();
		try {
			for (Object obj : collection) {
				map.put(ReflectUtil.getPropertyValue(obj, keyPropertyName),
						ReflectUtil.getPropertyValue(obj, valuePropertyName));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 提取集合中的对象的属性(通过Getter函数), 组合成List.
	 * 
	 * @param collection
	 *            来源集合.
	 * @param propertyName
	 *            要提取的属性名.
	 * 
	 * @return List
	 */
	public static <T> List<T> extractToList(Collection<?> collection, String propertyName) {
		return extractToList(collection, propertyName, false);
	}

	/**
	 * 提取集合中的对象的属性(通过Getter函数), 组合成List.
	 * 
	 * @param collection
	 *            来源集合.
	 * @param propertyName
	 *            要提取的属性名.
	 * @param ignoreEmptyValue
	 *            是否过滤null值和""值
	 * 
	 * @return List
	 */
	public static <T> List<T> extractToList(Collection<?> collection, String propertyName, boolean ignoreEmptyValue) {
		if (collection == null) {
			return null;
		}
		List<T> list = new ArrayList<>();

		try {
			for (Object obj : collection) {
				@SuppressWarnings("unchecked")
				T value = (T) ReflectUtil.getPropertyValue(obj, propertyName);
				if (ignoreEmptyValue && value == null || value.toString().equals("")) {
					continue;
				}
				list.add(ReflectUtil.getPropertyValue(obj, propertyName));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * 提取集合中的对象的属性(通过Getter函数), 组合成由分割符分隔的字符串.
	 * 
	 * @param collection 来源集合.
	 * @param propertyName 要提取的属性名.
	 * @param separator 分隔符.
	 */
	public static String extractToString(Collection<?> collection, String propertyName, String separator) {
		List<?> list = extractToList(collection, propertyName);
		
		StringBuilder rs = new StringBuilder();
		for (Object object : list) {
			rs.append(object+",");
		}
		
		if(rs.length() > 0 )
			return rs.substring(0, rs.length()-1);
		return rs.toString();
	}

}
