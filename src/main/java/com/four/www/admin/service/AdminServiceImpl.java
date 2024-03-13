package com.four.www.admin.service;

import org.springframework.stereotype.Service;

import com.four.www.admin.repository.AdminDAO;
import com.four.www.user.domain.CouponVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service 
@Slf4j
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

	private final AdminDAO adao;

	@Override
	public int registerCoupon(CouponVO cvo) {
		return adao.registerCoupon(cvo);
	}
}
