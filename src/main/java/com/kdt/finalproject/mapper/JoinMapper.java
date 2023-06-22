package com.kdt.finalproject.mapper;

import com.kdt.finalproject.vo.MemVO;

public interface JoinMapper {
    int addMem(MemVO vo);

    MemVO check_email(MemVO vo);

    int updateToken(MemVO vo);

    MemVO check_id(String email);

    MemVO getMem(MemVO vo);
}
