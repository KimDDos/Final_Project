package com.four.www.admin.repository;

import java.util.List;

import com.four.www.admin.domain.NoticeVO;


public interface NoticeDAO {

	int register(NoticeVO nvo);

	List<NoticeVO> getList();

	Object getdetail(int nvo);

	int modify(NoticeVO nvo);

	void remove(int nvo);

}
