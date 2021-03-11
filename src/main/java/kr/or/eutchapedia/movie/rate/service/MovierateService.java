package kr.or.eutchapedia.movie.rate.service;

import java.util.List;
import java.util.Map;

import kr.or.eutchapedia.login.vo.MemberVo;
import kr.or.eutchapedia.movie.rate.entity.MovierateVo;

public interface MovierateService {

	List<MovierateVo> getMovieLists(Map<String, Object> param);
	List<MovierateVo> getmovierateList(String email, String genre );
	List<MovierateVo> getMovieListsS(String email , String genre );




}
