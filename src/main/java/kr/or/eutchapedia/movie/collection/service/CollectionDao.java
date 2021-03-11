package kr.or.eutchapedia.movie.collection.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.collection.domain.CollectionVo;
import kr.or.eutchapedia.movie.collection.repository.CollectionMapper;

@Service
@Transactional
public class CollectionDao {
	
	@Autowired
	CollectionMapper mapper;
	
	public List<CollectionVo> selectCollectionInfo(int pickIndex) {
		List<CollectionVo> collectionList = new ArrayList<>();
		
		try {
			collectionList = mapper.selectCollectionInfo(pickIndex);
			for (CollectionVo vo : collectionList) {
				vo.setProdYear(vo.getProdYear().substring(0, 4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return collectionList;
	}
}
