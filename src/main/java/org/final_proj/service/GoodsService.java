package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.Criteria;
import org.final_proj.domain.GoodsVO;

public interface GoodsService {
	public List<String> getGoodsNoList();

	public List<GoodsVO> getGoodsAll(Criteria cri);

	public void updateGoods(GoodsVO vo);
	
	public GoodsVO getDetail(String goodsNo);
	
	public List<GoodsVO> getList(Criteria cri);
	
	public List<GoodsVO> goodsList(String ingre);

	
}
    