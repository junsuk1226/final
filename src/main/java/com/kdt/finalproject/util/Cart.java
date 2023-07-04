package com.kdt.finalproject.util;

import java.util.ArrayList;
import java.util.List;

import com.kdt.finalproject.vo.ProductVO;

import lombok.Getter;

@Getter
public class Cart {
    /*
     * 카트(장바구니)의 기능 분석
     * 1) 제품(ProductVO)을 담을(저장) 수 있는 공간 : List<ProductVO>
     * 2) 1)에 제품을 저장하는 기능
     * 3) 1)에서 제품을 검색하는 기능 : 저장할 때도 이 기능을 써야함
     * 4) 1)에서 제품 삭제하는 기능
     * 5) 3)에서 검색된 제품의 수량을 변경하는 기능
     * 6) 1)에 있는 모든 제품들을 배열로 반환하는 기능
     * 7) 총액 계산
     * 
     * 위 분석에 따른 장바구니의 속성(멤버변수)
     * - List<ProductVO>
     * - int 또는 long totalPrice;
     * 
     * 장바구니의 기능(멤버 메서드)
     * - 제품 검색기능 (SearchProduct)
     * - 제품 추가기능 (addProduct)
     * - 제품 삭제기능 (delProduct)
     * - 수량 변경기능 (changeCount)
     * - getList (카트에 있는 모든 제품을 배열로 반환하는 기능
     */

    private List<ProductVO> list;

    public Cart() { // 생성자 useBean정의시 자동 호출됨
        list = new ArrayList<ProductVO>();
    }

    // 카트(List)에서 특정 제품(ProductVO)을 검색하는 기능
    public ProductVO searchProduc(String foodNm) {

        ProductVO vo = null;

        // 제품들은 모두 list에 있으므로 list가 비었다는 것은
        // 사용자의 장바구니에 아무것도 담지 않았다는 뜻이다.
        for (ProductVO pvo : list) {
            if (pvo.getFoodNm().equals(foodNm)) {
                vo = pvo;
                break; // 가장 가까운 반복문 탈출
            }
        } // for의 끝

        return vo;
    }

    // 카트에 저장된 모든 제품들을 하나의 배열로 반환하는 기능
    public ProductVO[] getList() {
        ProductVO[] ar = null;

        if (!list.isEmpty()) { // 장바구니(list)가 비어있지 않다면
                               // 장바구니의 크기와 동일한 배열을 생성
            ar = new ProductVO[list.size()];
            list.toArray(ar);

        }

        return ar; // list가 비었다면 ar이 null값을 반환하고, list가 요소를 가졌다면
                   // 그 요소들을 배열로 변환되어 반환한다.
    }

    // 제품을 카트에 저장하는 기능
    public void addProduct(ProductVO pvo) {
        // 제품은 진열대 (ShopBean 의 p_list)에 있으며, 진열대로부터
        // 원하는 제품을 가져와서 장바구니에 넣어준다. 즉
        // 인자로 넘어온 선택된 제품의 번호(foodNm)가 이미 장바구니에 저장된 제품일 수도
        // 있기 때문에 먼저 장바구니에서 검색하자
        ProductVO vo = searchProduc(pvo.getFoodNm());

        // 위의 vo가 null이 아닐 경우는 앞서 장바구니에 담은 제품이다.
        // 이때는 수량만 1증가 시킨다.
        if (vo != null) {
            // 먼저 기존 제품의 수량을 얻어낸다.
            int q = vo.getQuantity();
            vo.setQuantity(q + 1);
            return; // 더 이상 하지 않고 제어권 반환
        }

        list.add(pvo); // 장바구니에 저장
    }

    // 장바구니에서 특정 제품을 검색하여 삭제하는 기능
    public boolean delProduct(String foodNm) {
        boolean value = false;
        // 인자로 받은 제품번호 (foodNm)로 장바구니에서 해당 제품(ProductVO)을 검색
        ProductVO vo = searchProduc(foodNm);
        if (vo != null) {
            list.remove(vo);
            value = true;
        } // if문의 끝
        return value;
    }

    // 장바구니에서 원하는 제품을 검색한 후 수량만 입력하는 기능
    public void changeCount(String foodNm, int q) {
        ProductVO vo = searchProduc(foodNm);
        if (vo != null)
            vo.setQuantity(q);
    }

    public boolean cartClear() {

        list.clear();

        return true;
    }
}
