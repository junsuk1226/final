package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.RegRestVO;

@Mapper
public interface RegRestMapper {
    RegRestVO getRegRest(String RestNm);

    // 가입신청한 휴게소 정보
    List<MemVO> regList();

    // id로 휴게소 검색
    MemVO getRestInfo(String m_id);

    // 가입 승인 시 status값 변경
    void approval(String m_id);

    void addLog(Map map);

    void addRegRest(Map map2);

    // 가입 거절
    void refuse(String m_id);

    List<MemVO> regLogList();

    // 현재 가입되어있는 휴게소 정보
    List<RegRestVO> getRegRestList();

}
