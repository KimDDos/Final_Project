package com.four.www.main.repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SearchDTO{
	private String title;
	private String address;
	private String link;
	private double mapx;
	private double mapy;
}
