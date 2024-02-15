package com.four.www.user.domain;

import java.io.Serializable;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class MemberDTO implements Serializable{
	private MemberVO mvo;
	private UserVO uvo;
}
