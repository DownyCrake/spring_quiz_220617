package com.quiz.lesson06;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@ResponseBody
	@RequestMapping("/add_favorite")
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
}
