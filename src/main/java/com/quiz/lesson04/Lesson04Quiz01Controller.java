package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@GetMapping(path = "/add_seller_view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@Autowired
	private SellerBO sellerBO;
	
	@PostMapping(path = "/add_seller")
	public String addSeller(
			@RequestParam(value = "nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam(value = "temperature") double temperature
			) {
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/afterAddSeller";
	}
	
	@GetMapping(path = "/seller_info")
	public String sellerInfo(Model model,
			@RequestParam(value="id", required=false) Integer id) {
		
		Seller seller = sellerBO.getSeller(id);
		
		model.addAttribute("result",seller);
		
		return "lesson04/sellerInfo";
	}
}
