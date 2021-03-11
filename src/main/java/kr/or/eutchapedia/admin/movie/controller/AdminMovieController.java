package kr.or.eutchapedia.admin.movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.admin.movie.entity.CommentDetail;
import kr.or.eutchapedia.admin.movie.entity.CommentEnrollment;
import kr.or.eutchapedia.admin.movie.entity.Memberdash;
import kr.or.eutchapedia.admin.movie.entity.MovieChart;
import kr.or.eutchapedia.admin.movie.entity.MovieCount;
import kr.or.eutchapedia.admin.movie.entity.MovieGoodChart;
import kr.or.eutchapedia.admin.movie.entity.MovieInfo;
import kr.or.eutchapedia.admin.movie.entity.PickInfo;
import kr.or.eutchapedia.admin.movie.entity.PickInfoDummy;
import kr.or.eutchapedia.admin.movie.entity.PickMovieInfo;
import kr.or.eutchapedia.admin.movie.service.MovieService;

@RequestMapping("/admin")
@RestController
public class AdminMovieController {

	@Autowired
	private MovieService service;

	@RequestMapping("/adminhome")
	public ModelAndView adminHome(Model model,HttpServletRequest res) {
		ModelAndView mv = new ModelAndView("admin/movie/dashboard");
		List<Memberdash> getmemberinfo = service.getMemberInfo();
		List<MovieChart> getmoviechart = service.getMovieChart();
		List<MovieGoodChart> getmoviegoodchart=service.getMovieGoodChart();
		System.out.println("차트정보"+getmoviegoodchart.get(0).getSum());
		model.addAttribute("getmemberinfo", getmemberinfo);
		model.addAttribute("getmoviechart", getmoviechart);
		model.addAttribute("getmoviegoodchart", getmoviegoodchart);
		
		return mv;

	}
	@RequestMapping("/pickadd/submit")
	public ModelAndView pickAddSubmit(Model model,HttpServletRequest req,HttpServletResponse res,HttpSession session) throws IOException {
		ModelAndView mv = new ModelAndView();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String field_ = req.getParameter("f");
		String query_ = req.getParameter("q");
		String number_ = req.getParameter("p");
		String field = "title";
		if(field_ != null && !field_.equals(""))
			field = field_;
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		System.out.println(field);
		System.out.println(query);
		System.out.println(number);

	//	String userid = "jhlee@naver.com";
//		String userid = "kaoo238@naver.com";
		String userid = (String)session.getAttribute("memberEmail1");
		String collection_ = req.getParameter("cbname");
		String[] movieids = req.getParameterValues("mid");
		List<PickInfo> getpick = service.getPick();
		System.out.println(getpick);
		int pickandemail = 0;
		String collection = null;
		String pickindex = null;
		List<String> pickmlist = new ArrayList<>();
		if(movieids != null && collection_!= null && !collection_.equals("")) {
			
			for (int j = 0; j < getpick.size(); j++) {
				System.out.println("if문진입전");
				System.out.println("for문번호 = " + j);
				System.out.println("등록한pick이름 ="+collection_);
				System.out.println("등록한아이디 = " +userid);
				System.out.println("비교할컬렉션이름 = "+getpick.get(j).getPickName());
				System.out.println("비교할이메일 = "+getpick.get(j).getFkMemberEmail());
				if(collection_.equals(getpick.get(j).getPickName()) && userid.equals(getpick.get(j).getFkMemberEmail()))
				{
					System.out.println("첫번째for문 if진입");
					collection = getpick.get(j).getPickName();
					pickindex = getpick.get(j).getPickIndex();
					List<PickInfoDummy> getdummy = service.getDummy(collection,pickindex);
					System.out.println(collection);
					System.out.println(pickindex);
					pickandemail = 1;
					//픽박스에같은이름이 존재하면 해당픽박스에 영화추가 update
					for(int i = 0; i<movieids.length;i++) {
						System.out.println("두번째for문");
						String movieid;
						movieid = movieids[i];
						System.out.println(movieid);
						int t = 0;
						for(int k = 0; k<getdummy.size(); k++) {
							System.out.println(getdummy.get(k).getFkMovieDocid().contains(movieid));
							if(getdummy.get(k).getFkMovieDocid().contains(movieid)) {
								t++;
							}
						}
						if(t == 0) {
							pickmlist.add(movieid);
						}
						
						
					}
				}
			}
			
			
			if(pickandemail == 1) {
				for(int m = 0; m<pickmlist.size();m++) {
					String movie = pickmlist.get(m);
					int addpickmovies = service.addPickMovies(pickindex,movie);
				}
				out.println("<script>alert('컬렉션이 추가되었습니다.'); location.href='"+"/admin/pickadd?p="+number+"&q="+java.net.URLEncoder.encode(query, "utf-8")+"&f="+field+"';</script>");
		     	out.flush();
			}
			if(pickandemail == 0) {
				int addpick = service.addPick(userid,collection_);
				List<PickInfo> getpick1 = service.getPick();
				String pickindex1 = null;
				if( !getpick1.isEmpty() ) {
					pickindex1 = getpick1.get(getpick1.size() - 1).getPickIndex();
				}
				for(int m = 0;m<movieids.length;m++) {
					String movie;
					movie = movieids[m];
					int addpickmovies1 = service.addPickMovies1(pickindex1,movie);
					System.out.println("어디픽인지 = "+pickindex1);
					System.out.println("컬럼만들고 영화주입 = "+addpickmovies1);
					
				}
				out.println("<script>alert('컬렉션이 추가되었습니다.'); location.href='"+"/admin/pickadd?p="+number+"&q="+java.net.URLEncoder.encode(query, "utf-8")+"&f="+field+"';</script>");
		     	out.flush();
			}
		}else {
			out.println("<script>alert('컬렉션 이름과 영화를 추가해주세요.'); location.href='"+"/admin/pickadd?p="+number+"&q="+java.net.URLEncoder.encode(query, "utf-8")+"&f="+field+"';</script>");
	     	out.flush();
		}
		

		
		


		mv.setViewName("redirect:/admin/pickadd?p="+number
				+"&q="+java.net.URLEncoder.encode(query, "utf-8")
				+"&f="+field);
		return mv;
	}


