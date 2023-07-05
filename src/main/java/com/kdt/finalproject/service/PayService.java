package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public PayVO[] order_list(int begin, int end, String m_idx, String searchType, String searchValue) {

        Map<String, Object> map = new HashMap<>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("m_idx", m_idx);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }

        List<PayVO> list = p_Mapper.order_list(map);
        PayVO[] ar = null;

        if (list != null && list.size() > 0) {
            ar = new PayVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public int kakaorefund(PayVO vo) {
        int cnt = 0;

        cnt = p_Mapper.kakaorefund(vo);

        return cnt;
    }

    public int delOrder(String p_idx) {

        return p_Mapper.delOrder(p_idx);
    }

    public PayVO order_selected(String p_idx) {
        return p_Mapper.order_selected(p_idx);
    }

    public int getTotalCount(String m_idx) {
        return p_Mapper.totalCount(m_idx);
    }

}
