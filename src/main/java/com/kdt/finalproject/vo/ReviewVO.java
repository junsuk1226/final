package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ReviewVO {
    private String r_idx,
            m_idx,
            r_content,
            r_score,
            restCd,
            r_status,
            r_writedate,
            r_restNm,
            r_var3,
            r_var4,
            r_var5;
}