	@RequestMapping("/pickadd")
	public ModelAndView pickAdd(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("admin/movie/pick-add");
	
		String field_ = req.getParameter("f");
		String query_ = req.getParameter("q");
		String number_ = req.getParameter("p");
		String field = "title";
		if(field_ != null && !field_.equals(""))
			field = field_;
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		int number = 1;
	
		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;
	
		List<MovieInfo> movielist = service.getmovieList(field, query, page,amount);
	
		String count = null;
		List<MovieCount> moviecount = service.getmovieCount(field,query);
		if(!moviecount.isEmpty())
			count = moviecount.get(moviecount.size() - 1).getNum();
	
	
	
	
		model.addAttribute("movielist", movielist);
		model.addAttribute("count",count);
		return mv;
	}
	@RequestMapping("/pickdelete")
	public ModelAndView pickDelete(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("admin/movie/pick-delete");
		String number_ = req.getParameter("p");
		String pickno = req.getParameter("pickno");
		String email = req.getParameter("em");
		String pickname = req.getParameter("pn");
		System.out.println("pickname"+pickname);
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;

		List<PickInfo> picklist = service.getPickInfoList(page,amount);
		List<MovieCount> counts = service.getCount();
		String count = null;
		if(!counts.isEmpty())
			count = counts.get(counts.size() - 1).getNum();
		if(pickname != null) {
			
			List<PickMovieInfo> pickmovies = service.getPickMovieforId(pickno,email,pickname);
			model.addAttribute("pickmovies", pickmovies);
		}
		
		
		model.addAttribute("pickinfo",picklist);

		model.addAttribute("count",count);
		
		


		return mv;

	}
	@RequestMapping("/pickdelete/delmovie")
	public ModelAndView pickDelete(HttpServletRequest req,HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String pickno = null;
		String docid = null;
		String[] dellist = req.getParameterValues("list");
		String sub_ = req.getParameter("sub");
		String fkpickno = req.getParameter("fkpickno");
		
		int sub = Integer.parseInt(sub_);
		System.out.println("sub들어옴 = "+sub);
		
		switch (sub) {
		case 1:
			if(dellist == null) {
				out.println("<script>alert('픽 또는 영화를 선택해주세요.'); location.href='/admin/pickdelete';</script>");
		     	out.flush();
			}
				for (int i = 0; i < dellist.length; i++) {
					String[] split = null;
					split = dellist[i].split(",");
					for(int j = 0; j<split.length; j++) {
						
						if(j == 0) {
							pickno = split[j];
						}
						if(j == 1) {
							docid = split[j];
							int chopickdel = service.chopickDel(pickno,docid);
							
						}
					}
				}
				out.println("<script>alert('삭제 되었습니다.'); location.href='/admin/pickdelete';</script>");
		     	out.flush();

//			if(dellist.length == 1) {
//				System.out.println("리스트 1개임");
//				out.println("<script>alert('1개이상 선택해주세요'); location.href='/admin/pickdelete';</script>");
//				out.flush();
//			}
				
					
					
			break;
		case 2:			
						if(fkpickno == null || fkpickno.equals("")) {
							out.println("<script>alert('삭제하실 픽을 선택하세요.'); location.href='/admin/pickdelete';</script>");
					     	out.flush();
						}
						int allpickdel = service.allpickDel(fkpickno);
					
					
					
				
			
			break;
			
			
		}
			
			
				
			
		mv.setViewName("redirect:/admin/pickdelete");
				
		
		return mv;

	}
	@RequestMapping("/commentenroll")
	public ModelAndView commentEnroll(HttpServletRequest req,Model model) {
		ModelAndView mv = new ModelAndView("admin/movie/comment-enrollment");
		String number_ = req.getParameter("p");
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;
		List<CommentEnrollment> getnoblind = service.getNoBlind(page,amount);
		List<MovieCount> getblindcount = service.getBlindCount();
		String count = null;
		if(!getblindcount.isEmpty())
			count = getblindcount.get(getblindcount.size() - 1).getNum();
		model.addAttribute("getnoblind",getnoblind);
		model.addAttribute("count",count);
		
		return mv;
	}
	@RequestMapping("/commentenroll/detail")
	public ModelAndView commentEnrollDetail(HttpServletRequest req,Model model) {
		ModelAndView mv = new ModelAndView("admin/movie/comment-detail");
		String commentno= req.getParameter("commentno");
		String number_ = req.getParameter("p");
		int number = 1;
		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;
		List<CommentDetail> commentdetail = service.getCommentDetail(commentno,page,amount);
		List<MovieCount> commentcount = service.getCommentCount(commentno,page,amount);
		String count = null;
		if(!commentcount.isEmpty())
			count = commentcount.get(commentcount.size() - 1).getNum();
		int ci = commentdetail.get(0).getFkCommentIndex();
		model.addAttribute("commentdetail", commentdetail);
		model.addAttribute("count", count);
		model.addAttribute("ci", ci);
	
		
		return mv;
	}
	@RequestMapping("/commentenroll/detail/blindon")
	public ModelAndView commentblindOn(HttpServletRequest req,Model model,HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String commentno = req.getParameter("commentno");
		System.out.println("커맨트넘버"+commentno);
		int blindon = service.setBlindOn(commentno);
		
		out.println("<script>alert('블라인드 처리가 되었습니다.'); location.href='/admin/commentenroll';</script>");
     	out.flush();
		mv.setViewName("redirect:/admin/commentenroll");
		
		
	    
		
		return mv;
	}

