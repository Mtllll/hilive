package com.hilive.mapper;

import com.hilive.domain.Userinfo;

/**
 * Created by ttc on 18-4-8.
 */
public interface UserMapper {
    public int addUser(Userinfo userinfo);
    public Userinfo nameIsExist(String username);
    public int updateUser(Userinfo userinfo);
    public Userinfo selectUser(int id);
    public Userinfo FindUserByNameAndPkey(Userinfo userinfo);
    //增加发表文章数
    public int addArticle(int id);
    //增加文章转发数
    public int addCollect(int id);
    //添加发表帖子数
    public int addPost(int id);
    //添加关注数
    public int addFollow(int id);
    //添加粉丝数
    public int addFans(int id);
    //减少关注数
    public int deleteFollow(int id);
    //减少粉丝数
    public int deleteFans(int id);

}
