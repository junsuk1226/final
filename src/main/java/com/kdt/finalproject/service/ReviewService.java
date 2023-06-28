package com.kdt.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.ReviewMapper;
import com.kdt.finalproject.vo.ReviewLogVO;
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

    public int addReview(ReviewVO rvo) {
        return r_Mapper.addReview(rvo);
    }

    public int addReviewLog(ReviewLogVO rvo) {
        return r_Mapper.addReviewLog(rvo);
    }

    public ReviewVO[] getRestReviewList(String RestNm) {
        List<ReviewVO> r_list = r_Mapper.getRestReviewList(RestNm);

        ReviewVO[] ar = null;
        if (r_list != null && r_list.size() > 0) {
            ar = new ReviewVO[r_list.size()];
            r_list.toArray(ar);
        }

        return ar;
    }
}
