package com.hilive.mapper;

import com.hilive.domain.Answer_praiseinfo;

import java.util.Map;

/**
 * Created by ttc on 18-4-16.
 */
public interface Answer_praiseinfoMapper {
   public Answer_praiseinfo getAllByAidAndUid(Answer_praiseinfo answer_praiseinfo);
    public int deleteinfo(int id);
    public int insterinfo(Answer_praiseinfo answer_praiseinfo);
}
