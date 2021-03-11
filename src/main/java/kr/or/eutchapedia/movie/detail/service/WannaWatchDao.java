package kr.or.eutchapedia.movie.detail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eutchapedia.movie.detail.domain.WannaWatchVo;
import kr.or.eutchapedia.movie.detail.repository.WannaWatchMapper;

@Service
@Transactional
public class WannaWatchDao {

	@Autowired
	WannaWatchMapper mapper;

	public int selectWannaWatch(WannaWatchVo wannaWatchVo) {
		int result = 0;

		try {
			result = mapper.selectWannaWatch(wannaWatchVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int addToWannaWatch(WannaWatchVo wannaWatchVo) {
		int result = 0;

		try {
			mapper.addToWannaWatch(wannaWatchVo);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

	public int removeWannaWatch(WannaWatchVo wannaWatchVo) {
		int result = 0;

		try {
			mapper.removeWannaWatch(wannaWatchVo);
			result = 0;
		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}
}
