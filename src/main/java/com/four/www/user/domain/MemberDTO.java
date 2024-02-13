package com.four.www.user.domain;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class MemberDTO {
	private MemberVO mvo;
	private UserVO uvo;
}
