package com.four.www.reservation.repository;

import java.util.Collection;
import java.util.List;

import com.four.www.admin.domain.PagingVO;
import com.four.www.reservation.domain.ReservationVO;
import com.four.www.user.domain.AlarmVO;

public interface ReservationDAO {

	int register(ReservationVO rvo);

	List<ReservationVO> getReserve(int userNo);

	List<ReservationVO> getrsvList(PagingVO pgvo);

	int getTotalCount(PagingVO pgvo);

	ReservationVO getReserveOne(int rno);

	int submitReserv(ReservationVO rvo);

	int cancelReserv(int rno);

	Collection<? extends ReservationVO> getPTorder(int userNo);

	int sendAlarm(AlarmVO avo);

}
