package com.four.www.reservation.service;

import org.springframework.stereotype.Service;

import com.four.www.reservation.repository.ReservationDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService {
	private final ReservationDAO rdao;

}
