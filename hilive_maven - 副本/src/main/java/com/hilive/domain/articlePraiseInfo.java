package com.hilive.domain;

/**
 * Created by Administrator on 2018/4/11.
 */
public class articlePraiseInfo {
    private int id;
    private int user_id;
    private int isPraiseType;
    private int article_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getIsPraiseType() {
        return isPraiseType;
    }

    public void setIsPraiseType(int isPraiseType) {
        this.isPraiseType = isPraiseType;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }
}
