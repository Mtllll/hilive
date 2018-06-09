package com.hilive.mapper;

import com.hilive.domain.GoodsComment;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-8.
 */
public interface GoodsCommentMapper {
    public int addGoodsComment(GoodsComment goodsComment);
    public List<Map<String,Object>> showGoodsCommentById(int id);
}
