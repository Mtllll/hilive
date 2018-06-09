package com.hilive.controller;

import com.hilive.domain.GoodsInfo;
import com.hilive.service.GoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by ttc on 18-4-8.
 */
@Controller
public class GoodsController {
    @Autowired
    GoodsInfoService goodsInfoService;
    @RequestMapping("viewGoods")
    public ModelAndView viewGoods(){
        ModelAndView modelAndView =goodsInfoService.showGoodsInfo();
        return modelAndView;
    }
    @RequestMapping("outdoorGoods")
    public String outdoorGoods(){
        return "publicOutdoorGoods";
    }
    @RequestMapping("add_Goods")
    public String addGoodsInfo(@RequestParam MultipartFile picture2, GoodsInfo goodsInfo, HttpServletRequest request) throws IOException {
        String path = request.getServletContext().getRealPath("/upload/");
        File folder = new File(path);
        if (!folder.exists()){
            folder.mkdirs();
        }
        String strUUid = UUID.randomUUID().toString();
        String strFinalpath = path+"/"+strUUid+picture2.getOriginalFilename();
        File file =new File(strFinalpath);
        picture2.transferTo(file);
        goodsInfo.setPicture(strUUid+picture2.getOriginalFilename());
        goodsInfoService.addGoodsInfo(goodsInfo);
        return "redirect:viewGoods";
    }
    @RequestMapping("returnViewGoods/{aid}")
    public ModelAndView returnViewGoods(@PathVariable String aid){
        int id =Integer.parseInt(aid);
        ModelAndView modelAndView =goodsInfoService.showGoodsInfoById(id);
        return modelAndView;
    }

}
