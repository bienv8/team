package com.iot.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.iot.test.vo.UserInfoVO;

@Mapper
public interface UserInfoMapper {

	@Select("select uiNo, uiId,uiPwd,uiNickName,uiEmail,uiRegdate,iconName,uitype from user_info")
	List<UserInfoVO> selectUserListAll();

	@Select("select uiId from user_info where uiNickName = #{uiNickName}")
	String selectUiIdForChat(String uiNickName);
	
	@Select("select uiNickName as fName, uiId as fId from user_info where \\uiId=#{fId}")
	Map<String,Object> selectUserInfoToFriend(String fId);

	@Select("select uiNo,uiId,uiPwd,uiNickName,uiEmail,uiRegDate,iconName,uiType "
			+ "from user_info where uiId = #{uiv.uiId} and uiPwd = #{uiv.uiPwd}")
	UserInfoVO selectUserForLogin(@Param("uiv") UserInfoVO uiv);

	@Select("select uiId from user_info where uiId = #{uiv.uiId}")
	UserInfoVO selectUiId(@Param("uiv") UserInfoVO uiv);

	@Select("select uiNo,uiId,uiPwd,uiNickName,uiEmail,uiRegDate,iconName,uiType from user_info where uiId = #{uiv.uiId}")
	UserInfoVO selectUserById(@Param("uiv") UserInfoVO uiv);

	@Select("select uiNo,uiId,uiPwd,uiNickName,uiEmail,uiRegDate,iconName,uiType from user_info where uiNo = #{uiNo}")
	UserInfoVO selectUserByNo(int uiNo);

	@Insert("insert into user_info(uiId,uiPwd,uiNickName,uiEmail,uiRegdate,iconName,uitype) "
			+ "values(#{uiId},#{uiPwd},#{uiNickName},#{uiEmail},current_timestamp,#{iconName},#{uiType})")
	int insertUserInfo(UserInfoVO uiv);

	@Delete("delete user_info where uiId=#{uiId}")
	int withdrawalByUiId(String uiId);

	@Delete("delete user_info where uiNo=#{uiNo}")
	int withdrawalByUiNo(int uiNo);

	@Update("update user_info set uiEmail = #{uiv.uiEmail}, uiNickName = #{uiv.uiNickName} where uiNo=#{uiv.uiNo}")
	int updateUser(@Param("uiv") UserInfoVO uiv);


}
