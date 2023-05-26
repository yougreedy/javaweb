package com.exam.member;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDaoBatis implements MemberDao{

	SqlSessionFactory sqlSessionFactory;
	{		
		try { //마이바티스 전체 설정파일 위치 (클래스패스 기준)
			String resource = "/batis/mybatis-config.xml"; // 마이바티스 전체 설정파일 위치
			InputStream inputStream = Resources.getResourceAsStream(resource);	
			//설정파일의 내용대로 sqlSessionFactory(아이바티스본체)룰 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<MemberVo> selectMemberList() {
		List<MemberVo> list = null; //new ArrayList<MemberVo>();
		try (SqlSession session = sqlSessionFactory.openSession()) {
			//실행할 sql문과 동일할 이름의 메서드를 사용하여 sql문을 실행
			//select결과가 실행결과 1행인 경우 selectOne, 2행이상인 경우 selectList 메서드 사용  
			//첫번째 인자로 시행할 sql문의 교유한 이름을 전달 
			//두번째 인자로 sql문 실행시 필요한 데이터(를 담을 객체)를 전달			
			list = session.selectList("com.exam.member.MemberDao.selectMemberList");
			}
		return list;
	}

	@Override
	public int insertMember(MemberVo vo) {
		int num = 0;
		try (SqlSession session = sqlSessionFactory.openSession()) {			
			num = session.insert("com.exam.member.MemberDao.insertMember",vo);
		    session.commit(); // inset,update,delete 후에는 commit 필요	
		}
		return num;
	}
//삭제버튼을 클릭하면,
//사제가 되도록 MemberDaoBatis 클래스와 MemberMapper.xml 파일을 변경하세요
	@Override
	public int deleteMember(String memId) {
		int num = 0;
		try (SqlSession session = sqlSessionFactory.openSession()) {			
			num = session.delete("com.exam.member.MemberDao.deleteMember",memId);
		    session.commit(); // insert,update,delete 후에는 commit 필요	
		}	
	    return num;
	}

	@Override
	public MemberVo selectMemberList(String memId) {
	  MemberVo vo = null; 
		try (SqlSession session = sqlSessionFactory.openSession()) {		
			vo = session.selectOne("com.exam.member.MemberDao.selectMember",memId);
			}
		return vo;
	}

	@Override
	public int updateMember(MemberVo vo) {
		//데이터베이스에 회원정보가 변경되도록 구현 
		int num = 0;
		try (SqlSession session = sqlSessionFactory.openSession()) {			
			num = session.update("com.exam.member.MemberDao.updateMember",vo);
		    session.commit(); // insert,update,delete 후에는 commit 필요	
		}
		return num;	
   }

	@Override
	public MemberVo selectLogin(MemberVo mvo) {
	  // vo 에 들어있는 아이디, 비밀번호가 일치하는 회원정보를 
	  // 데이터베이스에서 SELECT 하여 반환하도록 구현
	    MemberVo vo = null; 
		try (SqlSession session = sqlSessionFactory.openSession()) {		
			vo = session.selectOne("com.exam.member.MemberDao.selectLogin",mvo);
			}
		return vo;
	}
}