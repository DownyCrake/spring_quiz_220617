package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@Controller
@RequestMapping("/lesson05/quiz06")
public class Lesson05Quiz05Controller {

	@Autowired
	private StoreBO storeBO;
	@RequestMapping("store_list")
	public String store_list_view(Model model) {
		List<Store> storeList = new ArrayList<>();
		storeList = storeBO.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "lesson05/StoreListView";
	}
}
