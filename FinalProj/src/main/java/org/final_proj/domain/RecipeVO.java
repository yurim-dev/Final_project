package org.final_proj.domain;

import lombok.Data;

// VO 클래스는 테이블 설계를 기준으로 작성하면 된다. (183쪽)
@Data
public class RecipeVO {
	private Long rcp_seq;			// 기본키
	private String rcp_nm;			// 이름
	private String rcp_way2;		// 조리 방법
	private String rcp_pat2;		// 음식 종류
	private String att_file_no_mk;	// 썸네일
	private String rcp_parts_dtls;	// 재료
	private String manual01;		// 과정 1
	private String manual_img01;	// 과정 1 사진
	private String manual02;		// 과정 2
	private String manual_img02;	// 과정 2 사진
	private String manual03;		// 과정 3
	private String manual_img03;	// 과정 3 사진
	private String manual04;		// 과정 4
	private String manual_img04;	// 과정 4사진
	private String manual05;		// 과정 5
	private String manual_img05;	// 과정 5 사진
	private String manual06;		// 과정 6
	private String manual_img06;	// 과정 6 사진
	private String manual07;		// 과정 7
	private String manual_img07;	// 과정 7 사진
	private String manual08;		// 과정 8
	private String manual_img08;	// 과정 8 사진
	private String rcp_dtls;  //기존재료에서 불필요한(숫자와 특수문자 제거한 문자열)
}
