package com.four.www.user.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {

	private String userSerialNo;
	private String userEmail;
	private String userPwd;
	private String userName;
	private String userNickName;
	private String userBirthDate;
	private String userGender;
	private String userPhoneNum;
	private String userAddress;
	private String userItrs;
	private String userRegAt;
	private String userLastLoginDate;
	private String isTrainer;
	
}
