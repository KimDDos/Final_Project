package com.four.www.reservation.service;

import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Service;

import com.four.www.admin.domain.PagingVO;
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

	@Override
	public List<ReservationVO> getrsvList(PagingVO pgvo) {
		return rdao.getrsvList(pgvo);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return rdao.getTotalCount(pgvo);
	}

	@Override
	public ReservationVO getReserveOne(int rno) {
		return rdao.getReserveOne(rno);
	}

	@Override
	public int submitReserv(ReservationVO rvo) {
		return rdao.submitReserv(rvo);
	}
	
	@Override
	public int cancelReserv(int rno) {
		// TODO Auto-generated method stub
		return rdao.cancelReserv(rno);
	}

	@Override
	public Collection<? extends ReservationVO> getPTorder(int userNo) {
		return rdao.getPTorder(userNo);
	}

}
