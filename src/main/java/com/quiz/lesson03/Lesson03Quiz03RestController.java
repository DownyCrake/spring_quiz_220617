package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz03RestController {

	@Autowired
	private RealEstateBO realEstateBO; 
	
	@RequestMapping("/lesson03/quiz03")
	public String quiz03(
			@RequestParam("id") int id,
			@RequestParam("price") int price,
			@RequestParam("type") String type
			) {
		type = "전세";
		int row = realEstateBO.updateRealEstateById(id, price, type) ; 
		return "수정성공" + row;
	}
}
