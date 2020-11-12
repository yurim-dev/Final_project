package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.OrderVO;

public interface OrderService {
	
	public void orderGoods(List<OrderVO> orderRecord);
	
	public void deleteOrderedGoods(List<CartDTO> items);
	
	public List<OrderVO> getDetail(Long orderId);
	
	public List<OrderVO> gethistory(String userId);
	
	public List<OrderVO> getAllHistory();
}
