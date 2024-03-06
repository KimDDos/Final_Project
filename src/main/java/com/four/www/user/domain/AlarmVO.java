package com.four.www.user.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AlarmVO {

	private int userSerialNo;
	private String content;
	private String alarmType; // 공지, 쿠폰, 예약(예약 확정,예약일정 끝).
	private int isRead;
	private String regDate;
	private int ano;
	private int rno;
	
}
