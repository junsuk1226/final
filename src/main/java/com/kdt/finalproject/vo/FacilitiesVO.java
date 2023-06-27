package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class FacilitiesVO {
    private String direction, // 방향
            serviceAreaCode, // 영업부대시설코드
            serviceAreaName, // 휴게소명
            telNo, // 전화번호
            convenience, // 편의시설
            truckSaYn, // 화물휴게소유무
            maintenanceYn, // 경정비유무
            numOfRows, // 한 페이지당 출력건수
            pageNo, // 출력 페이지번호
            serviceAreaCode2, // 휴게소 코드
            routeName, // 노선명
            routeCode, // 노선코드
            svarAddr, // 휴게소주소
            pageSize, // 전체 페이지 수
            code, // 결과
            message, // 결과 메시지
            count, // 전체 결과 수
            brand; // 브랜드
}
