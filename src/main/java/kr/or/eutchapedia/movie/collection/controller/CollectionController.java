package kr.or.eutchapedia.movie.collection.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.or.eutchapedia.movie.collection.domain.CollectionVo;
import kr.or.eutchapedia.movie.collection.service.CollectionDao;

@RestController
public class CollectionController {

	@Autowired
	CollectionDao collectionDao;
	
	@RequestMapping(value = "/collection", method = RequestMethod.GET)
	public ModelAndView selectCollectionList(int pickIndex) {
		ModelAndView mv = new ModelAndView();

		List<CollectionVo> collectionList = collectionDao.selectCollectionInfo(pickIndex);
		
		if (collectionList != null ) {
			String pickName = collectionList.get(0).getPickName();
			
			mv.addObject("pickIndex", pickIndex);
			mv.addObject("pickName", pickName);
			mv.addObject("collectionList", collectionList);			
		}
		mv.setViewName("user/movie/collection/collection");
		
		return mv;
	}
}
