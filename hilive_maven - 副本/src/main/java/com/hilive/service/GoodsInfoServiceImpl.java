package com.hilive.service;

import com.hilive.domain.GoodsInfo;
import com.hilive.mapper.GoodsCommentMapper;
import com.hilive.mapper.GoodsInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by ttc on 18-4-8.
 */
@Service
public class GoodsInfoServiceImpl implements GoodsInfoService {
    @Autowired
    GoodsInfoMapper goodsInfoMapper;
    @Autowired
    GoodsCommentMapper goodsCommentMapper;
    @Override
    public int addGoodsInfo(GoodsInfo goodsInfo) {
        int result =goodsInfoMapper.addGoodsInfo(goodsInfo);
        return  result;
    }

    @Override
    public ModelAndView showGoodsInfo() {
        List<Map<String,Object>> goodsInfo = goodsInfoMapper.showGoodsInfo();
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("goodsInfo",goodsInfo);
        modelAndView.setViewName("viewGoods");
        return modelAndView;
    }

    @Override
    public ModelAndView showGoodsInfoById(int id) {
        GoodsInfo goodsInfo=goodsInfoMapper.showGoodsInfoById(id);
        ModelAndView modelAndView= new ModelAndView();
        List<Map<String,Object>> commentById =goodsCommentMapper.showGoodsCommentById(id);
        modelAndView.addObject("commentinfo",commentById);
        modelAndView.addObject("goodsInfo",goodsInfo);
        modelAndView.setViewName("viewGoodsComment");
        return modelAndView;
    }
}
