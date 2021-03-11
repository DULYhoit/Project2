package kr.or.eutchapedia.mypage.service;


import java.util.List;
import java.util.Map;

import kr.or.eutchapedia.mypage.entity.LeaveMemberVo;
import kr.or.eutchapedia.mypage.entity.MemberVo;
import kr.or.eutchapedia.mypage.entity.StarRatingForMainVo;
import kr.or.eutchapedia.mypage.entity.WannaWatchVo;


public interface MypageService {

	int withdrawdo(MemberVo vo, LeaveMemberVo vo2);

	void signupdo(MemberVo vo);
	
	List<WannaWatchVo> wannawatch(String memberemail);

	List<StarRatingForMainVo> getratinginfo(String memberemail);

	MemberVo getMemberinfo(String memberemail);

	Map<String, Object> getmostRatedStar(String memberemail);

	List<Map<String, Object>> getStarNum(String memberemail);

	List<Map<String, Object>> getdoughnutNum(String memberemail);


	List<Map<String, Object>> getStarNumDesc(String memberemail);

	MemberVo getMemberInfo(String memberemail);

	void editprofile(MemberVo vo);

	int nicknamechk(String memberNickname);
	
	
	//보고싶어요sort
	List<WannaWatchVo> wannawatch1(String memberemail);

	List<WannaWatchVo> wannawatch2(String memberemail);

	List<WannaWatchVo> wannawatch3(String memberemail);

	List<WannaWatchVo> wannawatch4(String memberemail);
	
	//평가한작품sort

	List<StarRatingForMainVo> getratinginfo1(String memberemail);

	List<StarRatingForMainVo> getratinginfo2(String memberemail);

	List<StarRatingForMainVo> getratinginfo3(String memberemail);

	List<StarRatingForMainVo> getratinginfo4(String memberemail);
	

	List<StarRatingForMainVo> getSearchResult(String memberemail, String findstr);

	List<WannaWatchVo> getWWSearchResult(String memberemail, String findstr);


}