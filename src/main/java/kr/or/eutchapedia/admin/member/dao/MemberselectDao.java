package kr.or.eutchapedia.admin.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.or.eutchapedia.admin.member.entity.MemberCount;
import kr.or.eutchapedia.admin.member.entity.Memberinfo;
@Repository
@Mapper
public interface MemberselectDao {
	

	
	List<Memberinfo> getmemberList(
		@Param("field")String field, 
		@Param("query")String query,	

		@Param("page")int page,
		@Param("amount")int amount);
	
	
	List<MemberCount> getmemberCount(
			
		@Param("field")String field,
		@Param("query")String query);



	int delMember(String memberemail);


	int updateStatus(String memberemail, String status);





	
}
