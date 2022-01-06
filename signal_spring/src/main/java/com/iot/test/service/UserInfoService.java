package com.iot.test.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.iot.test.vo.UserInfoVO;

public interface UserInfoService {

	List<UserInfoVO> selectUserListAll();
	void setUserInfoList(Map<String,Object> rMap, UserInfoVO ui, HttpSession hs);
	Map<String,Object> insertUserInfo(UserInfoVO uiv);
	int withdrawalByUiId(String userName);
	int withdrawalByUiNo(int userNumber);
	Map<String,Object> checkUiId(UserInfoVO uiv);
	UserInfoVO selectUserByNo(int uiNo);
	int updateUser(UserInfoVO uiv);
}
