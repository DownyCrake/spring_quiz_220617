package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookList(){
		return bookingDAO.selectBookingList();
	}
	public Booking getBookListByNameAndPhone(String name, String phoneNumber){
		List<Booking> bookingList = bookingDAO.selectBookListByNameAndPhone(name, phoneNumber);
		if (CollectionUtils.isEmpty(bookingList)) {
			return null;
		}
		
		return bookingList.get(bookingList.size() - 1); // 마지막 인덱스 데이터 가져옴
	}
	
	public void AddBooking(
			String name, Date date, int day, int headcount, String phoneNumber) {
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public void deleteBooking(int id) {
		bookingDAO.deleteBooking(id);
	}
	
}
