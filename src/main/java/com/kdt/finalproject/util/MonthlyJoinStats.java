package com.kdt.finalproject.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class MonthlyJoinStats {
    private int year;
    private int month;
    private int joinCount;
}
