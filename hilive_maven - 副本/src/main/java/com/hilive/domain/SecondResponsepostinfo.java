package com.hilive.domain;

import java.sql.Timestamp;

/**
 * Created by ttc on 18-4-19.
 */
public class SecondResponsepostinfo{
    private int id;
    private int responsepost_id;
    private String responsepost_username;
    private int second_responsepost_userid;
    private String second_responsepost_username;
    private String second_responsepost_content;
    private Timestamp second_responsepost_createtime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResponsepost_id() {
        return responsepost_id;
    }

    public void setResponsepost_id(int responsepost_id) {
        this.responsepost_id = responsepost_id;
    }

    public String getResponsepost_username() {
        return responsepost_username;
    }

    public void setResponsepost_username(String responsepost_username) {
        this.responsepost_username = responsepost_username;
    }

    public int getSecond_responsepost_userid() {
        return second_responsepost_userid;
    }

    public void setSecond_responsepost_userid(int second_responsepost_userid) {
        this.second_responsepost_userid = second_responsepost_userid;
    }

    public String getSecond_responsepost_username() {
        return second_responsepost_username;
    }

    public void setSecond_responsepost_username(String second_responsepost_username) {
        this.second_responsepost_username = second_responsepost_username;
    }

    public String getSecond_responsepost_content() {
        return second_responsepost_content;
    }

    public void setSecond_responsepost_content(String second_responsepost_content) {
        this.second_responsepost_content = second_responsepost_content;
    }

    public Timestamp getSecond_responsepost_createtime() {
        return second_responsepost_createtime;
    }

    public void setSecond_responsepost_createtime(Timestamp second_responsepost_createtime) {
        this.second_responsepost_createtime = second_responsepost_createtime;
    }
}
