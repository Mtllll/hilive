package com.hilive.mapper;

import com.hilive.domain.articlePraiseInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/4/11.
 */
public interface ArticlePraiseInfoMapper {
    public int addArticlePraiseInfo(articlePraiseInfo articlePraiseInfo);
    public articlePraiseInfo selectType(articlePraiseInfo a);
    public int changeIsPraiseType(articlePraiseInfo a);
    public int deleteArticlePraiseInfo(articlePraiseInfo a);

//    查询当前用户点赞的所有文章id
    public List<Integer> currentuserPraise(int id);
}
