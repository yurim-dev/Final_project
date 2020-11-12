package org.final_proj.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderVO {
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
	
	
	public OrderVO(Long orderId, String userId, String goodsNo, Long amount, Long unitPrice, Long totalPrice) {
		this.orderId = orderId;
		this.userId = userId;
		this.goodsNo = goodsNo;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
	}

	public OrderVO(Long orderId, String userId, Date orderDate, String status, Long sum) {
		this.orderId = orderId;
		this.userId = userId;
		this.orderDate = orderDate;
		this.status = status;
		this.sum = sum;
	}
	
	public OrderVO(Long orderId, String userId, Long amount,Date orderDate, String status, Long sum) {
		this.orderId = orderId;
		this.userId = userId;
		this.amount = amount;
		this.orderDate = orderDate;
		this.status = status;
		this.sum = sum;
	}

	public OrderVO(Long orderId, Long sum) {
		this.orderId = orderId;
		this.sum = sum;
	}
	
	public OrderVO(String goodsNo, Long amount, Long unitPrice, Long totalPrice, Date orderDate, String status) {
		super();
		this.goodsNo = goodsNo;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.status = status;
		
	}
	
	public OrderVO(Long orderId, String goodsNo, String goodsName, Long amount, Long unitPrice, Long totalPrice,
			Date orderDate, String status, String userName, String address) {
		this.orderId = orderId;
		this.goodsNo = goodsNo;
		this.goodsName = goodsName;
		this.amount = amount;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.status = status;
		this.userName = userName;
		this.address = address;
	}
	
	  public OrderVO(Long orderId, String userId, String goodsNo, Long amount, Long unitPrice, Long totalPrice,
		         Date orderDate, String status) {
		      super();
		      this.orderId = orderId;
		      this.userId = userId;
		      this.goodsNo = goodsNo;
		      this.amount = amount;
		      this.unitPrice = unitPrice;
		      this.totalPrice = totalPrice;
		      this.orderDate = orderDate;
		      this.status = status;
		   }
}
