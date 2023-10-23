package com.quiz.booking;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.BookingVO;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// 3. 예약 확인하기
	
	@GetMapping("/check-booking")
	public String checkBooking() {
		return "booking/checkBooking";
	}
	
	@ResponseBody
	@PostMapping("/confirm-booking")
	public Map<String, Object> confirmBooking(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			){
		
		Map<String, Object> result = new HashMap<>();
		BookingVO bookingVO = bookingBO.existBooking(name, phoneNumber);
		
		result.put("code", 200);
		result.put("check_exist", false);
		
		if (bookingVO != null) {
			result.put("check_exist", true);
			result.put("name", bookingVO.getName());
			result.put("date", bookingVO.getDate());
			result.put("day", bookingVO.getDay());
			result.put("headcount", bookingVO.getHeadcount());
			result.put("state", bookingVO.getState());
		}
		
		return result;
	}
	
	
	// 2. 예약 하기
	@GetMapping("/add-booking-view")
	public String addBookingView() {
		
		return "booking/addBooking";
	}
	
//	@ResponseBody
	@GetMapping("/booking-list-view")
	public String bookingList(Model model) {
		
		List<BookingVO> bookingList = new ArrayList<>();
		bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "booking/bookingList";
	}
	
	@ResponseBody
	@PostMapping("/add-booking")
	public Map<String, Object> addBooking(
			@ModelAttribute BookingVO bookingVO
			){
		
		Map<String, Object> result = new HashMap<>();
		bookingVO.setState("대기중");
		int count = bookingBO.addBooking(bookingVO);
		boolean addSuccess = false;
		
		if (count > 0) {
			addSuccess = true;
		}
		
		result.put("code", 200);
		result.put("add_Success", addSuccess);
		
		return result;
	}
	
	
	// 1. 예약 리스트 확인 및 삭제

	@ResponseBody
	@PostMapping("/del-booking")
	public Map<String, Object> delBooking(
			@RequestParam("id") int id
			){
		
		Map<String, Object> result = new HashMap<>();

		int count = bookingBO.delBooking(id);
		
		boolean delSuccess = false;
		
		if (count > 0) {
			delSuccess = true;
		}
		
		result.put("code", 200);
		result.put("del_Success", delSuccess);
		
		return result;
	}

}
