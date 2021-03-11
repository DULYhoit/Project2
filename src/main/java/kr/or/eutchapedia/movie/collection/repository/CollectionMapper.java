package kr.or.eutchapedia.movie.collection.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.movie.collection.domain.CollectionVo;

@Repository
@Mapper
public interface CollectionMapper {
	public List<CollectionVo> selectCollectionInfo(int pickIndex);

}
