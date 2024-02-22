package com.four.www.admin.repository;

import java.util.List;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;


public interface NoticeDAO {

	int register(NoticeVO nvo);

	List<NoticeVO> getList(PagingVO pgvo);

	Object getdetail(int nvo);

	int modify(NoticeVO nvo);

	void remove(int nvo);

	int getTotalCount(PagingVO pgvo);

	List<NoticeVO> getadminList(PagingVO pgvo);

}
