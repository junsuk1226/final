package com.kdt.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.finalproject.vo.FoodVO;

@Mapper
public interface FoodMapper {
    List<FoodVO> getFood(String RestNm);

    FoodVO getFoodInfo(String seq);

    FoodVO getFood_img(String fname);

    FoodVO getOneFood(String f_idx);
}
