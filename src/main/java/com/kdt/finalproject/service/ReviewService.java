package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.ReviewMapper;
import com.kdt.finalproject.vo.ReviewVO;

@Service
public class ReviewService {
    @Autowired
    private ReviewMapper r_Mapper;

    public ReviewVO[] getReviewList(String m_idx) {

        List<ReviewVO> r_list = r_Mapper.getReviewList(m_idx);

        ReviewVO[] ar = null;
        if (r_list != null && r_list.size() > 0) {
            ar = new ReviewVO[r_list.size()];
            r_list.toArray(ar);
        }

        return ar;
    }
}
