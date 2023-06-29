package com.kdt.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.PayMapper;
import com.kdt.finalproject.vo.PayVO;

@Service
public class PayService {

    @Autowired
    private PayMapper p_Mapper;

    public int kakaopay(PayVO vo) {
        return p_Mapper.kakaopay(vo);
    }

    public int poNum_count(PayVO vo) {
        return p_Mapper.poNum_count(vo);
    }

}
