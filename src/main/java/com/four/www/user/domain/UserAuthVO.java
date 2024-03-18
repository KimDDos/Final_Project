package com.four.www.user.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserAuthVO {
	
	private int userSerialNo;
	private String userAccessToken;
	private String userRole;
	
}
