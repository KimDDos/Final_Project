package com.four.www.reservation.service;

import java.util.List;

import com.four.www.reservation.domain.ReservationVO;

public interface ReservationService {

	int register(ReservationVO rvo);

	List<ReservationVO> getReserve(int userNo);


}
