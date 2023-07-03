package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.FoodMapper;
import com.kdt.finalproject.vo.FoodVO;

@Service
public class FoodService {
    @Autowired
    private FoodMapper f_Mapper;

    public FoodVO[] all(String RestNm) {
        FoodVO[] ar = null;

        List<FoodVO> list = f_Mapper.getFood(RestNm);
        if (list != null && list.size() > 0) {
            ar = new FoodVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public FoodVO foodInfo(String seq) {
        FoodVO vo = null;

        vo = f_Mapper.getFoodInfo(seq);

        return vo;
    }

    public FoodVO getFoodImg(String fname) {
        return f_Mapper.getFood_img(fname);
    }

}
