package com.quiz.lesson06.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.domain.BookmarkVO;
import com.quiz.lesson06.mapper.BookmarkMapper;

@Service
public class BookmarkBO {
	@Autowired
	private BookmarkMapper bookmarkMapper;
	
	public int addBookmark(BookmarkVO bookmarkVO) {
		return bookmarkMapper.insertBookmark(bookmarkVO);
	}
	
	public BookmarkVO getBookmarkById(int id) {
		return bookmarkMapper.selectBookmarkById(id);
	}
	
	public List<BookmarkVO> getBookmarkList() {
		return bookmarkMapper.selectBookmarkList();
	}
	
	public boolean exitBookmarkByUrl(String url) {
		return bookmarkMapper.exitBookmarkByUrl(url);
	}
	
	public int delBookmarkById(int id) {
		return bookmarkMapper.deleteBookmarkById(id);
	}

}
