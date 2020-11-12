package org.final_proj.domain;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
public class CartDTO {
	private String userId;
	private String goodsNo;
	private String goodsName;
	private String thumbImgUrl;
	private Long amount;
	private Long unitPrice;
	private Long totalPrice;
	private Date insertDate;
	private Date updateDate;
	
	
	public CartDTO(String userId, String goodsNo, Long amount) {
		this.userId = userId;
		this.goodsNo = goodsNo;
		this.amount = amount;
	}

	public CartDTO(String userId, String goodsNo) {
		super();
		this.userId = userId;
		this.goodsNo = goodsNo;
	}
	
	

}
