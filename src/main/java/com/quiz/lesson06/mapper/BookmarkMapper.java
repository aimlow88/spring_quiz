package com.quiz.lesson06.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.BookmarkVO;

@Repository
public interface BookmarkMapper{
	
	public int insertBookmark(BookmarkVO bookmarkVO);
	
	public BookmarkVO selectBookmarkById(int id);
	
	public List<BookmarkVO> selectBookmarkList();
	
	public boolean exitBookmarkByUrl(String url);
	
	public int deleteBookmarkById(int id);

}
