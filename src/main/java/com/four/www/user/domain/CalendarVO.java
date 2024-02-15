package com.four.www.user.domain;

import java.time.LocalDateTime;

import com.google.api.client.util.DateTime;

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
public class CalendarVO {
	private int CalScheduleNumber; // 스케줄 번호
	private LocalDateTime CalScheduleStartTime; //스케줄 시작시간
	private LocalDateTime CalScheduleEndTime; // 스케줄 끝시간
	private String CalScheduleTitle; //달력에 짧게 표시할 스케줄 제목
	private String CalScheduleDetail; //스케줄 상세 내용
	private String UserSerialNo; // 유저 시리얼 넘버.
	private String TrainerSerialNo; // 트레이너 시리얼 넘버.
}
