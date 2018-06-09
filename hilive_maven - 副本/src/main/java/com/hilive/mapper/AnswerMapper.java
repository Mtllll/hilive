package com.hilive.mapper;

import com.hilive.domain.AnswerInfo;

import javax.xml.crypto.Data;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-8.
 */
public interface AnswerMapper {
    public int addAnswer(AnswerInfo answerInfo);
    public List<Map<String,Object>> getAnswersByQuestionId(int id);
    public Map<String,Object> getAnswersByAnswerId(int id);
    public int getAnswersIdByCreatetime(Timestamp createtime);
    public int addagree_count(int id);
    public int cutagree_count(int id);
    public int getAnsweragree_countByAnswerId(int id);
}
