package kr.or.eutchapedia.movie.rate.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.rate.entity.MovierateVo;
@Repository
@Mapper
public interface MovierateDao {

	List<MovierateVo> getMovieListsS(String email , String genre );
	List<MovierateVo> getmovierateList(String email, String genre );
	List<MovierateVo> getMovieLists(Map<String, Object> param);

}
