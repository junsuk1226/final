package com.kdt.finalproject.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KakaoReadyResponseDTO {
    private String tid, // 결제 고유 번호
            next_redirect_mobile_url, // 모바일 웹일 경우 받는 결제페이지 url
            next_redirect_pc_url, // pc 웹일 경우 받는 결제 페이지
            created_at, // 결제 준비 요청 시간
            partner_order_id, // 가맹점 주문번호
            partner_user_id, // 가맹점 회원 ID
            m_idx,
            foonNm,
            foodCost,
            restNm;
}
