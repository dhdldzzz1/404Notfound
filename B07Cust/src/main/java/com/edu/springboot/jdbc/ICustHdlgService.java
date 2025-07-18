package com.edu.springboot.jdbc;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ICustHdlgService {

    // 고객응대글 작성
    int write(CustHdlgDTO dto);

    // 전체 글 개수 조회 (검색 조건 포함 가능)
    int getTotalCount(ParameterDTO parameterDTO);

    // 페이지별 목록 조회 (검색 조건 포함 가능)
    ArrayList<CustHdlgDTO> listPage(ParameterDTO parameterDTO);

    // 특정 글 열람
    CustHdlgDTO view(CustHdlgDTO dto);

    // 글 수정
    int modify(CustHdlgDTO dto);

    int edit(CustHdlgDTO dto);
    
    // 글 삭제
    int delete(int id);
}
