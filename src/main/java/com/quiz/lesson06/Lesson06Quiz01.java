package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.BookmarkVO;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01 {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	@ResponseBody
	@PostMapping("/is-duplication")
	public Map<String, Object> isDuplication(
			@RequestParam("url") String url
			){
		Map<String, Object> result = new HashMap<>();
		boolean isDup = bookmarkBO.exitBookmarkByUrl(url);
		result.put("code", 200);
		result.put("is_Duplication", isDup);
		
		return result;
	}
	
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	@PostMapping("/add-bookmark")
	@ResponseBody
	public String addBookmark(
			@ModelAttribute BookmarkVO bookmarkVO
			, Model model
			) {
		
		int id = bookmarkBO.addBookmark(bookmarkVO);
		
		model.addAttribute("result", bookmarkBO.getBookmarkById(id));

		return "성공";
	}
	
	@GetMapping("/get-bookmark-list")
	public String getLatestBookmark(Model model) {
		
		List<BookmarkVO> getBookmarkList = bookmarkBO.getBookmarkList();
		model.addAttribute("resultList", getBookmarkList);
		
		return "lesson06/getBookmarkList";
	}
	
	@ResponseBody
	@RequestMapping("/delete-bookmark")
	public Map<String, Object> delBookmark(
			@RequestParam("id") int id
			) {
		Map<String, Object> result = new HashMap<>();
		
		boolean delSuccess = false;
		
		if (bookmarkBO.delBookmarkById(id) > 0) {
			delSuccess = true;
		}
		
		result.put("code", 200);
		result.put("del_Success", delSuccess);
		
		return result;
	}

}
