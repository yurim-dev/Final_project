/** 장바구니에 있는 상품을 수정, 삭제 하는 기능 등을 담당하는 REST 컨트롤러
 * */
package org.final_proj.controller;

import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.IngredientDTO;
import org.final_proj.domain.MemberVO;
import org.final_proj.service.CartService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@AllArgsConstructor
@RequestMapping("/cart")
@Log4j
public class CartController {
	private CartService service;

	// 특정 사용자의 장바구니 목록을 불러와 JSON 형식으로 보냄
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/list", produces="application/json;charset=UTF-8") 
	public ResponseEntity<List<CartDTO>> getCartList(@RequestBody MemberVO member) throws Exception {
		log.info(">>>>>> 장바구니 목록 불러오기" + member.getUserId());
		return new ResponseEntity<List<CartDTO>>(service.cartList(member), HttpStatus.OK);
	}

	// 사용자의 장바구니에 물건을 추가함
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/add", produces="application/json;charset=UTF-8")
	public ResponseEntity<List<CartDTO>> addToCart(@RequestBody CartDTO item) throws Exception {
		log.info(">>>>>> 장바구니에 물건 추가합니다....");
		MemberVO member = new MemberVO();
		member.setUserId(item.getUserId());
		service.addToCart(item);
		return new ResponseEntity<List<CartDTO>>(service.cartList(member), HttpStatus.OK);
	}
	
	@PostMapping(value="/addAll", produces="application/json;charset=UTF-8")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<List<CartDTO>> addAllToCart(@RequestBody IngredientDTO data) throws Exception {
		log.info(">>>>>> 장바구니 물건 여러개 추가...");
		MemberVO member = new MemberVO();
		member.setUserId(data.getUserId());
		
		CartDTO dto = new CartDTO();
		for(int i=0; i<data.getGoodsNo().size();i++) {
			dto.setUserId(data.getUserId());
			dto.setGoodsNo(data.getGoodsNo().get(i)); //i번째(0)
			dto.setAmount(data.getAmount().get(i));
			service.addToCart(dto);
			log.info("goodsNo:"+ dto.getGoodsNo());
		}
		
		return new ResponseEntity<List<CartDTO>>(service.cartList(member), HttpStatus.OK);
	}

	

	// 사용자의 장바구니에서 물건 여러 개 삭제하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/delete", produces="application/json;charset=UTF-8")
	public ResponseEntity<List<CartDTO>> deleteFromCart(@RequestBody List<CartDTO> items) throws Exception {
		log.info(">>>>>> 장바구니의 물건 삭제합니다.....");
		MemberVO member = new MemberVO();
		member.setUserId(items.get(0).getUserId());
		service.deleteFromCart(items);
		return new ResponseEntity<List<CartDTO>>(service.cartList(member), HttpStatus.OK);
	}

	// 사용자의 장바구니에 있는 물건의 개수 변경하기
	@PreAuthorize("isAuthenticated()")
	 @PostMapping(value="/update", produces="application/json;charset=UTF-8") 
	 public HttpStatus updateAmount(@RequestBody CartDTO item) throws Exception {
		log.info(">>>> 장바구니 물품의 개수를 변경합니다......");
		service.updateAmount(item);
		// 업데이트 에러 처리 나중에 하기
		return HttpStatus.OK;
	}
	
	// 변경한 장바구니 제품 출력
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/goods", produces = "application/json;charset=utf-8")
	public ResponseEntity<CartDTO> getGoods(@RequestBody CartDTO item) throws Exception {
		log.info(">>>>> 장바구니의 특정 물품을 반환합니다......");
		return new ResponseEntity<CartDTO>(service.getGoods(item), HttpStatus.OK);
	}
	 

}
