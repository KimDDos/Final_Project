package com.four.www.service;

import java.util.List;

import com.four.www.domain.NoticeVO;

public interface NoticeBoardService {

	int register(NoticeVO nvo);

	List<NoticeVO> getList();

	Object getdetail(int nvo);

	int modify(NoticeVO nvo);

	void remove(int nvo);

}
