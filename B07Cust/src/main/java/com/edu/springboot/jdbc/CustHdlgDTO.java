package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class CustHdlgDTO {

    private int custPostId;      // 문서 ID (PK)
    private String custId;       // 고객 ID

    private String ocurDttm;     // 발생 일시 (YYYYMMDDHHMISS)
    private String loc;          // 지역 코드 (CHAR 2)

    private String title;        // 제목
    private String ctnt;         // 내용

    private String isReqRspn;    // 답변 요청 여부 (Y/N)
    private String isUrgt;       // 긴급 여부 (Y/N)
    private String isDel;        // 삭제 여부 (Y/N)

    private String udtDt;        // 수정 일자 (YYYYMMDD)
    private String udtTm;        // 수정 시각 (HHMISS)
    private String udtUserId;    // 수정 사용자 ID

    private String regDt;        // 등록 일자 (YYYYMMDD)
    private String regTm;        // 등록 시각 (HHMISS)
    private String regUserId;    // 등록 사용자 ID
}
