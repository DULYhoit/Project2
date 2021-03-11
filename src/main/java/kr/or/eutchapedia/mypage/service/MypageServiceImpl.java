package kr.or.eutchapedia.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.mypage.dao.MypageDao;
import kr.or.eutchapedia.mypage.dao.MypageSortDao;
import kr.or.eutchapedia.mypage.entity.LeaveMemberVo;
import kr.or.eutchapedia.mypage.entity.MemberVo;
import kr.or.eutchapedia.mypage.entity.MemberVoTemp;
import kr.or.eutchapedia.mypage.entity.StarRatingForMainVo;
import kr.or.eutchapedia.mypage.entity.WannaWatchVo;
import kr.or.eutchapedia.mypage.salt.Utils;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDao Dao;
	
	@Autowired
	MypageSortDao SortDao;

	@Override
	public int withdrawdo(MemberVo vo, LeaveMemberVo vo2) {
		
		int result;
		Utils utils = new Utils();
		
		MemberVoTemp v = new MemberVoTemp();
		
		String inputpwd = vo.getMemberPwd();
		
		v = Dao.passchk(vo);
		String salt = v.getMemberPwdSalt();
		String origin = v.getMemberPwd();
		String hash = utils.getEncrypt(inputpwd,salt);
		
		System.out.println("DB MEMBER_PWD = "+origin);
		System.out.println("인풋비번&DB솔트해시 =" +hash);
			
		if (origin.equals(hash)) {
			vo.setMemberPwdSalt(salt);
			vo.setMemberPwd(hash);
			Dao.insertleavemember(vo2);
			Dao.updatestatus(vo);
			System.out.println("일치!");
			result = 1;
		}
		else {
			System.out.println("불일치!");
			result = 0;
		} 
		return result;
	}

	@Override
	public void signupdo(MemberVo vo) {
		Dao.insertmember(vo);
		
	}

	@Override
	public List<WannaWatchVo> wannawatch(String memberemail) {
		
		List<WannaWatchVo> list = new ArrayList<WannaWatchVo>();
	    list = Dao.selectwannawatch(memberemail);
		
		return list;
	}

	@Override
	public List<StarRatingForMainVo> getratinginfo(String memberemail) {
		
		List<StarRatingForMainVo> list = new ArrayList<StarRatingForMainVo>();
		list = Dao.getratinginfo(memberemail);
		return list;
	}

	@Override
	public MemberVo getMemberinfo(String memberemail) {
		MemberVo vo = new MemberVo();
		
		vo = Dao.getMemberinfo(memberemail);
		
		return vo;
	}

	@Override
	public Map<String, Object> getmostRatedStar(String memberemail) {
		
		Map<String, Object> getmostRatedStar = new HashMap<String, Object>();
		
		getmostRatedStar = Dao.selectmostRatedStar(memberemail);
		return getmostRatedStar;
	}

	@Override
	public List<Map<String, Object>> getStarNum(String memberemail) {
		
		List<Map<String,Object>> map = new ArrayList<Map<String, Object>>();
		
		map = Dao.selectStarNum(memberemail);
		return map;
	}

	@Override
	public List<Map<String, Object>> getdoughnutNum(String memberemail) {
		
		List<Map<String, Object>> map = new ArrayList<Map<String, Object>>();
		map = Dao.selectDoughnutNum(memberemail);
		return map;
	}

	@Override
	public List<Map<String, Object>> getStarNumDesc(String memberemail) {
		List<Map<String,Object>> map = new ArrayList<Map<String, Object>>();
		
		map = Dao.selectStarNumDesc(memberemail);
		return map;
	}

	@Override
	public MemberVo getMemberInfo(String memberemail) {
		
		MemberVo member = Dao.selectMember(memberemail);
		return member;
	}

	@Override
	public void editprofile(MemberVo vo) {
		
		 Dao.updatememberinfo(vo);
		
	}

	@Override
	public int nicknamechk(String memberNickname) {
		
		return Dao.nicknamechk(memberNickname);
	}

	
	//보고싶어요 sort
	@Override
	public List<WannaWatchVo> wannawatch1(String memberemail) {
		
		List<WannaWatchVo> list = SortDao.selectwwsort1(memberemail);
		return list;
	}

	@Override
	public List<WannaWatchVo> wannawatch2(String memberemail) {
		List<WannaWatchVo> list = SortDao.selectwwsort2(memberemail);
		return list;
	}

	@Override
	public List<WannaWatchVo> wannawatch3(String memberemail) {
		List<WannaWatchVo> list = SortDao.selectwwsort3(memberemail);
		return list;
	}

	@Override
	public List<WannaWatchVo> wannawatch4(String memberemail) {
		List<WannaWatchVo> list = SortDao.selectwwsort4(memberemail);
		return list;
	}
	
	//평가한작품 sort
	@Override
	public List<StarRatingForMainVo> getratinginfo1(String memberemail) {
		List<StarRatingForMainVo> list = new ArrayList<StarRatingForMainVo>();
		list = SortDao.selectRMsort1(memberemail);
		return list;
	}

	@Override
	public List<StarRatingForMainVo> getratinginfo2(String memberemail) {
		List<StarRatingForMainVo> list = new ArrayList<StarRatingForMainVo>();
		list = SortDao.selectRMsort2(memberemail);
		return list;
	}

	@Override
	public List<StarRatingForMainVo> getratinginfo3(String memberemail) {
		List<StarRatingForMainVo> list = new ArrayList<StarRatingForMainVo>();
		list = SortDao.selectRMsort3(memberemail);
		return list;
	}

	@Override
	public List<StarRatingForMainVo> getratinginfo4(String memberemail) {
		List<StarRatingForMainVo> list = new ArrayList<StarRatingForMainVo>();
		list = SortDao.selectRMsort4(memberemail);
		return list;
	}

	@Override
	public List<StarRatingForMainVo> getSearchResult(String memberemail, String findstr) {
		List<StarRatingForMainVo> list = new ArrayList<StarRatingForMainVo>();
		list = Dao.selectSearchMovies(memberemail,findstr);
		return list;
		
	}

	@Override
	public List<WannaWatchVo> getWWSearchResult(String memberemail, String findstr) {

		List<WannaWatchVo> list =  SortDao.selectwwSearch(memberemail, findstr);
		return list;
	}


	

	
}