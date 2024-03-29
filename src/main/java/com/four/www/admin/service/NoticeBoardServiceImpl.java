package com.four.www.admin.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;
import com.four.www.admin.repository.NoticeDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	private final NoticeDAO ndao;

	@Override
	public int register(NoticeVO nvo) {
		log.info(">>>> nvo >>>>{}", nvo);
		return ndao.register(nvo);
	}

	@Override
	public List<NoticeVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return ndao.getList(pgvo);
	}

	@Override
	public Object getdetail(int nvo) {
		// TODO Auto-generated method stub
		return ndao.getdetail(nvo);
	}

	@Override
	public int modify(NoticeVO nvo) {
		int isOk = ndao.modify(nvo);
		return isOk;
	}

	@Override
	public void remove(int nvo) {
		ndao.remove(nvo);
		
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return ndao.getTotalCount(pgvo);
	}

	@Override
	public List<NoticeVO> getadminList(PagingVO pgvo) {
		return ndao.getadminList(pgvo);
	}

}
