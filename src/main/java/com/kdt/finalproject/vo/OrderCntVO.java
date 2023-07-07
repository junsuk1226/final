package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class OrderCntVO { // 이번달에 가장 많이 팔린 메뉴를 구하기 위해 생성한 객체
    private String foodNm, seq;
    private int cnt;

}
