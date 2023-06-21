<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <div class="pc content">
                <div class="pc-content">
                    <div class="pc-inner">
                        <p class="sec-ti">휴게소 찾기</p>
                        <div class="pc-oil-station">
                            <div class="top-search">
                                <div class="search-box">
                                    <dl>
                                        <dt>휴게소명/지역명으로 찾기</dt>
                                        <dd>
                                            <span class="inpt-inner pdr100">
                                                <input type="text" class="w100p pc-input02" placeholder="휴게소명이나 지역명을 입력해 주세요." id="idSearchText-pc">
                                                <button type="button" class="btn-yellow" id="idDetailSearch-pc">검색</button>
                                            </span>
                                            
                                            <p class="exe">예) 마포, OO휴게소</p>
                                        </dd>
                                    </dl>
                                </div>
                                <!--
                                <div class="search-box sub-search">
                                    <dl class="pt40">
                                        <dt>지역별 휴게소 찾기</dt>
                                        <dd class="f0">
                                            <div class="flex">
                                                <select class="type01" id="idSiDo-pc">
                                                    <option value="">시/도 선택</option>
                                                </select>
                                                <select  class="type01 ml20" id="idGuGun-pc">
                                                    <option value="">구/군 선택</option>
                                                </select>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                                -->
                            </div>


                            <div class="pc-search-results">
                                <div class="title">
                                    <h3>검색 결과</h3>
                                    <span>총 <strong class="red" id="idSearchCnt-pc">-</strong>개의 휴게소가 검색되었습니다.</span>
                                </div>
                            </div>
                            <div class="accordion pc-oil-station-list" id="idOilStationList-pc">
                            
                            </div>
                            <div class="pc-no-data none">
                                <div>검색결과가 없습니다.</div>
                            </div>
                            <div class="j_page_div"> 
								<input type="hidden" name="PAGE_NUM" id="j_now" value="1" />
								<input type="hidden" name="PAGE_TOT" id="J_tot" value="52" />
								<input type="hidden" name="PAGE_NOW" id="j_row" value="10" />
								<input type="hidden" name="PAGE_SIZE" id="j_page" value="5" />
								<input type="hidden" name="PAGE_EVENT" id="j_event" value="fn_pageList" />
							</div>
                            <div class="page-nav pt40 pb60" id="idPaing">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
		</div>
        <div class="pc-search-results">
            <div class="title">
                <h3>검색 결과</h3>
                <span>
                    "총"
                    <strong class="red" id="idSearchCnt-pc">갯수자리</strong>
                    "개의 주유소가 검색되었습니다."
                </span>
            </div>
        </div>
        <div class="accordion pc-hgs-station-list" id="idHgsStationList-pc">
            <dl class>
                <dt onclick="" class>
                    <h4>
                        <span class="tit">휴게소 이름</span>
                    </h4>
                    <div class="info">
                        <span class="address">휴게소 주소</span>
                        <span class="tel">
                            "번호자리"
                        </span>
                    </div>
                </dl>
            </dl>

        </div>