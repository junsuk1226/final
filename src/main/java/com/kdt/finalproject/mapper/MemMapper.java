package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.MemLogVO;
import com.kdt.finalproject.vo.MemVO;

public interface MemMapper {

    List<MemVO> all();

    MemVO login(String m_id);

    int updateMem(MemVO vo);

    int updatePw(MemVO vo);

    MemVO adminLogin(String m_id);

    MemVO adminTotalLogin(String m_id);

    MemVO searchMem(String m_idx);

    int totalCount(Map<String, Object> map);

    int logTotalCount(Map<String, Object> map);

    List<MemVO> allMem(Map<String, Object> map);

    int updateMemLog(MemVO vo);

    List<MemLogVO> allMemLog(Map<String, Object> map);

}
