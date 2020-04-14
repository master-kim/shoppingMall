package com.jica.springshoppingmall.beans;

public class ValueBean {
	// 사용 가능 여부
	public static final int STATUS_ENABLED = 1;
	public static final int STATUS_DISABLED = 2;
	
	// 사용자 등급
	public static final int USER_GRADE_NORMAL = 1;
	public static final int USER_GRADE_MANAGER = 2;
	
	public int getSTATUS_ENABLED() {
		return STATUS_ENABLED;
	}
	public int getSTATUS_DISABLED() {
		return STATUS_DISABLED;
	}
	public int getUSER_GRADE_NORMAL() {
		return USER_GRADE_NORMAL;
	}
	public int getUSER_GRADE_MANAGER() {
		return USER_GRADE_MANAGER;
	}
}
