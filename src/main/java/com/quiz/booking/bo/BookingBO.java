package com.quiz.booking.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.domain.BookingVO;
import com.quiz.booking.mapper.BookingMapper;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	public List<BookingVO> getBookingList(){
		return bookingMapper.selectBookingList();
	}
	
	public int addBooking(BookingVO bookingVO){
		return bookingMapper.insertBooking(bookingVO);
	}
	
	public int delBooking(int id){
		return bookingMapper.deleteBooking(id);
	}
	
	public BookingVO existBooking(String name, String phoneNumber) {
		return bookingMapper.existBooking(name, phoneNumber);
	}

}
