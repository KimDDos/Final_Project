package com.four.www.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PurposeVO {
//	CREATE TABLE purpose(
//		    pno int not null auto_increment,
//		    User_serial_no int,
//		    ptitle varchar(15),
//		    PRIMARY KEY (pno),
//		    FOREIGN KEY (User_serial_no) REFERENCES mbr_user(User_serial_no)
//		);
	private int UserSerialNo;
	private int pno;
	private String ppTitle;

}
