package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class WeatherVO {
    private String unitName, // 휴게소 이름
            unitCode, // 휴게소 코드
            weatherContents, // 날씨 상태(구름조금, 맑음 등)
            tempValue; // 온도
}
