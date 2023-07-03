package com.kdt.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.RegRestMapper;
import com.kdt.finalproject.vo.RegRestVO;

@Service
public class RegRestService {
    @Autowired
    private RegRestMapper reg_Mapper;

    public RegRestVO getRegRest(String RestNm) {
        return reg_Mapper.getRegRest(RestNm);
    }
}
