package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public void addFavorite(
			String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}	
	
	public List<Favorite> getFavorite() {
		return favoriteDAO.selectFavorite();
	}
	
	public boolean existFavoriteByUrl(String url) {
		return favoriteDAO.existFavoriteByUrl(url);
	}
	
	public int deleteFavorite(int id) {
		return favoriteDAO.deleteFavorite(id);
	}
}
