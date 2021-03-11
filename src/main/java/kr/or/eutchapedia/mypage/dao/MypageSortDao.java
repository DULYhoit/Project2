package kr.or.eutchapedia.mypage.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import kr.or.eutchapedia.mypage.entity.StarRatingForMainVo;
import kr.or.eutchapedia.mypage.entity.WannaWatchVo;

@Repository
@Mapper
public interface MypageSortDao {

	
	//보고싶어요sort
	public List<WannaWatchVo> selectwwsort1(String memberemail);
	public List<WannaWatchVo> selectwwsort2(String memberemail);
	public List<WannaWatchVo> selectwwsort3(String memberemail);
	public List<WannaWatchVo> selectwwsort4(String memberemail);
	
	//평가한작품sort
	public List<StarRatingForMainVo> selectRMsort1(String memberemail);
	public List<StarRatingForMainVo> selectRMsort2(String memberemail);
	public List<StarRatingForMainVo> selectRMsort3(String memberemail);
	public List<StarRatingForMainVo> selectRMsort4(String memberemail);
	
	public List<WannaWatchVo> selectwwSearch(@Param("memberemail")String memberemail, @Param("findstr") String findstr);
	
	

}
