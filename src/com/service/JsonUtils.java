package com.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONObject;

public class JsonUtils {
	   /**
     * 序列化成json
     * */
    public static String toJson(Object obj) {
        // 对象映射器
        ObjectMapper mapper = new ObjectMapper();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd HH:mm:ss");
        mapper.setDateFormat(sdf);
        
        String result = null;
        // 序列化user对象为json字符串
        try {
            result = mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static <T> T toObject(String json,Class<T> valueType) {
        //对象映射器
        ObjectMapper mapper=new ObjectMapper();
        T result=null;
        try {
            result=mapper.readValue(json,valueType);

        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
    public static HashMap<String, String> changeToMap(JSONObject record, String name) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		try {
			@SuppressWarnings("rawtypes")
			Iterator it = record.keys(); // 迭代器
			// 遍历jsonObject数据，添加到Map对象
			while (it.hasNext()) {
				String key = String.valueOf(it.next()).toString();
				String value = (String) record.get(key).toString();
				map.put(key, value);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}
    
  

}
