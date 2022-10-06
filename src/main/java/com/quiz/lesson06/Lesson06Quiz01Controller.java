package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@Controller
@RequestMapping("/lesson06/quiz01")
public class Lesson06Quiz01Controller {

	@Autowired
	private FavoriteBO favoriteBO;
	
	@RequestMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	@PostMapping("/add_favorite")
	@ResponseBody
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		favoriteBO.addFavorite(name, url);
		return "success";
	}
	
	@RequestMapping("/favorite_list_view")
	public String getFavoriteView(Model model) {
		List<Favorite> favorites = new ArrayList<>();
		favorites = favoriteBO.getFavorite();
		
		model.addAttribute("favorites", favorites);
		
		return "lesson06/favoriteList";
	}
	
	@ResponseBody
	@RequestMapping("url_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url
			){
		Map<String, Boolean> result = new HashMap<>();
		Boolean isDuplication = favoriteBO.existFavoriteByUrl(url);
		result.put("dupl", isDuplication);
		return result;
	}
	
}
