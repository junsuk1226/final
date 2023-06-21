package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class MapVO {
    private String unitCode, // 휴게소코드
            unitName, // 휴게소명
            routeName, // 노선명
            xValue, // x좌표값
            yValue; // y좌표값
}
