package com.hilive.service;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Mtl on 2018/5/7.
 */

public interface articleService {
    //下拉刷新
    public List<Map<String,Object>> getMoreArticle(int current_id);
}
