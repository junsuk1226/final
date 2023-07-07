package com.kdt.finalproject.mapper;

import java.util.List;

import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.RestPhotoVO;

public interface RestMapper {

    RestPhotoVO check_photo(int svarCd);

    List<PayVO> getSameMonth_paylog();

}
