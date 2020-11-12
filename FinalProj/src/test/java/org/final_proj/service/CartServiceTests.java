package org.final_proj.service;

import java.util.ArrayList;
import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CartServiceTests {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
	@Test
	public void 장바구니_목록_꺼내오기_테스트() {
		MemberVO member = new MemberVO();
		member.setUserId("test0000");
		cartService.cartList(member).forEach(item -> log.info("장바구니: " + item));
	}
	
	@Test
	public void 장바구니_물건_추가하기_테스트() {
		CartDTO item = new CartDTO();
		item.setUserId("test0000");
		item.setAmount(10L);
		item.setGoodsno("17");
		cartService.addToCart(item);
	}
	
	@Test
	public void 장바구니에_있는_물건_여러_개_삭제하기() {
		List<CartDTO> items = new ArrayList<CartDTO>();
		CartDTO item1 = new CartDTO();
		item1.setUserId("test0000");
		item1.setGoodsno("12");
		items.add(item1);
		log.info(item1);
		CartDTO item2 = new CartDTO();
		item2.setUserId("test0000");
		item2.setGoodsno("11");
		log.info(item2);
		items.add(item2);
		log.info(items);
		cartService.deleteFromCart(items);
	}
	
	@Test
	public void 물건_개수_수정하기() {
		CartDTO item = new CartDTO();
		item.setUserId("test0000");
		item.setGoodsno("98");
		item.setAmount(6L);
		cartService.updateAmount(item);
	}
	
	@Test 
	public void getGoodsTest() {
		CartDTO item = new CartDTO();
		item.setGoodsno("43337");
		item.setUserId("test0000");
		cartService.getGoods(item);
	}
}
