package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MapInfoVO {
    private String brdName, // 브랜드명
            brdDesc, // 상세내용
            stime, // 시작시간
            etime, // 종료시간
            psName, // 편의시설 명칭
            psDesc; // 편의시설 상세내용

}
