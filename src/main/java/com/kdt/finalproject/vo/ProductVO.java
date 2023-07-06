package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
    private String foodNm, RestNm, seq;
    private int foodCost, totalPrice, quantity;
}
