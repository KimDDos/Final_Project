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
	private int userSerialNo;
	private int cpNum;
	private String cpTitle;
	private int cpValue;
	private LocalDateTime cpReceivedate;
	private LocalDateTime cpLimitdate;

}
