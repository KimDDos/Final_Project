package com.four.www.repository;

import java.util.List;

import com.four.www.domain.NoticeVO;


public interface NoticeDAO {

	int register(NoticeVO nvo);

	List<NoticeVO> getList();

	Object getdetail(int nvo);

	int modify(NoticeVO nvo);

	void remove(int nvo);

}
