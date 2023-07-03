package com.kdt.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.RegRestVO;

@Mapper
public interface RegRestMapper {
    RegRestVO getRegRest(String RestNm);

    // 가입신청한 휴게소 정보
    List<MemVO> regList();
}