	@RequestMapping("/commentcansel")
	public ModelAndView commentCansel(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("admin/movie/comment-cansel");
		String number_ = req.getParameter("p");
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;
		List<CommentEnrollment> getyesblind = service.getYesBlind(page,amount);
		List<MovieCount> getblindcount = service.getYesBlindCount();
		
		String count = null;
		if(!getblindcount.isEmpty())
			count = getblindcount.get(getblindcount.size() - 1).getNum();
		model.addAttribute("getyesblind", getyesblind);
		model.addAttribute("count",count);
		return mv;
		
	}
	
	@RequestMapping("/commentcansel/blindoff")
	public ModelAndView commentBlindOff(Model model,HttpServletRequest req,HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String[] commentindex_ = req.getParameterValues("ci");
		String commentindex = null;
		if(commentindex_ == null) {
			out.println("<script>alert('블라인드 해제할 아이디를 선택하세요.'); location.href='/admin/commentcansel';</script>");
	     	out.flush();
		}
		for(int i = 0; i<commentindex_.length;i++) {
			commentindex = commentindex_[i];
			int blindoff = service.setBlindOff(commentindex);
		}
		out.println("<script>alert('블라인드 처리가 해제되었습니다.'); location.href='/admin/commentcansel';</script>");
     	out.flush();
		mv.setViewName("redirect:/admin/commentcansel");
	
		return mv;
		
	}
		
		

