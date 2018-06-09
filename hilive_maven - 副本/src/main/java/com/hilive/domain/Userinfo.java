package com.hilive.domain;

import java.sql.Timestamp;

/**
 * Created by ttc on 18-4-8.
 */
public class Userinfo {
    private String introduce;
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private String sex;
    private String avatar;
    private String phonenumber;
    private String security_question;
    private String security_answer;
    private Integer pageview_count;
    private Timestamp createtime;
    private Integer online_time;
    private Integer post_count;
    private Integer answer_count;
    private Integer article_count;
    private Integer fans_count;
    private  Integer collection_count;
    private  Integer attention_count;
    private Integer follow_count;

    public Integer getArticle_count() {
        return article_count;
    }

    public void setArticle_count(Integer article_count) {
        this.article_count = article_count;
    }

    public Integer getFans_count() {
        return fans_count;
    }

    public void setFans_count(Integer fans_count) {
        this.fans_count = fans_count;
    }

    public Integer getCollection_count() {
        return collection_count;
    }

    public void setCollection_count(Integer collection_count) {
        this.collection_count = collection_count;
    }

    public Integer getAttention_count() {
        return attention_count;
    }

    public void setAttention_count(Integer attention_count) {
        this.attention_count = attention_count;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getSecurity_question() {
        return security_question;
    }

    public void setSecurity_question(String security_question) {
        this.security_question = security_question;
    }

    public String getSecurity_answer() {
        return security_answer;
    }

    public void setSecurity_answer(String security_answer) {
        this.security_answer = security_answer;
    }

    public Integer getPageview_count() {
        return pageview_count;
    }

    public void setPageview_count(Integer pageview_count) {
        this.pageview_count = pageview_count;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Integer getOnline_time() {
        return online_time;
    }

    public void setOnline_time(Integer online_time) {
        this.online_time = online_time;
    }

    public Integer getPost_count() {
        return post_count;
    }

    public void setPost_count(Integer post_count) {
        this.post_count = post_count;
    }

    public Integer getAnswer_count() {
        return answer_count;
    }

    public void setAnswer_count(Integer answer_count) {
        this.answer_count = answer_count;
    }

    public Integer getFollow_count() {
        return follow_count;
    }

    public void setFollow_count(Integer follow_count) {
        this.follow_count = follow_count;
    }
}
