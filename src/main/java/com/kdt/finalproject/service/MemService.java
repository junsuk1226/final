package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.JoinMapper;
import com.kdt.finalproject.mapper.MemMapper;
import com.kdt.finalproject.vo.MemVO;

@Service
public class MemService {

    @Autowired
    private MemMapper m_Mapper;

    @Autowired
    private JoinMapper j_Mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public MemVO[] all() {
        MemVO[] ar = null;

        List<MemVO> list = m_Mapper.all();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public MemVO ml_login(MemVO mvo) {
        MemVO vo = m_Mapper.login(mvo.getM_id());

        if (vo != null) { // 사용자가 보내준 id가 DB에 존재할 경우!!
            // mvo가 가지는 비밀번호와 DB에서 가져온 vo의 비밀번호를
            // passwordEncoder에게 검증하라고 한다.
            if (passwordEncoder.matches(mvo.getM_pw(), vo.getM_pw())) {
                return vo;
            }
        }
        return null;
    }

    public int updateMem(MemVO vo) {
        return m_Mapper.updateMem(vo);
    }

    public int updatePw(MemVO vo) {
        return m_Mapper.updatePw(vo);
    }

}
