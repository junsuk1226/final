package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.JoinMapper;
import com.kdt.finalproject.mapper.MemMapper;
import com.kdt.finalproject.util.MonthlyJoinStats;
import com.kdt.finalproject.vo.MemLogVO;
import com.kdt.finalproject.vo.MemVO;

@Service
public class MemService {

    @Autowired
    private MemMapper m_Mapper;

    @Autowired
    private JoinMapper j_Mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public MemVO[] all() {
        MemVO[] ar = null;

        List<MemVO> list = m_Mapper.all();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public MemVO ml_login(MemVO mvo) {
        MemVO vo = m_Mapper.login(mvo.getM_id());

        if (vo != null) { // 사용자가 보내준 id가 DB에 존재할 경우!!
            // mvo가 가지는 비밀번호와 DB에서 가져온 vo의 비밀번호를
            // passwordEncoder에게 검증하라고 한다.
            if (passwordEncoder.matches(mvo.getM_pw(), vo.getM_pw())) {
                return vo;
            }
        }
        return null;
    }

    public int updateMem(MemVO vo, MemVO mvo) {
        int cnt = -1;
        if (passwordEncoder.matches(vo.getM_pw(), mvo.getM_pw())) {
            vo.setM_pw(passwordEncoder.encode(vo.getM_pw())); // 새로운 비밀번호로 업데이트
            cnt = m_Mapper.updateMem(vo);
            if (cnt > 0) {
                // 세션에 있는 정보도 수정해 줘야 한다.
                mvo.setM_name(vo.getM_name());
                mvo.setM_phone(vo.getM_phone());
            }
        }
        return cnt;
    }

    public int updatePw(MemVO vo, MemVO mvo) {
        int cnt = -1;

        if (passwordEncoder.matches(vo.getM_pw(), mvo.getM_pw())) {
            vo.setM_pw(passwordEncoder.encode(vo.getNew_pw()));
            cnt = m_Mapper.updatePw(vo);
        }

        return cnt;
    }

    // 어드민 로그인
    public MemVO admin_login(MemVO mvo) {
        MemVO vo = m_Mapper.adminLogin(mvo.getM_id());

        if (vo != null) { // 사용자가 보내준 id가 DB에 존재할 경우!!
            // mvo가 가지는 비밀번호와 DB에서 가져온 vo의 비밀번호를
            // passwordEncoder에게 검증하라고 한다.
            if (passwordEncoder.matches(mvo.getM_pw(), vo.getM_pw())) {
                return vo;
            }
        }
        return null;
    }

    // 어드민(total) 로그인
    public MemVO adminTotal_login(MemVO mvo) {
        MemVO vo = m_Mapper.adminTotalLogin(mvo.getM_id());

        if (vo != null) { // 사용자가 보내준 id가 DB에 존재할 경우!!
            // mvo가 가지는 비밀번호와 DB에서 가져온 vo의 비밀번호를
            // passwordEncoder에게 검증하라고 한다.
            if (passwordEncoder.matches(mvo.getM_pw(), vo.getM_pw())) {
                return vo;
            }
        }
        return null;
    }

    public MemVO searchMem(String m_idx) {

        MemVO vo = m_Mapper.searchMem(m_idx);

        return vo;
    }

    public int updateMem(MemVO mvo) {

        int cnt = m_Mapper.updateMem(mvo);

        return cnt;
    }

    public int totalCount(String searchType, String searchValue, String m_status) {
        Map<String, Object> map = new HashMap<>();
        map.put("m_status", m_status);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }
        return m_Mapper.totalCount(map);
    }

    public MemVO[] allMem(int begin, int end, String searchType, String searchValue, String m_status) {
        Map<String, Object> map = new HashMap<>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("m_status", m_status);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }

        MemVO[] ar = null;

        List<MemVO> list = m_Mapper.allMem(map);
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public int updateMemLog(MemVO vo) {

        return m_Mapper.updateMemLog(vo);
    }

    public int logTotalCount(String searchType, String searchValue, String m_status) {
        Map<String, Object> map = new HashMap<>();
        map.put("m_status", m_status);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }
        return m_Mapper.logTotalCount(map);
    }

    public MemLogVO[] allMemLog(int begin, int end, String searchType, String searchValue, String m_status) {
        Map<String, Object> map = new HashMap<>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("m_status", m_status);
        if (searchType != null && searchValue != null) {
            map.put("searchType", searchType);
            map.put("searchValue", searchValue);
        }

        MemLogVO[] ar = null;

        List<MemLogVO> list = m_Mapper.allMemLog(map);
        if (list != null && list.size() > 0) {
            ar = new MemLogVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public List<MonthlyJoinStats> geMonthlyJoinStats() {
        return m_Mapper.getMonthlyJoinStats();
    }

}
