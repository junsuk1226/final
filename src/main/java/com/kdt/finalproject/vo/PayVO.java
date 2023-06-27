package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PayVO {
    private String p_idx,
            m_idx,
            restCd, // 휴게소 코드
            foodNm, // 음식 이름
            foodCost, // 개별 음식 가격
            totalCost, // 전체 음식 가격
            p_date, // 결제 일자
            p_status, // 결제 상태(결제, 취소)
            p_time, // 결제 시간
            p_oNum, // 주문 번호(키오스크 수령 번호)
            restNm, // 휴게소 이름
            payMethod, // 결제 방법(카, 네, 토)
            c_date, // 취소 일자
            c_time, // 취소 시간
            aid, // 요청 고유 번호
            tid, // 결제 고유 번호
            cid; // 가맹점 코드
}
