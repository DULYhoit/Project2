package kr.or.eutchapedia.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eutchapedia.admin.member.dao.MemberselectDao;
import kr.or.eutchapedia.admin.member.entity.MemberCount;
import kr.or.eutchapedia.admin.member.entity.Memberinfo;

@Service
public class MemberselectServicelmp implements MemberselectService {

	@Autowired
	private MemberselectDao memberselectdao;
	
	private static String namespace = "/KH-FINAL-PROJECT/src/main/webapp/WEB-INF/view/admin/member/selectMember.jsp";
	
	@Override
 	public List<Memberinfo> getmemberList(){
		return getmemberList("member_email","",1,10);
	}

	

	@Override
 	public List<Memberinfo> getmemberList(int page,int amount){
	
		return getmemberList("member_email","",page,amount);
	}



	@Override
	public List<Memberinfo> getmemberList(String field, String query, int page, int amount) {
		List<Memberinfo>memberlist = memberselectdao.getmemberList(field,query,page,amount);
		return memberlist;
	}


	
	@Override
	public List<MemberCount> getmemberCount(String field, String query) {
		List<MemberCount>membercount = memberselectdao.getmemberCount(field,query);
		return membercount;
	}



	
	
	



	@Override
	public int delMember(String memberemail) {
		int memberdelete = memberselectdao.delMember(memberemail);
		return memberdelete;
	}



	@Override
	public int updateStatus(String memberemail, String status) {
		int updatestatus = memberselectdao.updateStatus(memberemail,status);
		return updatestatus;
	}



	@Override
	public void delete(String member_email) {
		// TODO Auto-generated method stub
		
	}
	
	
		
	
}
