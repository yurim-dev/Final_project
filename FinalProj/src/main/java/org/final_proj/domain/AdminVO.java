package org.final_proj.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminVO {
	
	private Long orderId;
	private String userId;
	private Long amount;
	private Date orderDate;
	private String status;
	private Long sum;

}
