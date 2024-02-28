package com.four.www.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.four.www.reservation.domain.ReservationVO;
import com.four.www.reservation.repository.ReservationDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService {
	private final ReservationDAO rdao;

	@Override
	public int register(ReservationVO rvo) {
		int isOk=rdao.register(rvo);
		return isOk;
	}

	@Override
	public List<ReservationVO> getReserve(int userNo) {
		return rdao.getReserve(userNo);
	}

}
