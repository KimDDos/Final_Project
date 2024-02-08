package com.four.www.user.oauth;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class authVO {
	
	private String userSerialNo;
	private String userAccessToken;
	private String userRole;
	
}
