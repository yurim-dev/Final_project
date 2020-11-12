package org.final_proj.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;
import org.final_proj.domain.OrderVO;
import org.final_proj.mapper.OrderMapper;
import org.final_proj.service.CartService;
import org.final_proj.service.OrderService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// "/order"가 들어가는 주소는 모두 이 컨트롤러로 옴
@Controller
@Log4j
@EnableWebMvc
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	private CartService cartService;
	private OrderService orderService;

	// 장바구니 페이지로 이동함
	@GetMapping("/cart")
	
	public void toList(Model model) throws Exception {
		log.info(">>>> 장바구니");
	}

	// 주문 결제 페이지로 이동함
	@PostMapping("/checkout")
	@PreAuthorize("isAuthenticated()")
	public void toCheckout(@RequestParam("items") List<String> items, @AuthenticationPrincipal MemberVO member,
			Model model) {
		log.info(">>>> 주문/결제 페이지");
		String userId = member.getUserId();
		List<CartDTO> cl = new ArrayList<CartDTO>();
		int sum = 0;
		for (int i = 0; i < items.size(); i++) {
			cl.add(new CartDTO(userId, items.get(i)));
		}
		List<CartDTO> goods = cartService.checkoutGoods(cl);
		for(int i = 0; i < goods.size(); i++) {
			sum += goods.get(i).getTotalPrice();
		}
		model.addAttribute("goods", goods);
		model.addAttribute("member", member);
		model.addAttribute("sum", sum);
	}

	// 결제 완료 페이지로 이동함
	@PostMapping("/completed")
	@PreAuthorize("isAuthenticated()")
	public void toCompleted(@RequestParam("items") List<String> items,
			@AuthenticationPrincipal MemberVO member, Model model) {
		log.info(">>>> 주문 완료 페이지");
		String userId = member.getUserId();
		Date now = new Date();
		Long orderId = now.getTime();
		List<OrderVO> ol = new ArrayList<OrderVO>();
		List<CartDTO> cl = new ArrayList<CartDTO>();
		log.info("유저: " + userId);
		log.info("주문 번호:" + orderId);
		for (int i = 0; i < items.size(); i++) {
			cl.add(new CartDTO(userId, items.get(i)));
		}
		cl = cartService.checkoutGoods(cl);		// 장바구니에서 결제처리할 상품을 가져옴
		cl.forEach(item -> ol.add(new OrderVO(orderId, userId, item.getGoodsNo(), item.getAmount(),
				item.getUnitPrice(), item.getTotalPrice())));
		

		orderService.orderGoods(ol); // 장바구니 -> 주문내역으로 정보 복사
		log.info(cl);
		orderService.deleteOrderedGoods(cl); // 복사된 정보 삭제 처리
		model.addAttribute("goods", cl);
		int sum = 0;
		for(int i = 0; i < cl.size(); i++) {
			sum += cl.get(i).getTotalPrice();
		}
		model.addAttribute("order", orderService.getDetail(orderId));		// 뷰에 띄울 주문 내역 정보
		model.addAttribute("sum", sum);
		log.info(">>>> 주문 완료");
	}

	// 주문 조회 페이지로 이동함
	@GetMapping("/history")
	@PreAuthorize("isAuthenticated()")
	public void toOrderHistory(@AuthenticationPrincipal Principal principal, Model model) {
		log.info(">>>> 주문 내역 페이지");
		String userId = principal.getName();
		model.addAttribute("order", orderService.gethistory(userId));
		log.info("아이디: " + userId);
	}

	// 주문 상세 페이지로 이동함
	@GetMapping("/detail")
	@PreAuthorize("isAuthenticated()")
	public void toDetail(@RequestParam("orderId") Long orderId, @AuthenticationPrincipal MemberVO member, Model model) {
		log.info(">>>> 주문 내역 상세 페이지");
		log.info(">>>>>>>> 주문 번호: " + orderId);
		log.info("주문 내역: " +  orderService.getDetail(orderId));
		List<OrderVO> order = orderService.getDetail(orderId);
		int sum = 0;
		for(int i = 0; i < order.size(); i++) {
			sum += order.get(i).getTotalPrice();
		}
		model.addAttribute("order", order);
		model.addAttribute("sum", sum);
	}

}
