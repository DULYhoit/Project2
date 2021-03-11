package kr.or.eutchapedia.movie.detail.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.detail.domain.WannaWatchVo;

@Repository
@Mapper
public interface WannaWatchMapper {
	public int selectWannaWatch(WannaWatchVo wannaWatchVo);
	public int addToWannaWatch(WannaWatchVo wannaWatchVo);
	public int removeWannaWatch(WannaWatchVo wannaWatchVo);
}
