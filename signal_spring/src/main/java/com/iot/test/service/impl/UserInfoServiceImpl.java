package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.test.mapper.UserInfoMapper;
import com.iot.test.service.UserInfoService;
import com.iot.test.vo.UserInfoVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoMapper uim;

	@Override
	public void setUserInfoList(Map<String, Object> rMap, UserInfoVO ui, HttpSession hs) {
		UserInfoVO userVO = null;
		rMap.put("msg", "로그인에 실패하셨습니다.");
		rMap.put("biz", false);
		if (ui.getUiPwd() == null) {
			userVO = uim.selectUserById(ui);
		} else {
			userVO = uim.selectUserForLogin(ui);
		}
		if (userVO != null) {
			rMap.put("msg", "로그인에 성공하셨습니다.");
			rMap.put("biz", true);
			hs.setAttribute("user", userVO);

			
		}
	}

	@Override
	public Map<String, Object> insertUserInfo(UserInfoVO uiv) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("msg", "에 실패하셨습니다.");
		resultMap.put("biz", false);
		if (uim.insertUserInfo(uiv) != 0) {
			resultMap.put("msg", "회원가입에 성공하셨습니다.");
			resultMap.put("biz", true);
		}

		return resultMap;
	}

	@Override
	public int withdrawalByUiId(String userName) {
		return uim.withdrawalByUiId(userName);
	}

	@Override
	public int withdrawalByUiNo(int userNumber) {
		return uim.withdrawalByUiNo(userNumber);
	}

	@Override
	public Map<String, Object> checkUiId(UserInfoVO uiv) {

		uiv = uim.selectUiId(uiv);

		Map<String, Object> checkMap = new HashMap<String, Object>();
		checkMap.put("msg", "중복된 아이디가 있습니다.");
		checkMap.put("biz", false);
		if (uiv == null) {
			checkMap.put("msg", "사용가능한 아이디입니다.");
			checkMap.put("biz", true);
		}

		return checkMap;
	}

	@Override
	public List<UserInfoVO> selectUserListAll() {
		return uim.selectUserListAll();
	}

	@Override
	public UserInfoVO selectUserByNo(int uiNo) {
		return uim.selectUserByNo(uiNo);
	}

	@Override
	public int updateUser(UserInfoVO uiv) {
		return uim.updateUser(uiv);
	}
}
