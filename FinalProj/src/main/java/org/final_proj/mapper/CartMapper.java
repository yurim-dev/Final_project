package org.final_proj.mapper;

import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;

public interface CartMapper {
	// 카트 테이블 전체를 출력함
	public List<CartDTO> getAll();
	
	// 현재 사용자의 카트를 가져옴
	public List<CartDTO> get(MemberVO member);
	
	// 카트에 제품을 등록함
	// → 중복 제품은 DB의 프로시저로 처리할 것
	public void add(CartDTO cart);
	
	// 카트의 제품을 여러 개 삭제함
	public void delete(List<CartDTO> items);
	
	// 카트의 제품의 수량을 변경함
	public void updateAmount(CartDTO cart);
	
	// 장바구니의 특정한 제품의 정보를 불러옴
	public CartDTO getGoods(CartDTO item);
	
	// 카트의 제품의 전체 계산 가격을 출력함
	public int getSum(CartDTO cart);
	
	// 카트의 제품을 일부 주문함
	// → 주문할 제품의 정보를 주문 컨트롤러로 전달함
	public List<CartDTO> checkout(List<CartDTO> items);
	
	// 선택한 특정 제품의 가격을 계산함
	// → 자바스크립트를 이용해 페이지에서 출력만 하고 DB반영 X
	
}
