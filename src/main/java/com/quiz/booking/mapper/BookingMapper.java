package com.quiz.booking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.booking.domain.BookingVO;

@Repository
public interface BookingMapper {
	
	public List<BookingVO> selectBookingList();
	
	public int insertBooking(BookingVO bookingVO);
	
	public int deleteBooking(int id);
	
	public BookingVO existBooking(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);

}
