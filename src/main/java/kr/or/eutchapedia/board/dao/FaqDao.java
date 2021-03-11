package kr.or.eutchapedia.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.eutchapedia.board.entity.Faq;
import kr.or.eutchapedia.board.entity.FaqView;

@Mapper
public interface FaqDao {
	//페이지 요청할 때 
	List<FaqView> getViewList(int offset, int size, String field, String query);
	//공개여부
	List<FaqView> getViewPubList(int offset, int size, String field, String query);
	
	public int updatePubAll(int[] oids, int[] cids); 
	
	public int updatePubAll(List<String> oids, List<String> cids); 
	
	public int updatePubAll(String oidsCSV, String cidsCSV);
	
	int getCount(String field, String query);	
	//자세한 페이지 요청할 때 
	FaqView getView(int faqNo);
	
	//게시글 수정
	void update(Faq faq);
	//게시글 작성
	int insert(Faq faq);
	//게시글 삭제
	public void delete(String faqNo) throws Exception;
	
	Faq detail(@Param("faqNo")int faqNo);


	//일괄삭제 요청할 때
	int deleteAll(int[] faqNos);
	//일괄공개 
	//int updatePubAll(int[] pubIds, int[] closeIds);
	//int updatePubAll(int[] faqNos, boolean pub);
	
	String pubList(String[] openIds);
	
}
