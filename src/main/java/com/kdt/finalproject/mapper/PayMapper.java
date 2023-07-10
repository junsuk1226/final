package com.kdt.finalproject.mapper;

import java.util.List;
import java.util.Map;

import com.kdt.finalproject.vo.PayVO;

public interface PayMapper {

    int kakaopay(PayVO vo);

    int poNum_count(PayVO vo);

    int tosspay(PayVO vo);

    PayVO kakao_refunt_select(String tid);

    PayVO order_receipt(String p_oderId);

    List<PayVO> order_list(Map<String, Object> map);

    int kakaorefund(PayVO vo);

    int delOrder(String p_idx);

    PayVO order_selected(String p_idx);

    int totalCount(Map<String, Object> map);

    // 관리자 페이지 날짜별 매출내역
    List<PayVO> daySales(Map<String, String> map);

    // 관리자 페이지 날짜별 매출내역 총 카운트
    int daySalesCnt(Map<String, String> map);

    // 관리자 페이지 월별 매출내역
    List<PayVO> monthSales(Map<String, String> map);

    // 관리자 페이지 월별 매출내역 총 카운트
    int monthSalesCnt(Map<String, String> map);

    // 관리자 페이지 날짜별 주문내역
    List<PayVO> dayOrder(Map<String, String> map);

    // 관리자 페이지 날짜별 주문내역 총 카운트
    int dayOrderCnt(Map<String, String> map);

    // 관리자 페이지 월별 주문내역
    List<PayVO> monthOrder(Map<String, String> map);

    // 관리자 페이지 월별 주문내역 총 카운트
    int monthOrderCnt(Map<String, String> map);

}
