package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public FoodVO getFoodImg(String seq) {
        return f_Mapper.getFood_img(seq);
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

    public int addFoodLog(FoodVO vo) {

        return f_Mapper.addFoodLog(vo);
    }

    public int getMenuTotalCount(String searchType, String searchValue) {
        Map<String, Object> map = new HashMap<>();
        map.put("f_status", "3");
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }
        return f_Mapper.getMenuTotalCount(map);
    }

    public FoodVO[] getMenuList(int begin, int end, String searchType, String searchValue) {
        FoodVO[] ar = null;

        Map<String, Object> map = new HashMap<>();
        map.put("f_status", "3");
        map.put("begin", begin);
        map.put("end", end);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }

        List<FoodVO> list = f_Mapper.getMenuList(map);
        if (list != null && list.size() > 0) {
            ar = new FoodVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public int getOne(String restNm) {
        return f_Mapper.getOne(restNm);
    }

    public int getZero(String restNm) {
        return f_Mapper.getZero(restNm);
    }

}
