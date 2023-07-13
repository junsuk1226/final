package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.ReviewLogVO;
import com.kdt.finalproject.vo.ReviewVO;

public interface ReviewMapper {

    /* 리뷰 작성 */
    int addReview(ReviewVO vo);

    int addReviewLog(ReviewLogVO vo);

    void delReview(String r_idx);

    List<ReviewVO> getReviewList(String m_idx);

    List<ReviewVO> getRestReviewList(String RestNm);

    Float getScoreAvg(String restNm);

    Float getScoreAvg_Mem(String m_idx);

    int getScoreCnt(String m_idx);

    int get5StarCnt(String m_idx);

    int get4StarCnt(String m_idx);

    int get3StarCnt(String m_idx);

    int get2StarCnt(String m_idx);

    int get1StarCnt(String m_idx);

    int getScoreCnt_Rest(String r_restNm);

    int get5StarCnt_Rest(String r_restNm);

    int get4StarCnt_Rest(String r_restNm);

    int get3StarCnt_Rest(String r_restNm);

    int get2StarCnt_Rest(String r_restNm);

    int get1StarCnt_Rest(String r_restNm);

    int totalCount(String m_idx);

    List<ReviewVO> getReviewList(Map<String, Integer> map);

    List<ReviewVO> adminReview(Map<String, String> map);

    int adminTotalCount(Map<String, String> map);

    int reviewTotalCount(Map<String, Object> map);

    List<ReviewVO> adminTotalReviewList(Map<String, Object> map);

}
