package com.kdt.finalproject.service;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
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

    public void delReview(String r_idx) {
        r_Mapper.delReview(r_idx);
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

    public Float getScoreAvg(String RestNm) {
        return r_Mapper.getScoreAvg(RestNm);
    }

    public Float getScoreAvg_Mem(String m_idx) {
        return r_Mapper.getScoreAvg_Mem(m_idx);
    }

    public int getScoreCnt(String m_idx) {
        return r_Mapper.getScoreCnt(m_idx);
    }

    public Map<String, Integer> getStarCnt(String m_idx) {

        Map<String, Integer> map = new HashMap<String, Integer>();

        map.put("five", r_Mapper.get5StarCnt(m_idx));
        map.put("four", r_Mapper.get4StarCnt(m_idx));
        map.put("three", r_Mapper.get3StarCnt(m_idx));
        map.put("two", r_Mapper.get2StarCnt(m_idx));
        map.put("one", r_Mapper.get1StarCnt(m_idx));

        return map;
    }

    public int getTotalCount() {
        return r_Mapper.totalCount();
    }

    public ReviewVO[] getList(int begin, int end) {
        ReviewVO[] ar = null;

        List<ReviewVO> list = r_Mapper.ReviewList(begin, end);
        if (list != null && list.size() > 0) {
            ar = new ReviewVO[list.size()];
            list.toArray(ar);
        }

        return ar;
    }

}
