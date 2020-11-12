package org.final_proj.domain;

import lombok.Data;

@Data
public class GoodsVO {

	private String goodsNo;
	private String goodsName;
	private String shortName;
	private Integer price;
	private String priceStr;
	private String weight;
	private String saleUnit;
	private String shippingType;
	private String category;
	private String thumbImgUrl;
	private String shortEx;
	private String longEx;
	private String goodsIntroImgUrl;
	private String ckPointImgUrl;
	private String goodsPickImgUrl;
	private String goodsDetailImgUrl;

}
