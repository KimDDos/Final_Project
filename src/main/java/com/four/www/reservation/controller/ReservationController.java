package com.four.www.reservation.controller;

import java.io.BufferedReader;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.four.www.admin.domain.NoticeVO;
import com.four.www.admin.domain.PagingVO;
import com.four.www.admin.handler.PagingHandler;
import com.four.www.main.repository.SearchDTO;
import com.four.www.reservation.domain.PurposeVO;
import com.four.www.reservation.domain.ReservationVO;
import com.four.www.reservation.service.PurposeService;
import com.four.www.reservation.service.ReservationService;
import com.four.www.user.domain.MemberVO;
import com.four.www.user.oauth.CustomAuthMemberService;
import com.four.www.user.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reservation/**")
@RequiredArgsConstructor
public class ReservationController {

	private final ReservationService rsv;
	private final PurposeService psv;
	private final MemberService msv;
	private final CustomAuthMemberService cms;

	@GetMapping("/gymSelect")
	public void gymSelect() {
		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());
	}

	@GetMapping("/register")
	public String register(@RequestParam(value = "selAddress", required = true) String address,
			@RequestParam(value = "selTitle", required = true) String title, Model m) {
		m.addAttribute("ppAddress", address);
		m.addAttribute("ppTitle", title);

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());

		return "/reservation/register";
	}

	@PostMapping("/register")
	public String register(Model m, ReservationVO rvo, PurposeVO pvo) {

		int reservationResult = rsv.register(rvo);
		int purposeResult = psv.register(pvo);

		m.addAttribute("reservationResult", reservationResult);
		m.addAttribute("purposeResult", purposeResult);

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());

		return "redirect:/reservation/list";
	}

	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
		log.info("PGVO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + pgvo);
		List<ReservationVO> list = rsv.getrsvList(pgvo);
		int totalCount = rsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());

		return "/reservation/reservationList";
	}

	@GetMapping("/purchased")
	public String purchased(@RequestParam("rno") int rno,@RequestParam(value = "pg_token", required = false) String token,
			Model m) {
		ReservationVO Reserv = rsv.getReserveOne(rno);
			try {
				log.info("이거되긴하는거냐고"+token);
				URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
				HttpURLConnection connect = (HttpURLConnection) url.openConnection();
				connect.setRequestProperty("Authorization", "KakaoAK 15c69c060c54d5af410d96587b9f78e8");
				connect.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
				connect.setDoOutput(true);

				String params = "cid=TC0ONETIME" + "&partner_order_id=partner_order_id" + "&partner_user_id=partner_user_id"
				+"&tid="+URLEncoder.encode(Reserv.getTid(), "UTF-8") + "&pg_token="+token;
				OutputStream output = connect.getOutputStream();
				DataOutputStream dataOutput = new DataOutputStream(output);
				dataOutput.writeBytes(params);
				dataOutput.close();
				int res = connect.getResponseCode();

				InputStream input;
				if (res == 200) {
					input = connect.getInputStream();
				} else {
					input = connect.getErrorStream();
				}
				InputStreamReader reader = new InputStreamReader(input);

				BufferedReader caster = new BufferedReader(reader);

				String temp = caster.readLine();
				
				log.info("결제성공했냐????????????" + temp);
			} catch (Exception e) {
				// TODO: handle exception
			}

		m.addAttribute("rvo", Reserv);

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());
		
		return "/reservation/reservationDetail";
	}

	@GetMapping("/detail")
	public String detail(@RequestParam("rno") int rno, Model m) {
		ReservationVO Reserv = rsv.getReserveOne(rno);

		m.addAttribute("rvo", Reserv);

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());

		return "/reservation/reservationDetail";
	}

	@GetMapping("/submit")
	public String submit(ReservationVO rvo, Model m, @RequestParam("userName") String userName,
			@RequestParam("trainerName") String trainerName) {

		MemberVO mvo = new MemberVO();
		mvo = msv.userDetailS(rvo.getTrainerNo());
		rvo.setTrainerName(mvo.getUserName());
		rvo.setTrainerPhoneNum(mvo.getUserPhoneNum());
		log.info("RVO>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + rvo);
		int isOk = rsv.submitReserv(rvo);

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());

		return "redirect:/reservation/detail?rno=" + rvo.getRno();
	}

	@GetMapping("/cancel")
	public String cancel(@RequestParam("rno") int rno, Model m) {

		SecurityContextHolder.getContext().setAuthentication(cms.createNewAuthentication());

		PagingVO pgvo = new PagingVO();

		int isOk = rsv.cancelReserv(rno);
		return "redirect:/reservation/list";
	}

	@RequestMapping("/payment")
	@ResponseBody
	public String payment(@RequestParam("rno") int rno) {
		ReservationVO rvo = rsv.getReserveOne(rno);
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connect = (HttpURLConnection) url.openConnection();
			connect.setRequestMethod("POST");
			connect.setRequestProperty("Authorization", "KakaoAK 15c69c060c54d5af410d96587b9f78e8");
			connect.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			connect.setDoOutput(true);
			String params = "cid=TC0ONETIME" + "&partner_order_id=partner_order_id" + "&partner_user_id=partner_user_id"
					+ "&item_name=" + URLEncoder.encode("득근득근 예약 : " + rvo.getRvTitle(), "UTF-8") + "&quantity=1"
					+ "&total_amount=" + rvo.getRvSuggestPrice() + "&vat_amount=0" + "&tax_free_amount=0"
					+ "&approval_url=http://localhost:8089/reservation/purchased?rno="+rno
					+ "&fail_url=http://localhost:8089/reservation/reservationDetail"
					+ "&cancel_url=http://localhost:8089/reservation/reservationDetail";
			OutputStream output = connect.getOutputStream();
			DataOutputStream dataOutput = new DataOutputStream(output);
			dataOutput.writeBytes(params);
			dataOutput.close();
			int res = connect.getResponseCode();

			InputStream input;
			if (res == 200) {
				input = connect.getInputStream();
			} else {
				input = connect.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(input);

			BufferedReader caster = new BufferedReader(reader);

			String temp = caster.readLine();

			JSONParser parser = new JSONParser();

			Object obj = parser.parse(temp);
			JSONObject jobj = (JSONObject) obj;

			String tid = (String) jobj.get("tid");
			ReservationVO tempRvo = new ReservationVO();

			tempRvo.setRno(rno);
			tempRvo.setTid(tid);

			rsv.setTid(tempRvo);

			return temp;

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}

}
