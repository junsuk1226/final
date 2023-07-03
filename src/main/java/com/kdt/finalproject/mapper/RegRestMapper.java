package com.kdt.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.finalproject.vo.RegRestVO;

@Mapper
public interface RegRestMapper {
    RegRestVO getRegRest(String RestNm);
}
