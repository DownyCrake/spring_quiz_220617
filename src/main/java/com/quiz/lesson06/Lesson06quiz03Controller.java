package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06/quiz03")
@Controller
public class Lesson06quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	
	
	@RequestMapping("list_view")
	public String bookListView(Model model){
		List<Booking> bookList = new ArrayList<>();
		bookList = bookingBO.getBookList();
		model.addAttribute("bookList",bookList);
		return "lesson06/bookList";
	}
	
	@RequestMapping("booking_view")
	public String bookingView() {
		
		return "lesson06/reservation";
	}
	
	@ResponseBody
	@RequestMapping("add_booking")
	public String addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		bookingBO.AddBooking(name, date, day, headcount, phoneNumber);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("delete_booking")
	public String deleteBooking(
			@RequestParam("id") int id) {
		bookingBO.deleteBooking(id);
		return "delete";
	}
	
	
	@ResponseBody
	@RequestMapping("search_booking")
	
//	public Booking selectBookingByNameAndPhone(
	public Map<String, Object> selectBookingByNameAndPhone(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		Booking booking = bookingBO.getBookListByNameAndPhone(name, phoneNumber);
		Map<String, Object> result = new HashMap<>();
		if (booking != null) {
			result.put("code", 100);
			result.put("booking", booking);
		}else {
			result.put("code", 400 ); //데이터 없음
		}
		
		return result;
	}
	
	
	@RequestMapping("/main_view")
	public String mainView() {
		
		return "lesson06/bookMain";
	}
}
