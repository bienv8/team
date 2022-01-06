<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin_User</title>
</head>
<script>

	function goUserUpdate(id) {
		$('#uiNo').val(id);
		$('#userUpdateForm').submit();
	}

	function deleteUser(id) {
        if(confirm("정말 탈퇴하시겠습니까?")){
            var ajax = new AjaxUtil("/user/withdrawal",{"uiNo":id});
            ajax.send(function(){
                 alert("회원 탈퇴되었습니다.");
                 Location.reload();
            });
        }
    }
</script>
<body>
	<div id='content' class="ui container">
		<h2 class="ui center aligned inverted icon sub header">
			<i class="clipboard outline icon"></i>사용자 관리
		</h2>
		<br> <br>
		<table class="ui selectable padded celled center aligned table ">
			<thead>
				<tr>
					<th class="one wide">번호</th>
					<th class="six wide">아이디</th>
					<th class="two wide">이메일</th>
					<th class="one wide">날짜</th>
					<th class="one wide">구분</th>
					<th class="one wide"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="user">
					<tr id="${user.uiNo}">
						<td class="positive" onclick="goUserUpdate('${user.uiNo}')" style='cursor: pointer'>${user.uiNo}</td>
						<td class="warning" onclick="goUserUpdate('${user.uiNo}')" style='cursor: pointer'>${user.uiId}</td>
						<td onclick="goUserUpdate('${user.uiNo}')" style='cursor: pointer'>${user.uiEmail}</td>
						<td onclick="goUserUpdate('${user.uiNo}')" style='cursor: pointer'>${user.uiRegdate}</td>
						<td>${user.uiType}</td>
						<td onclick="deleteUser('${user.uiNo}')" style="cursor:pointer;">삭제</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="6">
						<div id="pageFoot" class="ui right floated pagination menu">
						</div>
					</th>
				</tr>
			</tfoot>
		</table>

	</div>
	<form id='userUpdateForm' action='/user/update' style="display: none">
		<input id='uiNo' name='uiNo' type='hidden' />
	</form>

</body>
</html>