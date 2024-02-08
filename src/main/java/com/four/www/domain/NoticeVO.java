package com.four.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class NoticeVO {

	private int noticeNo;
	private String noticeTitle;
	private String noticecontent;
	private String noticeReadCount;
	private String noticeRegDate;
}
