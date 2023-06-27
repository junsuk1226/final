package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.MemVO;

public interface MemMapper {

    List<MemVO> all();

    MemVO login(Map<String, String> map);

    int updateMem(MemVO vo);

    int updatePw(MemVO vo);

}
