package com.quiz.lesson04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	
	@RequestMapping("/1")
	public String addRealtor() {
		return "lesson04/addRealtor";
	}
	
	
}
