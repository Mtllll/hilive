package com.hilive.mapper;

import com.hilive.domain.QuestionInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-8.
 */
public interface QuestionMapper {
    public int addQuestion(QuestionInfo questionInfo);
    public List<Map<String,Object>> getAllQuestions();
    public Map<String,Object> getQuestionById(int aid);
    public Map<String,Object>  getQuestionByTitle(String title);
    public int isQuestionByTitle(String title);
    public void updateQuestionAnswer_countByQuestionId(int qid);
    public List<Map<String,Object>> getQuestionsByTitleOrTopic_html_content(QuestionInfo questionInfo);
    public int addbrowse_count(int qid);

}
