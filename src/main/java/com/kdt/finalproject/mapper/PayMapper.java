package com.kdt.finalproject.mapper;

import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.PayVO;

public interface PayMapper {

    int kakaopay(PayVO vo);

    int poNum_count(PayVO vo);

    int tosspay(PayVO vo);

    PayVO kakao_refunt_select(String tid);

    PayVO order_receipt(String p_oderId);

}
