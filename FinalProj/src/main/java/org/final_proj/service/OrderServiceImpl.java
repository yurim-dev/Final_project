package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.OrderVO;
import org.final_proj.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {
	@Setter(onMethod_ = @Autowired)
	public OrderMapper mapper;
	
	@Override
	public void orderGoods(List<OrderVO> orderRecord) {
		log.info("주문 내역을 등록합니다............");
		mapper.insertOrder(orderRecord);
	}

	@Override
	public void deleteOrderedGoods(List<CartDTO> items) {
		log.info("주문한 상품을 장바구니에서 제거합니다.........");
		mapper.deleteOrderedGoods(items);
	}

	@Override
	public List<OrderVO> getDetail(Long orderId) {
		log.info(orderId + "번 주문의 상세 정보를 불러옵니다.........");
		return mapper.getDetail(orderId);
	}

	@Override
	public List<OrderVO> gethistory(String userId) {
		log.info(userId + "의 주문 내역을 불러옵니다.........");
		return mapper.getHistory(userId);
	}

	@Override
	public List<OrderVO> getAllHistory() {
		log.info("모든 주문 내역을 불러옵니다.........");
		return mapper.getAllHistory();
	}
}
