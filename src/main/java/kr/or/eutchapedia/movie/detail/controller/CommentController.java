package kr.or.eutchapedia.movie.detail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.movie.detail.domain.CommentLikeVo;
import kr.or.eutchapedia.movie.detail.domain.CommentPage;
import kr.or.eutchapedia.movie.detail.domain.CommentVo;
import kr.or.eutchapedia.movie.detail.service.CommentDao;

@RequestMapping("/comment")
@RestController
public class CommentController {

	@Autowired
	CommentDao commentDao;

	@RequestMapping(value = "/overview", method= RequestMethod.GET)
	public ModelAndView commentOverview(CommentPage page, HttpSession session) {
		ModelAndView mv = new ModelAndView(); 

		Map<String, Object> map = commentDao.selectCommentList(page);
		String movieDocId = (String) map.get("movieDocId");
		String title = commentDao.selectMovieTitle(movieDocId);

		String memberEmail = (String) session.getAttribute("memberEmail");

		if (memberEmail != null) {
			Map<String, Object> mapForLikeData = new HashMap<>();
			mapForLikeData.put("movieDocId", movieDocId);
			mapForLikeData.put("memberEmail", memberEmail);

			List<CommentLikeVo> likeDataList = commentDao.selectLikeData(mapForLikeData);
			if (likeDataList != null) {
				mv.addObject("likeDataList", likeDataList);
			}
		}

		mv.addObject("commentList", map.get("commentList"));
		mv.addObject("commentCount", map.get("commentCount"));
		mv.addObject("movieDocId", movieDocId);
		mv.addObject("page", page);
		mv.addObject("title", title);

		mv.setViewName("/user/movie/detail/rating_more");

		return mv;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public Map<String, Object> insertComment(@RequestParam Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		Integer starIndex = Integer.parseInt((String) map.get("starIndex"));
		String commentText = (String) map.get("commentText");

		CommentVo commentVo = new CommentVo();
		commentVo.setStarIndex(starIndex);
		commentVo.setCommentText(commentText);

		int insertResult = commentDao.insertComment(commentVo);

		resultMap.put("result", insertResult);

		return resultMap;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Map<String, Object> updateComment(@RequestParam Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();

		Integer commentIndex = Integer.parseInt((String) map.get("commentIndex"));
		String commentText = (String) map.get("commentText");

		CommentVo commentVo = new CommentVo();
		commentVo.setCommentIndex(commentIndex);
		commentVo.setCommentText(commentText);

		int updateResult = commentDao.updateComment(commentVo);

		resultMap.put("result", updateResult);

		return resultMap;

	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public Map<String, Object> deleteComment(@RequestParam Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();

		Integer commentIndex = Integer.parseInt((String) map.get("commentIndex"));
		System.out.println(commentIndex);
		int deleteResult = commentDao.deleteComment(commentIndex);

		resultMap.put("result", deleteResult);

		return resultMap;
	}

}
