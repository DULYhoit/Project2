package kr.or.eutchapedia.movie.rate.controller;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.movie.rate.entity.MovierateVo;
import kr.or.eutchapedia.movie.rate.service.MovierateService;


@RequestMapping("/movie")
@RestController

public class MovieRateController {
	@Autowired
	private MovierateService service; 
	int cp_ = 1;
	@RequestMapping("/movierate")	
	
	
	
	//첫 10개항목 
	public ModelAndView movieRate(HttpSession session, Model model , HttpServletRequest req) throws UnsupportedEncodingException {
		
		ModelAndView mv = new ModelAndView("user/movie/rating/ratingPage");
		
		String genre_ = req.getParameter("f");
		String genre = "액션/스릴러/범죄"; 
		req.setCharacterEncoding("UTF-8");

		if (genre_==null){
			genre = "액션/스릴러/범죄" ;
		}
		
		
		else if (genre_.equals("action")){
			genre = "액션/스릴러/범죄" ;
		}
		
		else if (genre_.equals("romance")){
			genre = "멜로/로맨스" ;
		}
		
		else if (genre_.equals("sf")){
			genre = "판타지/SF" ;
		}
		
		else if (genre_.equals("drama")){
			genre = "드라마" ;
		}
		
		else if (genre_.equals("horror")){
			genre = "공포" ;
		}
		else if (genre_.equals("etc")){
			genre = "기타" ;
		}
		
		
		
		
			genre_ = genre;
		
		System.out.println("나는장르다: "+ genre_);
		System.out.println("나는장르다: "+ genre);
		String email = (String)session.getAttribute("email");	

		List<MovierateVo> movies = service.getMovieListsS(email,genre);
		System.out.println(movies);
		model.addAttribute("movies", movies);
		

		return mv;
	}


	@RequestMapping("/ratelist.do")		
	@ResponseBody
	public List<MovierateVo> movies(

			@RequestParam(value = "cp" , required = false, defaultValue = "1") int cp,
			@RequestParam(value = "gr",required = false , defaultValue = "액션/스릴러/범죄")String genre
			,  HttpServletRequest req) throws UnsupportedEncodingException
	{		
		Map<String, Object> param = new HashMap<String, Object>();
	
	
	System.out.println("현재페이지"+cp);

	req.setCharacterEncoding("UTF-8");

		
		System.out.println("나는 무한장르?다: "+ genre);
		
		String genre1 = "";
		
		if (genre.equals("action")){
			genre1 = "액션/스릴러/범죄" ;
		}
		
		if (genre.equals("romance")){
			genre1 = "멜로/로맨스" ;
		}
		
		if (genre.equals("sf")){
			genre1 = "판타지/SF" ;
		}
		
		if (genre.equals("drama")){
			genre1 = "드라마" ;
		}
		
		if (genre.equals("horror")){
			genre1 = "공포" ;
		}
		if (genre.equals("etc")){
			genre1 = "기타" ;
		}
	
		
		
	Integer start = (cp-1)*10+1;
	Integer end = start+10-1;
	System.out.println(start);
	System.out.println(genre);
	System.out.println(end);
	param.put("st",start);
	param.put("en", end);
	param.put("genre",genre);
	param.put("genre1",genre1);
	System.out.println(param.get("st"));
	System.out.println(param.get("en"));
	System.out.println(genre);
	return  service.getMovieLists(param);



	}


}
