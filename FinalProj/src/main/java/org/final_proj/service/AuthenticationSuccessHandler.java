package org.final_proj.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthenticationSuccessHandler
		implements org.springframework.security.web.authentication.AuthenticationSuccessHandler {
		
		private RequestCache requestCache = new HttpSessionRequestCache();
		private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
		private String loginidname;
		private String defaultUrl;
		
		
		public String getLoginidname() {
			return loginidname;
		}

		public void setLoginidname(String loginidname) {
			this.loginidname = loginidname;
		}

		public String getDefaultUrl() {
			return defaultUrl;
		}

		public void setDefaultUrl(String defaultUrl) {
			this.defaultUrl = defaultUrl;
		}


	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("Login success");
		
//		List<String> roleNames= new ArrayList<>();
//		authentication.getAuthorities().forEach(authority->{
//			roleNames.add(authority.getAuthority());
//		});
//		log.warn("Role names: "+roleNames);
//		if(roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/admin/admin");
//			return;
//		}
//		if(roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/index");
//			return;
//		}
			
		
		resultRedirectStrategy(request, response, authentication);
		
	}

	private void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {
		
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		}else {
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}
		
	}
	
	

}
