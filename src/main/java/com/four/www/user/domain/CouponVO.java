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
@NoArgsConstructor
@AllArgsConstructor
public class CouponVO {
	private String a;
	private int UserSerialNo;
	private int CpNum;
	private String CpTitle;
	private int CpValue;
	private String CpScheduleDetail;
	private LocalDateTime CpReceivedate;
	private LocalDateTime CpLimitdate;

}
