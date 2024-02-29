package com.four.www.reservation.repository;

import java.util.List;

import com.four.www.reservation.domain.ReservationVO;

public interface ReservationDAO {

	int register(ReservationVO rvo);

	List<ReservationVO> getReserve(int userNo);

}
