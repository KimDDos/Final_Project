package com.four.www.user.service;

import java.util.List;

import com.four.www.user.domain.CouponVO;

public interface CouponService {

	List<CouponVO> getCouponList(int userNo);

	CouponVO getCoupon(int cpNum);

	int delCoupon(int cno);

}
