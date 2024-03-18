package com.four.www.main.service;

import org.springframework.stereotype.Service;

import com.four.www.main.repository.MainDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	
	private final MainDAO maindao;

}
