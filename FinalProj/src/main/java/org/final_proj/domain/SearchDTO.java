/** 검색할 검색어와 타입을 저장하는 객체
 * */
package org.final_proj.domain;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class SearchDTO {
	private String type;
	private String query;
	private String filter;
	private String filterWord;
	
	
	public SearchDTO(String type, String query) {
		this.type = type;
		this.query = query;
	}
	
	/* 검색 타입 참고
	 * 1. 재료: I 
	 * 2. 음식 이름: N
	 * 3. 음식 종류: K
	 */

	
	
	public String [] getTypeArr() {
		return type == null? 
				new String[] {} : type.split(""); 
	}
	
	public String [] getFilterArr() {
		return filter == null? 
				new String[] {} : type.split(""); 
	}
}
