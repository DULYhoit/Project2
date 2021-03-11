package kr.or.eutchapedia.movie.rate.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.movie.rate.dao.MovierateDao;
import kr.or.eutchapedia.movie.rate.entity.MovierateVo;
@Service
public class MovierateServiceINP implements MovierateService {
	@Autowired
	private MovierateDao dao; 

	@Override	
	public List<MovierateVo> getMovieListsS(String email , String genre ) {	
		List<MovierateVo> movies = dao.getMovieListsS(email , genre);	

		return movies;	
	}
	
	@Override //목록출력
	public List<MovierateVo> getmovierateList(String email, String genre ) {
		List<MovierateVo> movielist = dao.getmovierateList(email, genre );
		
		return movielist;
	}

	@Override
	public List<MovierateVo> getMovieLists(Map<String, Object> param) {
		List<MovierateVo> getmovielists= dao.getMovieLists(param);
		return getmovielists;
	}
	
	
	 
}
