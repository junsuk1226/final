package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.kdt.finalproject.mapper.RegRestMapper;
import com.kdt.finalproject.vo.FoodVO;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.RegRestVO;

@Service
public class RegRestService {
    @Autowired
    private RegRestMapper reg_Mapper;

    // 현재 가입되어있는 휴게소 정보
    public RegRestVO getRegRest(String RestNm) {
        return reg_Mapper.getRegRest(RestNm);
    }

    // 가입신청한 휴게소 정보 가져오기
    public MemVO[] regList() {
        MemVO[] ar = null;

        List<MemVO> list = reg_Mapper.regList();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public MemVO getRestInfo(String m_id) {

        MemVO mvo = reg_Mapper.getRestInfo(m_id);

        return mvo;
    }

    @Transactional
    // 승인시 status값 변경 & member log추가 & regrest 테이블에 추가
    public void approval(String m_id, Map<String, String> map, Map<String, String> map2, List<FoodVO> f_list) {

        try {

            reg_Mapper.approval(m_id);

            reg_Mapper.addLog(map);

            reg_Mapper.addRegRest(map2);

            reg_Mapper.insertMenuData(f_list);

            reg_Mapper.insertMenuDataLog(f_list);

        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            throw e;
        }

    }

    // 거절시 status값 변경 & member log추가
    public void refuse(String m_id, Map map) {

        reg_Mapper.refuse(m_id);

        reg_Mapper.addLog(map);

    }

    public int totalCount(String searchType, String searchValue) {
        Map<String, Object> map = new HashMap<>();
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }
        return reg_Mapper.totalCount(map);
    }

    // 휴게소 회원 상태 로그
    public MemVO[] regLogList(int begin, int end, String searchType, String searchValue) {
        Map<String, Object> map = new HashMap<>();
        map.put("begin", begin);
        map.put("end", end);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }

        MemVO[] ar = null;

        List<MemVO> list = reg_Mapper.regLogList(map);
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    // 현재 가입되어있는 휴게소 리스트 가져오는 함수
    public RegRestVO[] getRegRestList() {

        RegRestVO[] ar = null;

        List<RegRestVO> list = reg_Mapper.getRegRestList();
        if (list != null && list.size() > 0) {
            ar = new RegRestVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

}
