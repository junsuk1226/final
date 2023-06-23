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
            seq, // 음식 코드
            foodCost, // 개별 음식 가격
            totalCost,
            p_date,
            p_status,
            p_time,
            p_oNum,
            p_var1,
            p_var2,
            p_var3,
            p_var4,
            p_var5;
}
