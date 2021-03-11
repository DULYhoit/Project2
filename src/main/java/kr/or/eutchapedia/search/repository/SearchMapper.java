package kr.or.eutchapedia.search.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.search.domain.SearchMemberVo;
import kr.or.eutchapedia.search.domain.SearchMovieVo;

@Repository
@Mapper
public interface SearchMapper {
	public List<SearchMovieVo> selectTopResult(String findStr);
	public List<SearchMovieVo> selectMovieResult(String findStr);
	public List<SearchMemberVo> selectMemberResult(String findStr);
	
}
