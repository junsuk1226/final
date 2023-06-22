package com.kdt.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.JoinMapper;
import com.kdt.finalproject.vo.MemVO;

@Service
public class JoinService {

  @Autowired
  private JoinMapper j_mapper;

  public int addMem(MemVO vo) {
    return j_mapper.addMem(vo);
  }

  public boolean check_email(MemVO vo) {
    boolean chk = false;

    MemVO mvo = j_mapper.check_email(vo);

    if (mvo == null)
      chk = true;

    return chk;
  }

  public int updateToken(MemVO vo) {
    return j_mapper.updateToken(vo);
  }

  public boolean check_id(String email) {
    boolean chk = false;

    MemVO mvo = j_mapper.check_id(email);

    if (mvo == null)
      chk = true;

    return chk;
  }

  public MemVO getMem(MemVO vo) {
    MemVO mvo = j_mapper.check_email(vo);

    return mvo;
  }
}
