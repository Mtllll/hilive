package com.hilive.mapper;

import com.hilive.domain.SecondResponsepostinfo;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-19.
 */
public interface SecondResponsepostMapper {
    public int addSecondResponsepost(SecondResponsepostinfo secondResponsepostinfo);
    public List<Map<String,Object>> getAllSecondResponsepostById(int cid);
    public List<List<Map<String,Object>>> getAllSecondResponsepost();
    public int getMaxId();
    public int getCount();
}
