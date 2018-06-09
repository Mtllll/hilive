package com.hilive.domain;

import java.sql.Timestamp;

/**
 * Created by ttc on 18-4-8.
 */
public class Foruminfo {
    private Integer id ;
    private String title;

    private Integer authorid;
    private Timestamp publishtime;
    private  Integer  lastresponseid;
    private Timestamp lastresponsetime;
    private  Integer  viewcount;
    private  Integer responsecount;
    private  String posttype;
    private String topic_markdown_content;
    private String topic_html_content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public Integer getAuthorid() {
        return authorid;
    }

    public void setAuthorid(Integer authorid) {
        this.authorid = authorid;
    }

    public Timestamp getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Timestamp publishtime) {
        this.publishtime = publishtime;
    }

    public Integer getLastresponseid() {
        return lastresponseid;
    }

    public void setLastresponseid(Integer lastresponseid) {
        this.lastresponseid = lastresponseid;
    }

    public Timestamp getLastresponsetime() {
        return lastresponsetime;
    }

    public void setLastresponsetime(Timestamp lastresponsetime) {
        this.lastresponsetime = lastresponsetime;
    }

    public Integer getViewcount() {
        return viewcount;
    }

    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    public Integer getResponsecount() {
        return responsecount;
    }

    public void setResponsecount(Integer responsecount) {
        this.responsecount = responsecount;
    }

    public String getPosttype() {
        return posttype;
    }

    public void setPosttype(String posttype) {
        this.posttype = posttype;
    }

    public String getTopic_markdown_content() {
        return topic_markdown_content;
    }

    public void setTopic_markdown_content(String topic_markdown_content) {
        this.topic_markdown_content = topic_markdown_content;
    }

    public String getTopic_html_content() {
        return topic_html_content;
    }

    public void setTopic_html_content(String topic_html_content) {
        this.topic_html_content = topic_html_content;
    }
}
