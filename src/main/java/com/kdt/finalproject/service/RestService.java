package com.kdt.finalproject.service;

import java.time.Month;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.RestMapper;
import com.kdt.finalproject.vo.MonthTotalVO;
import com.kdt.finalproject.vo.OrderCntVO;
import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.RestPhotoVO;
import com.kdt.finalproject.vo.ReviewVO;

@Service
public class RestService {

  @Autowired
  private RestMapper r_Mapper;

  public RestPhotoVO check_photo(int svarCd) {

    RestPhotoVO rpvo = r_Mapper.check_photo(svarCd);

    return rpvo;
  }

  // 월별 매출
  public MonthTotalVO[] getAllMonthTotal(String restNm) {
    List<MonthTotalVO> list = r_Mapper.getAllMonthTotal(restNm);
    MonthTotalVO[] ar = null;
    if (list != null) {
      ar = new MonthTotalVO[list.size()];
      list.toArray(ar);
    }
    return ar;
  }

  //최근 리뷰
  public ReviewVO[] getRecentReview(String restNm){
    List<ReviewVO> list = r_Mapper.getRecentReview(restNm);
    ReviewVO[] ar = null;
    if(list != null){
      ar = new ReviewVO[list.size()];
      list.toArray(ar);
    }
    return ar;
  }


  // 이번달 총 매출
  public int getSameMonth_totalCost(String restNm) {
    int cost = r_Mapper.getSameMonth_totalCost(restNm);
    return cost;
  }

  // 이번달 총 주문 건수(메뉴 낱개당 1)
  public int getthisMonthCnt(String restNm) {
    List<PayVO> list = r_Mapper.getSameMonth_paylog(restNm);
    int cnt = 0;
    
    PayVO[] ar= null;
    if(list != null){
      ar = new PayVO[list.size()];
      list.toArray(ar);

      ArrayList<Integer> cntlist = new ArrayList<>();
      for(int i =0; i< ar.length; i++){
        String seqLine = ar[i].getSeq();

        String[] sAr = seqLine.split("/");
        for(String seq:sAr){
          cntlist.add(Integer.parseInt(seq));
        }
      }
      for(int i: cntlist){
        cnt+=i;
      }
    }
    return cnt;
  }

  // 이번달에 가장 많이 팔린 메뉴 구하기
  public OrderCntVO[] getSameMonth_paylog(String restNm) {
    List<PayVO> list = r_Mapper.getSameMonth_paylog(restNm);

    OrderCntVO[] ar = null; // 2개 이상 나올 수 있으므로 배열로 보내자...............

    PayVO[] ar2 = null;
    if (list != null) {
      ar2 = new PayVO[list.size()];
      list.toArray(ar2);

      ArrayList<OrderCntVO> orderCnt = new ArrayList<>();

      for (int i = 0; i < ar2.length; i++) {
        String foodNmLine = ar2[i].getFoodNm();// 음식 이름
        String foodQnLine = ar2[i].getFoodQn();// 음식 수량
        String seqLine = ar2[i].getSeq();// 사진 가져오려면 필요함

        String[] fNmAr = foodNmLine.split("/");
        String[] fQnAr = foodQnLine.split("/");
        String[] seqAr = seqLine.split("/");

        // 배열로 반환된 foodNm들을 orderCnt리스트에 넣기
        for (int j = 0; j < fNmAr.length; j++) {
          String foodNm = fNmAr[j];
          String seq = seqAr[j];
          int foodQn = Integer.parseInt(fQnAr[j]);

          boolean chk = false;
          for (OrderCntVO vo : orderCnt) {
            if (vo.getFoodNm().equals(foodNm)) {
              vo.setCnt(vo.getCnt() + foodQn);
              chk = true;

              break;
            }
          }

          if (!chk) {
            // foodNm이 같은 vo가 없을 때는 리스트에 vo를 생성한다
            OrderCntVO vo = new OrderCntVO(foodNm, seq, foodQn);
            orderCnt.add(vo);
          }

        }

      }
      // orderCnt에 저장된 객체 중에서 Cnt가 가장 큰 객체를 list에 저장한다.
      ArrayList<OrderCntVO> resCnt = new ArrayList<>();
      int maxCnt = 0;
      for (OrderCntVO vo : orderCnt) {
        if (vo.getCnt() >= maxCnt) {
          resCnt.add(vo);
          maxCnt = vo.getCnt(); // maxCnt를 새로운 값으로 설정
        }
        // 이전의 maxCnt와 작은 값의 객체를 resCnt에서 제거
        Iterator<OrderCntVO> iterator = resCnt.iterator();
        while (iterator.hasNext()) {
          if (iterator.next().getCnt() < maxCnt) {
            iterator.remove();

          }
        }

      }
      if (resCnt != null) {
        ar = new OrderCntVO[resCnt.size()];
        resCnt.toArray(ar);
      }
    }

    return ar;
  }

}
