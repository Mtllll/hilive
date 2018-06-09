package com.hilive.service;

import com.hilive.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Mtl on 2018/5/7.
 */
@Service
public class articleServiceImp implements articleService {
    @Autowired
    ArticleMapper articleMapper;
    @Override
    public List<Map<String, Object>> getMoreArticle(int current_id) {
        return articleMapper.getMoreArticle(current_id);
    }
}
