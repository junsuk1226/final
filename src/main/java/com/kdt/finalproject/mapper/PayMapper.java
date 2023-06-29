package com.kdt.finalproject.mapper;

import com.kdt.finalproject.vo.PayVO;

public interface PayMapper {

    int kakaopay(PayVO vo);

    int poNum_count(PayVO vo);

}
