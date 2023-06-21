package com.kdt.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.MemMapper;
import com.kdt.finalproject.vo.MemVO;

@Service
public class MemService {

    @Autowired
    private MemMapper m_Mapper;

    public MemVO[] all() {
        MemVO[] ar = null;

        List<MemVO> list = m_Mapper.all();
        if (list != null && list.size() > 0) {
            ar = new MemVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

    public MemVO ml_login(String m_id, String m_pw) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("email", m_id);
        map.put("password", m_pw);

        return m_Mapper.login(map);

    }
}
