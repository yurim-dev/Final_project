package org.final_proj.mapper;

import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.OrderVO;

public interface OrderMapper {
	// 주문 내역 테이블에 주문 정보를 등록함
	public void insertOrder(List<OrderVO> items);
	
	// 결제한 상품을 장바구니에서 삭제함
	public void deleteOrderedGoods(List<CartDTO> items);
	
	// 특정한 주문내역의 상세 정보를 불러옴
	public List<OrderVO> getDetail(Long orderId);
	
	// 특정한 사용자의 주문 내역을 전부 불러옴
	public List<OrderVO> getHistory(String userId);
	
	// 주문 내역별로 가격을 가져옴
	public List<OrderVO> getSum();
	
	/**********************************************************************/
	// (관리자) 모든 주문 내역을 불러옴
	public List<OrderVO> getAllHistory();
}
