package com.exam.member;
// Value object : 객체 값에 속성이 동일하면 Value object이다. 테이블에 담을 수 있는 행의 정보  
public class MemberVo {
   private String memId; 
   private String memPass;
   private String memName;
   private int memPoint;
   
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(int memPoint) {
		this.memPoint = memPoint;
	}
	   
   
}
