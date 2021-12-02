package com.spring.board.dto;

import java.util.List;

public class MemberDto extends CommonDto {
 
	String USER_SEQ;
    String USER_ID;
    String USER_PW;
    String OTP_KEY;
    String EMAIL_YN;
    String EMAIL_CODE;
    String INS_DATE;
    String MOD_DATE;
    String COUNT;
	public String getUSER_SEQ() {
		return USER_SEQ;
	}
	public void setUSER_SEQ(String uSER_SEQ) {
		USER_SEQ = uSER_SEQ;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_PW() {
		return USER_PW;
	}
	public void setUSER_PW(String uSER_PW) {
		USER_PW = uSER_PW;
	}
	public String getOTP_KEY() {
		return OTP_KEY;
	}
	public void setOTP_KEY(String oTP_KEY) {
		OTP_KEY = oTP_KEY;
	}
	public String getEMAIL_YN() {
		return EMAIL_YN;
	}
	public void setEMAIL_YN(String eMAIL_YN) {
		EMAIL_YN = eMAIL_YN;
	}
	public String getEMAIL_CODE() {
		return EMAIL_CODE;
	}
	public void setEMAIL_CODE(String eMAIL_CODE) {
		EMAIL_CODE = eMAIL_CODE;
	}
	public String getINS_DATE() {
		return INS_DATE;
	}
	public void setINS_DATE(String iNS_DATE) {
		INS_DATE = iNS_DATE;
	}
	public String getMOD_DATE() {
		return MOD_DATE;
	}
	public void setMOD_DATE(String mOD_DATE) {
		MOD_DATE = mOD_DATE;
	}
	public String getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(String cOUNT) {
		COUNT = cOUNT;
	}
    
    
    
    
	
    
    
    
}