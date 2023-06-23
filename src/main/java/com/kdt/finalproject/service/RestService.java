package com.kdt.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.RestMapper;
import com.kdt.finalproject.vo.RestPhotoVO;

@Service
public class RestService {

  @Autowired
  private RestMapper r_Mapper;

  public RestPhotoVO check_photo(int svarCd) {

    RestPhotoVO rpvo = r_Mapper.check_photo(svarCd);

    return rpvo;
  }
}