	@RequestMapping("/moviemanagement")
	public ModelAndView movieManagement(Model model,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("admin/movie/dbmanagement");
		String field_ = req.getParameter("f");
		String query_ = req.getParameter("q");
		String number_ = req.getParameter("p");
		String field = "title";
		if(field_ != null && !field_.equals(""))
			field = field_;
		String query = "";
		if(query_ != null && !query_.equals(""))
			query = query_;
		int number = 1;

		if(number_ != null && !number_.equals(""))
			number = Integer.parseInt(number_);
		int page = 1+(number-1)*10;
		int amount = number*10;
		 

		List<MovieInfo> movielist = service.getmovieList(field, query, page,amount);

		String count = null;
		List<MovieCount> moviecount = service.getmovieCount(field,query);
		if(!moviecount.isEmpty())
			count = moviecount.get(moviecount.size() - 1).getNum();
		System.out.println("총 갯수 : " + count);

		model.addAttribute("movielist", movielist);
		model.addAttribute("count",count);

		return mv;

	}
	@RequestMapping("/moviemanagement/edit")
	public ModelAndView movieManagementDelete(Model model,HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("admin/movie/editMovie");
		
		String movieDocid = req.getParameter("movieDocid");
		MovieInfo movieinfo = service.getMovie(movieDocid);
		
		model.addAttribute("movieinfo",movieinfo);
		

		
		return mv;

	}
	@RequestMapping("/moviemanagement/edit/submit")
	public ModelAndView movieManagementSubmit(Model model,HttpServletRequest req,HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String docid_ = req.getParameter("docid");
		String title_ = req.getParameter("title");
		String titleorg_ = req.getParameter("titleorg");
		String nation_ = req.getParameter("nation");
		String runningtime_ = req.getParameter("runningtime");
		String rating_ = req.getParameter("rating");
		String prodyear_ = req.getParameter("prodyear");
		String posteruri_ = req.getParameter("posteruri");
		String genre_ = req.getParameter("genre");
		String plot_ = req.getParameter("plot");
		String traileruri_ = req.getParameter("traileruri");
		String sub_ = req.getParameter("sub");
		
		int sub = Integer.parseInt(sub_);
		
		String docid = "";
		if(docid_ != null && !docid_.equals(""))
			docid = docid_;
		String title = "";
		if(title_ != null && !title_.equals(""))
			title = title_;
		String titleorg = "";
		if(titleorg_ != null && !titleorg_.equals(""))
			titleorg = titleorg_;
		String nation = "";
		if(nation_ != null && !nation_.equals(""))
			nation = nation_;
		String runningtime = "";
		if(runningtime_ != null && !runningtime_.equals(""))
			runningtime = runningtime_;
		String rating = "";
		if(rating_ != null && !rating_.equals(""))
			rating = rating_;
		String prodyear = "";
		if(prodyear_ != null && !prodyear_.equals(""))
			prodyear = prodyear_;
		String posteruri = "";
		if(posteruri_ != null && !posteruri_.equals(""))
			posteruri = posteruri_;
		String genre = "";
		if(genre_ != null && !genre_.equals(""))
			genre = genre_;
		String plot = "";
		if(plot_ != null && !plot_.equals(""))
			plot = plot_;
		String traileruri = "";
		if(traileruri_ != null && !traileruri_.equals(""))
			traileruri = traileruri_;
		
		switch (sub) {
		case 1:
			int deletemovieinfo = service.deleteMovieInfo(docid);
			out.println("<script>alert('해당 데이터가 삭제되었습니다.'); location.href='/admin/moviemanagement';</script>");
	     	out.flush();
			
			break;

		case 2:
			int updatemovieinfo = service.updateMovieInfo(docid,title,titleorg,nation,runningtime,rating,prodyear,posteruri,genre,plot,traileruri);
			out.println("<script>alert('해당 데이터의 내용이 수정되었습니다.'); location.href='/admin/moviemanagement';</script>");
	     	out.flush();
			break;
		}
		
		mv.setViewName("redirect:/admin/moviemanagement");
		

		
		return mv;

	}



}
