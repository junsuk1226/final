package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MemLogVO;
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
    int approval(String m_id);

    int addLog(Map<String, String> map);

    int addRegRest(Map<String, String> map2);

    int insertMenuData(List<FoodVO> f_list);

    int insertMenuDataLog(List<FoodVO> f_list);

    // 가입 거절
    void refuse(String m_id);

    int totalCount(Map<String, Object> map);

    List<MemLogVO> regLogList(Map<String, Object> map);

    // 현재 가입되어있는 휴게소 정보
    List<RegRestVO> getRegRestList();

    // 현재 가입중 휴게소 수
    int getRegRestCnt();

    // 현재 승인 대기중 휴게소 수
    int waitRegRestCnt();
}
