package com.four.www.user.repository;

import java.util.List;

import com.four.www.user.domain.CouponVO;

public interface CouponDAO {

	List<CouponVO> getCouponList(int userNo);

	CouponVO getCoupon(int cpNum);

	int delCoupon(int cno);

}
