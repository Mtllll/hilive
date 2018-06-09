package com.hilive.domain;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2018/4/8.
 */
public class Articleinfo {
    private int id;
    private String title;
    private String content;
    private int user_id;
    private Timestamp createtime;
    private int follow_count;
    private int praise_count;
    private int share_count;
    private String topic_html_content;
    private String topic_markdown_content;

    public String getTopic_html_content() {
        return topic_html_content;
    }

    public void setTopic_html_content(String topic_html_content) {
        this.topic_html_content = topic_html_content;
    }

    public String getTopic_markdown_content() {
        return topic_markdown_content;
    }

    public void setTopic_markdown_content(String topic_markdown_content) {
        this.topic_markdown_content = topic_markdown_content;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public int getFollow_count() {
        return follow_count;
    }

    public void setFollow_count(int follow_count) {
        this.follow_count = follow_count;
    }

    public int getPraise_count() {
        return praise_count;
    }

    public void setPraise_count(int praise_count) {
        this.praise_count = praise_count;
    }

    public int getShare_count() {
        return share_count;
    }

    public void setShare_count(int share_count) {
        this.share_count = share_count;
    }
}
