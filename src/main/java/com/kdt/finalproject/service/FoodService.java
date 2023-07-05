package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    public FoodVO getOneFood(String f_idx) {
        return f_Mapper.getOneFood(f_idx);
    }

    public FoodVO[] allList(String RestNm) {
        FoodVO[] ar = null;

        List<FoodVO> list = f_Mapper.getFoodList(RestNm);
        if (list != null && list.size() > 0) {
            ar = new FoodVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public int editFood(FoodVO vo) {
        return f_Mapper.editFood(vo);
    }

    public int editFoodLog(FoodVO vo) {
        return f_Mapper.editFoodLog(vo);
    }

    public int addFood(FoodVO vo) {

        return f_Mapper.addFood(vo);
    }

}
