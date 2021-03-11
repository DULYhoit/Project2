package kr.or.eutchapedia.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.search.domain.SearchMemberVo;
import kr.or.eutchapedia.search.domain.SearchMovieVo;
import kr.or.eutchapedia.search.service.SearchDao;

@RestController
public class SearchController {
	
	@Autowired
	SearchDao searchDao;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(String findStr) {
		
		if (findStr == "") {
			
		}
		ModelAndView mv = new ModelAndView("user/search/searchpage");
		
		List<SearchMovieVo> searchTopList = searchDao.selectTopResult(findStr);
		List<SearchMovieVo> searchMovieList = searchDao.selectMovieResult(findStr);
		List<SearchMemberVo> searchMemberList = searchDao.selectMemberResult(findStr);
		
		
		mv.addObject("searchTopList", searchTopList);
		mv.addObject("searchMovieList", searchMovieList);
		mv.addObject("searchMemberList", searchMemberList);
		
		return mv; 
	}
}
