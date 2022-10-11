package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookList(){
		return bookingDAO.selectBookingList();
	}
	
	public void AddBooking(
			String name, Date date, int day, int headcount, String phoneNumber) {
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public void deleteBooking(int id) {
		bookingDAO.deleteBooking(id);
	}
	
}
