package com.four.www.reservation.service;

import org.springframework.stereotype.Service;

import com.four.www.reservation.domain.PurposeVO;
import com.four.www.reservation.repository.PurposeDAO;
import com.four.www.reservation.repository.ReservationDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PurposeServiceImpl implements PurposeService {
	private final PurposeDAO pdao;
	
	@Override
	public int register(PurposeVO pvo) {
		int isOk=pdao.register(pvo);
		return isOk;
	}

}
