package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	
	
	@RequestMapping("/main_view")
	public String mainView() {
		
		return "lesson06/bookMain";
	}
}
