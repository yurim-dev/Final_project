package org.final_proj.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.final_proj.domain.AdminVO;
import org.final_proj.domain.AuthVO;
import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;
import org.final_proj.domain.deOrderVO;
import org.final_proj.service.AdminService;
import org.final_proj.service.MemberService;
import org.final_proj.service.UserMailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class SecuController {

	private MemberService service;

	@Autowired
	private UserMailSendService mailsender;

	@Autowired
	private AdminService adminservice;

	// sign up=================================================================
	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		log.info("get register.........");
	}

	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String postRegister(@Valid @ModelAttribute("signup") MemberVO vo, AuthVO auth, Error errors)
			throws Exception {
		log.info("post register...........");
		int result = service.idCheck(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				List<AuthVO> authList = new ArrayList<AuthVO>();
				vo.setAuthList(authList);
				authList.add(auth);
				log.info("vo :" + vo);
				log.info("auth :" + auth);
				service.register(vo, auth);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/member/registersuccess";
	}

	@RequestMapping(value = "/member/registersuccess", method = RequestMethod.GET)
	public void doregister() throws Exception {
		log.info("register success");
	}

	// login&out=================================================================
	@GetMapping("/secu/login")
	public void loginInput(Model model, String error, String logout) {
		log.info("login page!");
		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "로그인 실패");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃 완료");
		}

	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public void dologout() {
		log.info("logout page........");

	}

	// find=================================================================
	
	@RequestMapping(value = "/member/findid", method = RequestMethod.GET)
	public void dofindId() {
		log.info("Find Id Page......");
	}

	//
	@RequestMapping(value = "/member/findidresult", method = RequestMethod.GET)
	public void findIdresultGeg() {
		log.info("Find Id result Get Page......");
	}

	@RequestMapping(value = "/member/findidresult", method = RequestMethod.POST)
	public String findIdResult(@RequestParam("findName") String findname, @RequestParam("findMail") String findmail, Model model) {
		log.info("Find Id Result");

		String result = service.findid(findname, findmail);
		model.addAttribute("findId", result);

		return "/member/findidresult";

	}

	@RequestMapping(value = "/member/findpwd", method = RequestMethod.POST)
	public String findpwdPost(@RequestParam("findId") String findid, @RequestParam("findName") String findname,@RequestParam("findMail") String findmail, String key) {
		log.info("Find Pwd Page......");
		//mailsender.findPwd(findid, findname, findmail, request);
		mailsender.findPwd(findid, findname, findmail, key);
		
		log.info("mailSend 완료");
		
		return "redirect:/member/sendmail";

	}

	@RequestMapping(value = "/member/sendmail", method = RequestMethod.GET)
	public void pwdSendmail() {
		log.info("send mail......");
	}

	@RequestMapping(value = "/member/findpwd", method = RequestMethod.GET)
	public void postFindPwd() {
		log.info("Find Pwd Page......");
	}

	// check=================================================================
	@RequestMapping(value = "/member/idcheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int idCheck(MemberVO vo) throws Exception {
		int result = service.idCheck(vo);
		return result;
	}

	@RequestMapping(value = "/member/pwdcheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int pwdcheck(MemberVO vo) throws Exception {
		int result = service.pwdCheck(vo);
		return result;
	}

	// update=================================================================

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public void myPageget(Model model, Authentication auth) throws Exception {
		log.info("my info get........");
		String userId = auth.getName();

		model.addAttribute("member", service.login(userId));
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/member/mypage", method = RequestMethod.POST)
	public String myPagepost(@ModelAttribute MemberVO vo) throws Exception {
		log.info("my info post........");
		service.updatemyinfo(vo);
//		ResponseEntity<String> result = null;
//		
//		result = new ResponseEntity<String>("success",HttpStatus.OK);
//		return result; 

		return "redirect:/member/updatesuccess";
	}

	@RequestMapping(value = "/member/updatesuccess", method = RequestMethod.GET)
	public void mypageSuccess() throws Exception {
		log.info("update member info success");
	}

	// =================================================================
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/member/outmember", method = RequestMethod.GET)
	public void outMemberGet() throws Exception {
		log.info("outmemberGet.....");
	}

	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/member/outmember", method = RequestMethod.POST)
	public ResponseEntity<String> outMemberpost(MemberVO vo, AuthVO auth, CartDTO dto, deOrderVO order, Authentication authen, HttpSession session)
			throws Exception {
		log.info("outmemberPost.....");

		ResponseEntity<String> result = null;
		service.deleteorder(order);
		service.deletecart(dto);
		service.deleteauth(auth);
		service.deletemember(vo);

		session.invalidate();

		result = new ResponseEntity<String>("success", HttpStatus.OK);
		return result;

	}

	// ADMIN=================================================================
	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/admin/allmember", method = RequestMethod.GET)
	public ModelAndView allmemberGet() throws Exception {
		log.info("member List Get");

		List<MemberVO> list = adminservice.allmember();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/allmember");// 뷰 설정
		mav.addObject("memberlist", list);// data 저장
		return mav;

	}

	@Secured({ "ROLE_ADMIN" })
	@RequestMapping(value = "/admin/orderlist", method = RequestMethod.GET)
	public ModelAndView orderlistGet() throws Exception {
		log.info("orderlist Get");

		List<AdminVO> orderlist = adminservice.orderlist();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/orderlist");
		mav.addObject("orderlist", orderlist);
		log.info("controller: " + mav);
		return mav;

	}

	// =================================================================
	@GetMapping("/accessError")
	public void doerror(Authentication auth, Model model) {
		log.info("error page!");
		log.info("access Denied: " + auth);
		model.addAttribute("msg", "Access Denied");
	}


}
