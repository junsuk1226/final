package com.kdt.finalproject.mapper;

import com.kdt.finalproject.vo.ReviewLogVO;
import com.kdt.finalproject.vo.ReviewVO;

public interface ReviewMapper {

    /* 리뷰 작성 */
    int addReview(ReviewVO vo);

    int addReviewLog(ReviewLogVO vo);
}
