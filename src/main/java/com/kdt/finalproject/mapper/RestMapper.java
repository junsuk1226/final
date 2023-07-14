package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.MonthTotalVO;
import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.RegRestVO;
import com.kdt.finalproject.vo.RestPhotoVO;
import com.kdt.finalproject.vo.ReviewVO;

public interface RestMapper {

    RestPhotoVO check_photo(int svarCd);

    List<PayVO> getSameMonth_paylog(String restNm);

    Map<String, Long> getSameMonth_totalCost(String restNm);

    Map<String, Long> getMonth_totalCost(Map<String, String> map);

    Map<String, Long> getDay_totalCost(Map<String, String> map);

    List<MonthTotalVO> getAllMonthTotal(String restNm);

    List<ReviewVO> getRecentReview(String restNm);

    RegRestVO getRestPic(String restNm);

}
