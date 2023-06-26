package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class FacilitiesVO {
    private String brand, 
            convenience, 
            direction, 
            maintenanceYn, 
            routeCode, 
            routeName,
            serviceAreaCode,
            serviceAreaCode2,
            serviceAreaName,
            svarAddr,
            telNo,
            truckSaYn;
}
