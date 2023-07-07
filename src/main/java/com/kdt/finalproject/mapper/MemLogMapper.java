package com.kdt.finalproject.mapper;

import com.kdt.finalproject.vo.MemLogVO;

public interface MemLogMapper {

    int join_log(MemLogVO mvo);

    int edit_log(MemLogVO mvo);

    int drop_log(MemLogVO mvo);
}
