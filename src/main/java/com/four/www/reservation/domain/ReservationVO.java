package com.four.www.reservation.domain;

import java.time.LocalDateTime;

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
public class ReservationVO {
//	CREATE TABLE reservation (
//		    User_serial_no VARCHAR(15),
//		    rno INT AUTO_INCREMENT,
//		    trainer_no INT,
//		    r_regdate varchar(20),
//		    r_time varchar(20), 
//		    r_pw VARCHAR(300),
//		    r_content TEXT,
//		    PRIMARY KEY (rno),
//		    FOREIGN KEY (User_serial_no) REFERENCES mbr_user(User_serial_no)
//		);
	
	private String userSerialNo;
	private int rno;
	private int trainerNo;
	private String rvRegdate;
	private String rvTime;
	private String rvPw;
	private String rvContent;
	
}
