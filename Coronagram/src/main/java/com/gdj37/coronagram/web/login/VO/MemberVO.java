package com.gdj37.coronagram.web.login.VO;


public class MemberVO {

	private String EMAIL;
	private String M_ID;
	private String M_PW;
	private String pw;
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getM_PW() {
		return M_PW;
	}
	public void setM_PW(String m_PW) {
		M_PW = m_PW;
	}
	public String getM_ID() {
		return M_ID;
	}

	public MemberVO(String eMAIL, String m_ID, String m_PW, String pw) {
		super();
		EMAIL = eMAIL;
		M_ID = m_ID;
		M_PW = m_PW;
		this.pw = pw;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MemberVO [EMAIL=" + EMAIL + ", M_ID=" + M_ID + ", M_PW=" + M_PW + ", pw=" + pw + "]";
	}

	


	



	
	
}
