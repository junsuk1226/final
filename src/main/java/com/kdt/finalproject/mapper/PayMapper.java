package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.PayVO;

public interface PayMapper {

    int kakaopay(PayVO vo);

    int poNum_count(PayVO vo);

    int tosspay(PayVO vo);

    PayVO kakao_refunt_select(String tid);

    PayVO order_receipt(String p_oderId);

    List<PayVO> order_list(Map<String, Object> map);

    int kakaorefund(PayVO vo);

    int delOrder(String p_idx);

    PayVO order_selected(String p_idx);

    int totalCount(String m_idx);

}
