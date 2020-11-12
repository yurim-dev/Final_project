package org.final_proj.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
		@NotEmpty(message="입력")
		private String userId;
		@NotEmpty(message="입력")
		private String userPwd;
		@NotEmpty(message="입력")
		private String rePwd;
		@NotEmpty(message="입력")
		private String userName;
		@NotEmpty(message="입력")
		private String mailAddress;
		@NotEmpty(message="입력")
		private String address;
		private Date regDate; 
		private boolean enabled;
		
		private List<AuthVO> authList;

		
		
		
}
