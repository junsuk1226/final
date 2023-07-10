package com.kdt.finalproject.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.ReviewService;
import com.kdt.finalproject.util.FileRenameUtil;
import com.kdt.finalproject.vo.ImageData;
import com.kdt.finalproject.vo.PayVO;
import com.kdt.finalproject.vo.ReviewLogVO;
import com.kdt.finalproject.vo.ReviewVO;

@Controller
public class ReviewWriteController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ServletContext application;

    private String editor_img = "/editor_upload";

    @GetMapping("/writeReview")
    public ModelAndView writeReview(String cPage, String restNm) {
        ModelAndView mv = new ModelAndView("/myPage/writeReview");

        mv.addObject("restNm", restNm);
        return mv;
    }

    @PostMapping("/saveImg")
    @ResponseBody
    public Map<String, String> saveImg(MultipartFile file) { // ajax에서 formdata를 data로 보냈다 -> Spring에서는 파일을 무조건
                                                             // MultipartFile로 받는다+변수명은 같게
        Map<String, String> map = new HashMap<String, String>();

        String fname = null;

        if (file.getSize() > 0) {
            // 첨부파일을 저장할 위치를 절대경로화 시킨다.
            String realPath = application.getRealPath(editor_img);

            String oname = file.getOriginalFilename();
            // 첨부파일이 이미 저장된 파일과 이름이 동일한 경우 이름을 변경한다.
            fname = FileRenameUtil.checkFileName(oname, realPath);

            try {
                file.transferTo(new File(realPath, fname)); // 파일업로드가 수행됨

            } catch (Exception e) {
                e.printStackTrace();
            }
            // db작업은 하지 않지만 경로를 반환해야 하기 때문에 현재 서버의 경로를 알아내야 한다.
            String path = request.getContextPath(); // 서버 경로 알아내기

            // json으로 반환하기 위해 map구조에 저장
            map.put("path", path + "/editor_upload"); // 서버 경로
            map.put("fname", fname); // 저장된 파일명
        }

        return map;
    }

    @PostMapping("/delImg")
    @ResponseBody
    public boolean delImg(@RequestBody ImageData data) {
        Boolean res = false;

        String path = data.getPath();
        String fname = data.getFname();

        String realPath = application.getRealPath(path);
        System.out.println(realPath + fname);
        File f = new File(realPath, fname);

        if (f.exists()) {
            res = f.delete();
            // System.out.println("파일이 존재함");
        }

        return res;
    }

    @PostMapping("/writeReview")
    @Transactional
    public ModelAndView writeReview(ReviewVO rvo, String cPage) {
        ModelAndView mv = new ModelAndView("redirect:/review");

        int cnt = reviewService.addReview(rvo);
        if (cnt > 0) {
            ReviewLogVO vo = new ReviewLogVO();
            vo.setR_idx(rvo.getR_idx());
            vo.setM_idx(rvo.getM_idx());

            reviewService.addReviewLog(vo);
        }
        return mv;
    }
}
