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
//		    User_serial_no int(15),
//		    rno INT AUTO_INCREMENT,
//		    trainer_no INT,
//		    r_regdate varchar(20),
//		    r_time varchar(20), 
//		    r_pw VARCHAR(300),
//		    r_content TEXT,
//		    PRIMARY KEY (rno),
//		    FOREIGN KEY (User_serial_no) REFERENCES mbr_user(User_serial_no)
//		);
	
	private int userSerialNo;
	private int rno;
	private int trainerNo;
	private String phoneNum;	
	private String trainerPhoneNum;
	private String rvRegdate;
	private String rvTime;
	private String rvContent;
	private String rvTitle;
	private String rvAddress;
	private String rvReservdate;
	private String rvStatus;
	private String rvPurchased;
	private String rvSuggestPrice;
	private int rvPayment;
	private String userName;
	private String trainerName;
	private String tid;
	private String rvCategory;
	private int rvUsedCouponNo;
	
}
