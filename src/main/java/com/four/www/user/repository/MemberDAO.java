package com.four.www.user.repository;

import java.util.List;

import com.four.www.user.domain.UserAuthVO;
import com.four.www.user.domain.AlarmVO;
import com.four.www.user.domain.MemberDTO;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.domain.UserVO;

public interface MemberDAO {

	int selectUserEmailAndPwd(MemberVO mvo);

	int register(MemberVO mvo);

	int selectUserCount();

	String selectUserInfo(String userEmail);

	MemberVO selectMemberInfo(String userEmail);

	List<UserAuthVO> selectAuths(int username);

	Object selectSocialUser(MemberDTO mdto);

	MemberVO getSocialMbr(MemberVO mvo);

	int regUser(UserVO uvo);
	
	UserVO selectUser(int userSerialNo);

	void updateLoginDate(int userSerialNo);
	
	MemberVO getUserDetail (String userEmail);
	
	MemberVO getUserDetailS (int userSerialNo);

	List<MemberVO> getList(MemberVO mvo);

	void authRegister(int userSerialNo);

	void userRegister(UserVO newUvo);

	int memberModify(MemberVO mvo);
	
	int memberUserVOModify(MemberVO mvo);

	int deleteMember(int userSerialNo);

	int deleteMemberAuth(int userSerialNo);

	int deleteMemberUser(int userSerialNo);

	MemberVO userDetailS(int userSerialNo);

	int isDupleEmail(String userEmail);

	List<AlarmVO> getAlarmList(int userSerialNo);

	int checkAlarm(int ano);

}
