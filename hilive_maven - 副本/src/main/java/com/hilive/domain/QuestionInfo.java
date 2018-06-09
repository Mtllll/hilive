package com.hilive.domain;

import java.sql.Timestamp;

/**
 * Created by ttc on 18-4-8.
 */
public class QuestionInfo {
    private Integer id;
    private Integer user_id;
    private String title;
    private String topic_markdown_content;
    private String topic_html_content;
    private String classification;
    private Timestamp createtime;
    private Integer browse_count;
    private Integer answer_count;
    private Integer share_count;

    public String getTopic_html_content() {
        return topic_html_content;
    }

    public void setTopic_html_content(String topic_html_content) {
        this.topic_html_content = topic_html_content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTopic_markdown_content() {
        return topic_markdown_content;
    }

    public void setTopic_markdown_content(String topic_markdown_content) {
        this.topic_markdown_content = topic_markdown_content;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Integer getBrowse_count() {
        return browse_count;
    }

    public void setBrowse_count(Integer browse_count) {
        this.browse_count = browse_count;
    }

    public Integer getAnswer_count() {
        return answer_count;
    }

    public void setAnswer_count(Integer answer_count) {
        this.answer_count = answer_count;
    }

    public Integer getShare_count() {
        return share_count;
    }

    public void setShare_count(Integer share_count) {
        this.share_count = share_count;
    }
}
