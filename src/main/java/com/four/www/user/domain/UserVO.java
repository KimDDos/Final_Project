package com.four.www.user.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private int userSerialNo;
	private String userName;
	private String userNickName;
	private String userLoginType;
}
