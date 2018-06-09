package com.hilive.mapper;

import com.hilive.domain.Question_browsecount;

/**
 * Created by ttc on 18-4-19.
 */
public interface Question_browsecountMapper {
    public int addbrowseinfo(Question_browsecount question_browsecount);
    public Question_browsecount getBrowseByQidAndUid(Question_browsecount question_browsecount);
}
