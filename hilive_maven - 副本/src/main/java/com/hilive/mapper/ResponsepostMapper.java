package com.hilive.mapper;

import com.hilive.domain.Responsepostinfo;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-8.
 */
public interface ResponsepostMapper {
    public int addResponse(Responsepostinfo responsepostinfo);
    public List<Map<String,Object>> getAllResponsesById(int pid);
    public int deleteComment(int cid);
}
