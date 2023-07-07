package com.kdt.finalproject.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.RestMapper;
import com.kdt.finalproject.vo.OrderCntVO;
import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.RestPhotoVO;

@Service
public class RestService {

  @Autowired
  private RestMapper r_Mapper;

  public RestPhotoVO check_photo(int svarCd) {

    RestPhotoVO rpvo = r_Mapper.check_photo(svarCd);

    return rpvo;
  }

  // 이번달에 가장 많이 팔린 메뉴 구하기
  public OrderCntVO[] getSameMonth_paylog() {
    List<PayVO> list = r_Mapper.getSameMonth_paylog();

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
