package org.final_proj.mapper;

import java.util.ArrayList;
import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CartMapperTests {
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	
	@Test
	public void 전체_테이블_가져오기() {
		List<CartDTO> cl = null;
		cl = cartMapper.getAll();
		cl.forEach(p -> log.info(p));
	}
	
	@Test
	public void test000에_12번_물건을_5개_담기() {
		CartDTO cart = new CartDTO();
		cart.setUserId("test0000");
		cart.setGoodsno("43337");
		cart.setAmount(5L);
		cartMapper.add(cart);
	}
	
	@Test
	public void test0000의_카트에_있는_물건_조회_테스트() {
		MemberVO member = new MemberVO();
		member.setUserId("test0000");
		cartMapper.get(member);
	}
	
	@Test
	public void test000의_카트에_있는_8번_물건을_여러개_삭제하는_테스트() {
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
		cartMapper.delete(items);
	}
	
	@Test
	public void test0000의_카트에_있는_물건의_수량과_전체_가격을_수정하는_테스트() {
		CartDTO cart = new CartDTO();
		cart.setUserId("test0000");
		cart.setGoodsno("8");
		cart.setAmount(1L);
		cartMapper.update(cart);
	}
	
	@Test
	public void 특정_제품_정보_가져오기() {
		CartDTO item = new CartDTO();
		item.setUserId("test0000");
		item.setGoodsno("6");
		cartMapper.getGoods(item);
	}
	
	@Test
	public void 카트에_있는_물건의_전체_가격의_합_구하기() {
		CartDTO cart = new CartDTO();
		cart.setUserId("test0000");
		log.info("▶test0000의 장바구니에 담긴 가격의 합은 " + cartMapper.getSum(cart) + " 입니다.");
	}
}
