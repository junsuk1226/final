package com.kdt.finalproject.service;

import java.util.List;

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

    public int tosspay(PayVO vo) {
        return p_Mapper.tosspay(vo);
    }

    public PayVO kakao_refunt_select(String tid) {
        PayVO pvo = p_Mapper.kakao_refunt_select(tid);

        return pvo;
    }

    public PayVO order_receipt(String p_oderId) {
        PayVO pvo = p_Mapper.order_receipt(p_oderId);

        return pvo;
    }

    public PayVO[] order_list(String m_idx) {

        List<PayVO> list = p_Mapper.order_list(m_idx);
        PayVO[] ar = null;

        if (list != null && list.size() > 0) {
            ar = new PayVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

}
