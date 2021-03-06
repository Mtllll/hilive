package com.hilive.mapper;

import com.hilive.domain.Articleinfo;
import com.hilive.domain.Userinfo;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/8.
 */
public interface ArticleMapper {
    //按照userid查找个人写的文章
    public List<Map<String,Object>> selectById(int id);
    //添加文章
    public int addArticle(Articleinfo articleinfo);
    //查看文章详情
    public Map<String,Object> view_article(int id);
    //查找所有文章
    public List<Map<String,Object>> allArticle();
    //增加赞的次数
    public void add_praise(int a);
    //减少赞的次数
    public void reducePraise(int a);
    //更新文章转发的次数
    public int add_transmit(int id);
    //更新文章评论的次数
    public int add_comment(int id);
    //ajax查找个人收藏的文章
    public List<Map<String,Object>> ajax_collection_article(int id);
    //下拉自动加载
    public List<Map<String,Object>> getMoreArticle(int currentId);


}
