package com.four.www.service;

import org.springframework.stereotype.Service;

import com.four.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO bdao;
	

}
