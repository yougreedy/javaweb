package com.exam.member;

import java.util.List;

//싱글톤ㄴ(Singleton) : 애플리케이션 전체에서 인스턴스를 1개만 새엉하여 사용하는 객체

public class MemberServiceImpl implements MemberService {
    private MemberDao memDao = MemberDaoBatis.getInstance();
	
    
    private MemberServiceImpl() { } //외부에서 생성자 호출 금지
    //클래스가 처음 로드뙬때, 객체를 생성하여 저장
    private static MemberService memberService = new MemberServiceImpl(); 
    public static MemberService getInstacne() {
		return memberService; //생성해놓은 객체를 반환
	} 
    
	@Override
	public List<MemberVo> selectMemberList() {
		return memDao.selectMemberList();
	}

	@Override
	public int insertMember(MemberVo vo) {
		return memDao.insertMember(vo);
	}

	@Override
	public int deleteMember(String memId) {
		return memDao.deleteMember(memId);
	}


	@Override
	public int updateMember(MemberVo vo) {
		return memDao.updateMember(vo);
	}

	@Override
	public MemberVo selectLogin(MemberVo vo) {
		return memDao.selectLogin(vo);
	}


	@Override
	public MemberVo selectMember(String memId) {
		return memDao.selectMember(memId);
			 
	}



	

}
