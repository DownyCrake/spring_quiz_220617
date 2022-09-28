package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@RequestMapping("/1")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}

	@Autowired
	private RealtorBO realtorBO;

	@RequestMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor, 
			Model model) {

		//insert
		realtorBO.addRealtor(realtor);
		
		//select
		Realtor realtorInfo = realtorBO.getRealtor(realtor.getId());
		
		//model
		model.addAttribute("realtor",realtorInfo);
		
		return "lesson04/realtorInfo";
	}

}
