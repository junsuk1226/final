package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.ReviewLogVO;
import com.kdt.finalproject.vo.ReviewVO;

public interface ReviewMapper {

    /* 리뷰 작성 */
    int addReview(ReviewVO vo);

    int addReviewLog(ReviewLogVO vo);

    void delReview(String r_idx);

    List<ReviewVO> getReviewList(String m_idx);

    List<ReviewVO> getRestReviewList(String RestNm);
}
