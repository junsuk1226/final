package com.kdt.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kdt.finalproject.mapper.JoinMapper;
import com.kdt.finalproject.vo.MemVO;

@Service
public class JoinService {

  @Autowired
  private JoinMapper j_mapper;

  @Autowired
  private PasswordEncoder passwordEncoder;

  public int addMem(MemVO mvo) { // reg.jsp에서 전달한 m_id,m_pw,m_name이 채워진 vo다.
    MemVO vo = new MemVO();
    vo.setM_id(mvo.getM_id());
    vo.setM_name(mvo.getM_name());
    vo.setM_phone(mvo.getM_phone());

    // 비밀번호를 암호화 시킨후 다시 vo에 저장
    vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));

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

  // 관리자 회원가입 신청
  public int addAdmin(MemVO mvo) {
    MemVO vo = new MemVO();
    vo.setM_id(mvo.getM_id());
    vo.setM_name(mvo.getM_name());
    vo.setM_phone(mvo.getM_phone());

    // 비밀번호를 암호화 시킨후 다시 vo에 저장
    vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));

    return j_mapper.addAdmin(vo);
  }

  public int addAdminLog(MemVO mvo) {
    MemVO vo = new MemVO();
    vo.setM_id(mvo.getM_id());
    vo.setM_name(mvo.getM_name());
    vo.setM_phone(mvo.getM_phone());

    // 비밀번호를 암호화 시킨후 다시 vo에 저장
    vo.setM_pw(passwordEncoder.encode(mvo.getM_pw()));

    return j_mapper.addAdminLog(vo);
  }

}
