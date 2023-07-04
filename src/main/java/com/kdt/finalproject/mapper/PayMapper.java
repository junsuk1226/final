package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.PayVO;

public interface PayMapper {

    int kakaopay(PayVO vo);

    int poNum_count(PayVO vo);

    int tosspay(PayVO vo);

    PayVO kakao_refunt_select(String tid);

    PayVO order_receipt(String p_oderId);

    List<PayVO> order_list(String m_idx);

    int kakaorefund(PayVO vo);

    int delOrder(String p_idx);

}
