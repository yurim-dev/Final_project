/** POST 방식으로 전송한 문자열을 @RequestBody로 받는 객체
 * */
package org.final_proj.domain;

import lombok.Data;

@Data
public class ReqBodyDTO {
	private String str;
}
