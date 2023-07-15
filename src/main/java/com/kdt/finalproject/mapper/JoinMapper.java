package com.kdt.finalproject.mapper;

import com.kdt.finalproject.vo.MemVO;

public interface JoinMapper {
    int addMem(MemVO vo);

    int addMemLog(MemVO vo);

    MemVO check_email(MemVO vo);

    int updateToken(MemVO vo);

    MemVO check_id(String email);

    MemVO getMem(MemVO vo);

    int addAdmin(MemVO vo); // 관리자 회원가입

    int addAdminLog(MemVO vo); // 관리자 회원가입시 로그기록

    int addkakao(MemVO vo);
}
