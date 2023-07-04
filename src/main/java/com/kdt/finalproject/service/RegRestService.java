package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.RegRestMapper;
import com.kdt.finalproject.vo.MemVO;
import com.kdt.finalproject.vo.RegRestVO;

@Service
public class RegRestService {
    @Autowired
    private RegRestMapper reg_Mapper;

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

    // 승인시 status값 변경 & member log추가 & regrest 테이블에 추가
    public void approval(String m_id, Map map, Map map2) {

        reg_Mapper.approval(m_id);

        reg_Mapper.addLog(map);

        reg_Mapper.addRegRest(map2);

    }

    // 거절시 status값 변경 & member log추가
    public void refuse(String m_id, Map map) {

        reg_Mapper.refuse(m_id);

        reg_Mapper.addLog(map);

    }

    // 휴게소 회원 상태 로그
    public MemVO[] regLogList() {
        MemVO[] ar = null;

        List<MemVO> list = reg_Mapper.regLogList();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

}
