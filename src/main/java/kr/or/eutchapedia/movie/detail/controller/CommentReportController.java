package kr.or.eutchapedia.movie.detail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.eutchapedia.movie.detail.domain.CommentReportVo;
import kr.or.eutchapedia.movie.detail.service.CommentReportDao;

@RestController
public class CommentReportController {
	
	@Autowired
	CommentReportDao dao;
	
	@RequestMapping(value = "/reportComment", method = RequestMethod.POST)
	public Map<String, Object> reportComment(@RequestParam Map<String, Object> commandMap, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		int result = 0;
		int commentIndex = Integer.parseInt((String) commandMap.get("commentIndex"));
		String reportText = (String) commandMap.get("reportText");
		String memberEmail = (String) session.getAttribute("memberEmail");
		
		CommentReportVo commentReportVo = new CommentReportVo();
		commentReportVo.setCommentIndex(commentIndex);
		commentReportVo.setReportText(reportText);
		commentReportVo.setMemberEmail(memberEmail);
		
		result = dao.reportComment(commentReportVo);
		dao.updateReportCount(commentIndex);
		
		resultMap.put("result", result);
		
		return resultMap;
	}
}
