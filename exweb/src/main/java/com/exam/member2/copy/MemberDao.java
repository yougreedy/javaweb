package com.exam.member2.copy;

import java.util.List;

public interface MemberDao {

	List<MemberVo> selectMemberList();

	int insertMember(MemberVo vo);

	int deleteMember(String memId);

}