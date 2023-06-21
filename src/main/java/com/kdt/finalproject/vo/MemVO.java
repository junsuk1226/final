package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MemVO {
    private String m_idx,
            m_id,
            m_pw,
            m_name,
            m_joinDate,
            m_dropDate,
            m_status,
            access_token,
            refresh_token,
            m_var1,
            m_var2,
            m_var3,
            m_var4,
            m_var5;
}
