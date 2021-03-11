package kr.or.eutchapedia.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.mypage.entity.LeaveMemberVo;
import kr.or.eutchapedia.mypage.entity.MemberVo;
import kr.or.eutchapedia.mypage.entity.MemberVoTemp;
import kr.or.eutchapedia.mypage.entity.StarRatingForMainVo;
import kr.or.eutchapedia.mypage.entity.WannaWatchVo;

@Repository
@Mapper
public interface MypageDao {
	// 탈퇴zone
	public MemberVoTemp passchk(MemberVo vo);

	public void insertleavemember(LeaveMemberVo vo2);

	public void updatestatus(MemberVo vo);

	// 회원가입
	public void insertmember(MemberVo vo);

	// 보고싶어요한 영화 select
	public List<WannaWatchVo> selectwannawatch(String memberemail);

	// 마이페이지 회원정보 select
	public MemberVo getMemberinfo(String memberemail);

	// 메인 평가한작품 & 취향분석 관련
	public List<StarRatingForMainVo> getratinginfo(String memberemail);

	// 가장많이평가한별
	public Map<String, Object> selectmostRatedStar(String memberemail);

	// 별점별로 개수구하기
	public List<Map<String, Object>> selectStarNum(String memberemail);

	// 장르별 건수
	public List<Map<String, Object>> selectDoughnutNum(String memberemail);

	public List<StarRatingForMainVo> getratinginfodesc(String memberemail);

	public List<Map<String, Object>> selectStarNumDesc(String memberemail);

	public MemberVo selectMember(String memberemail);

	public void updatememberinfo(MemberVo vo);

	public int nicknamechk(String memberNickname);

	public List<StarRatingForMainVo> selectSearchMovies(@Param("memberemail") String memberemail, @Param("findstr") String findstr);


}