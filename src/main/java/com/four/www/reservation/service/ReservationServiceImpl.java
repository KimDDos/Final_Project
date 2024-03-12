package com.four.www.reservation.service;

import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Service;

import com.four.www.admin.domain.PagingVO;
import com.four.www.reservation.domain.ReservationVO;
import com.four.www.reservation.repository.ReservationDAO;
import com.four.www.user.domain.AlarmVO;

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
		int isOk = rdao.submitReserv(rvo);
		AlarmVO avo = new AlarmVO();
		
		avo.setUserSerialNo(rvo.getUserSerialNo());
		avo.setContent(rvo.getRvReservdate()+ " "+ rvo.getRvTime() + " 에 신청하신 상담 예약이 접수 완료되었습니다!");
		avo.setAlarmType("예약");
		avo.setRno(rvo.getRno());
		isOk *= rdao.sendAlarm(avo);
		return isOk;
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

	@Override
	public int setTid(ReservationVO rvo) {
		return rdao.setTid(rvo);
	}

}
