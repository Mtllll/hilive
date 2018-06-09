package com.hilive.mapper;

import com.hilive.domain.Foruminfo;
import com.hilive.domain.Lastresponsepostinfo;
import com.hilive.domain.PageInfo;
import com.hilive.domain.Userinfo;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-8.
 */
public interface ForumMapper {
    public int addPost(Foruminfo foruminfo);
    public int deletePost(int pid);
    public List<Map<String,Object>> getAllPost();
    public Map<String,Object> getPostById(int pid);
    public int addViewCount(int pid);
    public int addResponseCount(int pid);
    public int minusResponseCount(int pid);
    public int changeLastUser(Lastresponsepostinfo lastresponsepostinfo);
    public List<Foruminfo> getPostsByUserID(int userid);

    public int getTotalRecords();
    public List<Map<String,Object>> getPagedPosts(PageInfo pageInfo);
}
