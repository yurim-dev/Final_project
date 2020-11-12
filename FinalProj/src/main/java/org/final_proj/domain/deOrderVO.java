package org.final_proj.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class deOrderVO {
	private Long orderId;
	private String userId;
	private String userName;
	private String goodsNo;
	private Long amount;
	private Long unitPrice;
	private Long totalPrice;
	private Date orderDate;
	private String status;
	private Long sum;
	private String goodsName;
	private String address;
}
