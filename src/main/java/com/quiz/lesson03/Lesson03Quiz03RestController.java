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
			@RequestParam(value="id") int id,
			@RequestParam(value="price") int price,
			@RequestParam(value="type") String type
			) {
		int row = realEstateBO.updateRealEstateById(id, price, type) ; 
		return "수정성공" + row;
	}
}
