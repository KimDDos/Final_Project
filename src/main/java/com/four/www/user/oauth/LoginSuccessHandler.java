package com.four.www.user.oauth;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.four.www.user.domain.AlarmVO;
import com.four.www.user.service.MemberService;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@Component
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private String authEmail;
	private String authUrl;

	// redirect 데이터를 가지고 리다이렉트
	private RedirectStrategy rdstg = new DefaultRedirectStrategy();

	// 실제 로그인 정보, 경로 등을 저장
	private RequestCache reqCache = new HttpSessionRequestCache();

	@Inject
	private MemberService msv;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("SUCCCCCCCCCCCCCCCCCCESSSSSSSSSSSSSS");
		// authentication은 인증된 AuthMember의 객체
		setAuthEmail(authentication.getName());
		setAuthUrl("/");

		boolean isOk = msv.updateLastLogin(getAuthEmail());

		HttpSession ses = request.getSession();

		if (!isOk || ses == null) {
			return;
		} else {
			ses.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		SavedRequest saveReq = reqCache.getRequest(request, response);
		rdstg.sendRedirect(request, response, (saveReq != null ? saveReq.getRedirectUrl() : getAuthUrl()));

	}

}
