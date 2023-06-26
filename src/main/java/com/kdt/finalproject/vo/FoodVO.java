package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class FoodVO {
    private String f_idx,
            foodCost, // 음식 가격
            foodNm, // 음식명
            foodMaterial, // 음식 재료
            etc, // 음식 소개
            stdRestNm, // 휴게소 이름
            bestfoodyn, // 베스트 메뉴(Y,N)
            premiumyn, // 프리미엄 메뉴(Y,N)
            recommendyn, // 추천 메뉴(Y,N)
            seasonMenu, // 시즌 메뉴(4:사계절, S:여름, W:겨울)
            seq, // 음식 고유번호(API 제공)
            f_image; // 음식 이미지

}
