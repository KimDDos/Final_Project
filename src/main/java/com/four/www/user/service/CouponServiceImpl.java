package com.four.www.user.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.four.www.user.domain.CouponVO;
import com.four.www.user.repository.CouponDAO;
import com.four.www.user.repository.MemberDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CouponServiceImpl implements CouponService {
	private final CouponDAO cdao;
	
	@Override
	public List<CouponVO> getCouponList(int userNo) {
		return cdao.getCouponList(userNo);
	}

}
