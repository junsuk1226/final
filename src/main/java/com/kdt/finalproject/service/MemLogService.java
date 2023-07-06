package com.kdt.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.MemLogMapper;
import com.kdt.finalproject.vo.MemLogVO;

@Service
public class MemLogService {

    @Autowired
    private MemLogMapper memLogMapper;

    public int join_log(MemLogVO mvo) {
        return memLogMapper.join_log(mvo);
    }

    public int edit_log(MemLogVO mvo) {
        return memLogMapper.edit_log(mvo);
    }

    public int drop_log(MemLogVO mvo) {
        return memLogMapper.drop_log(mvo);
    }
}
