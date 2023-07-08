package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.MonthTotalVO;
import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.RestPhotoVO;
import com.kdt.finalproject.vo.ReviewVO;

public interface RestMapper {

    RestPhotoVO check_photo(int svarCd);

    List<PayVO> getSameMonth_paylog(String restNm);

    int getSameMonth_totalCost(String restNm);

    List<MonthTotalVO> getAllMonthTotal(String restNm);

    List<ReviewVO> getRecentReview(String restNm);

}
