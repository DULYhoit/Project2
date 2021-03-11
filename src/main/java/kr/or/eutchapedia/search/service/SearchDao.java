package kr.or.eutchapedia.search.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.search.domain.SearchMemberVo;
import kr.or.eutchapedia.search.domain.SearchMovieVo;
import kr.or.eutchapedia.search.repository.SearchMapper;

@Service
@Transactional
public class SearchDao {

	@Autowired
	SearchMapper mapper;

	public List<SearchMovieVo> selectTopResult(String findStr) {
		List<SearchMovieVo> searchMovieList = new ArrayList<>();

		try { 
			searchMovieList = mapper.selectTopResult(findStr);
			
			for (SearchMovieVo vo : searchMovieList) {
				vo.setProdYear(vo.getProdYear().substring(0, 4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return searchMovieList;
	}
	
	public List<SearchMovieVo> selectMovieResult(String findStr) {
		List<SearchMovieVo> searchMovieList = new ArrayList<>();

		try { 
			searchMovieList = mapper.selectMovieResult(findStr);
			

			for (SearchMovieVo vo : searchMovieList) {
				vo.setProdYear(vo.getProdYear().substring(0, 4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return searchMovieList;
	}
	
	public List<SearchMemberVo> selectMemberResult(String findStr) {
		List<SearchMemberVo> searchMemberList = new ArrayList<>();
		
		try {
			searchMemberList = mapper.selectMemberResult(findStr); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return searchMemberList;
	}
	


}
