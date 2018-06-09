package com.hilive.mapper;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-9.
 */
public interface SearchMapper {
    public List<Map<String, Object>> getsearchinfo(String s);
    public List<Map<String,Object>> getAllPost1();
    public List<Map<String,Object>> allArticle();
    public List<Map<String,Object>>getPostById(int id);


}