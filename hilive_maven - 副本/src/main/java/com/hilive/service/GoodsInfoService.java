package com.hilive.service;

import com.hilive.domain.GoodsInfo;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by ttc on 18-4-8.
 */

public interface GoodsInfoService {
    public int addGoodsInfo(GoodsInfo goodsInfo);
    public ModelAndView showGoodsInfo();
    public ModelAndView showGoodsInfoById(int id);
}
