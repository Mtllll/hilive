package com.hilive.mapper;

import com.hilive.domain.RelationInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-25.
 */
public interface RelationMapper {
    public int addFollowRelation(RelationInfo relationInfo);
    public int addFansRelation(RelationInfo relationInfo);
    public int deleteFollowRelation(RelationInfo relationInfo);
    public int deleteFansRelation(RelationInfo relationInfo);
    public List<Map<String,Object>> selectRelation(RelationInfo relationInfo);
    public List<Map<String,Object>> selectFollowUsersById(int id);
    public List<Map<String,Object>> selectFansUsersById(int id);
}
