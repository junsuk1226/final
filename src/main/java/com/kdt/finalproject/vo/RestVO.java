package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class RestVO {
    private String svarCd, // 휴게소코드
            svarNm, // 휴게소명
            routeCd, // 노선코드
            routeNm, // 노선명
            hdqrCd, // 본부코드
            hdqrNm, // 본부명
            mtnofCd, // 지사코드
            mtnofNm, // 지사명
            gudClssCd, // 상하행구분코드
            gudClssNm, // 상하행구분명
            svarAddr, // 휴게소 주소
            rprsTelNo, // 대표전화번호
            dspnPrkgTrcn, // 장애인주차대수
            cocrPrkgTrcn, // 소형차주차대수
            fscarPrkgTrcn; // 대형차주차대수

}
