package com.four.www.user.domain;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@RequiredArgsConstructor
public class MemberDTO implements Serializable{
	private MemberVO mvo;
	private UserVO uvo;
	private List<AlarmVO> avo;
}
