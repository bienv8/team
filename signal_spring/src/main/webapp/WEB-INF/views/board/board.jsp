<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bulletin_Board</title>
</head>
<script>
	function setPageFoot(currentPage,currentBlock,maxBlock,restPage) {
		if (currentBlock > 1) {
			$("#pageFoot")
					.append(
							"<a id='l' class='icon item' onclick='doubleArrow(id,"
									+ maxBlock
									+ ")'><i class='angle double left icon'></i></a>");
			$("#pageFoot")
					.append(
							"<a id='l' class='icon item' onclick='singleArrow(id,"
									+ currentBlock
									+ ")'><i class='angle left icon'></i></a>");
		}

		if (currentBlock == maxBlock && currentBlock ==1) {
			for (var i = 1; i <= restPage; i++) {
				$("#pageFoot").append(
						"<a id='" + i + "' class='item' onclick='pageNumber(id,"  + currentBlock + ")'>"
								+ i + "</a>");
			}
		} else if( currentBlock != maxBlock) {
			for (var i = 1; i <= 10; i++) {
				$("#pageFoot").append(
						"<a id='" + (i + ((currentBlock-1)*10)) + "' class='item' onclick='pageNumber(id,"  + currentBlock + ")'>"
								+ (i + ((currentBlock-1)*10)) + "</a>");
			}
		}else if(currentBlock == maxBlock && currentBlock !=1){
			for (var i = 1; i <= restPage; i++) {
				$("#pageFoot").append(
						"<a id='" +  (i + ((currentBlock-1)*10)) + "' class='item' onclick='pageNumber(id,"  + currentBlock + ")'>" + (i + ((currentBlock-1)*10)) + "</a>");
			}
		}

		if (currentBlock < maxBlock) {
			$("#pageFoot")
			.append(
					"<a id='r' class='icon item' onclick='singleArrow(id,"
							+ currentBlock
							+ ")'><i class='angle right icon'></i></a>");
			$("#pageFoot")
					.append(
							"<a id='r' class='icon item' onclick='doubleArrow(id,"
									+ maxBlock
									+ ")'><i class='angle double right icon'></i></a>");
			
		}

		$("a[id='" + currentPage+"']").addClass("active");
	}

	function goPost(id, hSessionId) {
		$('#bNo').val(id);
		$('#hSessionId').val(hSessionId);
		$('#postForm').submit();
	}

	function doubleArrow(direc, maxBlock) {
		if (direc == 'r') {
			$('#page').val((maxBlock * 10) - 9);
			$('#block').val(maxBlock);
		} else {
			$('#page').val(1);
			$('#block').val(1);
		}
		setTimeout(function(){$('#pageForm').submit()},500);
	}

	function singleArrow(direc, currentBlock) {
		if (direc == 'r') {
			$('#page').val(((currentBlock+1) * 10) - 9);
			$('#block').val(currentBlock+1);
		} else {
			$('#page').val(((currentBlock-1) * 10) - 9);
			$('#block').val(currentBlock-1);
		}
		setTimeout(function(){$('#pageForm').submit()},500);
	}
	function pageNumber(currentPage,currentBlock){
		console.log(currentPage);
		$('#page').val(currentPage);
		$('#block').val(currentBlock);
		setTimeout(function(){$('#pageForm').submit()},500);
	}

	function deleteBoard(bNo) {
    		var isDelete = confirm("?????? ??? ?????? ?????? ????????????.");
    		if (isDelete) {
    			var param = {
    				bNo : bNo
    			};
    			var ajax = new AjaxUtil("/board/delete", param);
    			ajax.send(function(){
    				location.href="/board?page=1&block=1";
    			});
    		}
    	}
</script>
<body
	onload="setPageFoot(${page.currentPage},${page.currentBlock},${page.maxBlock},${page.restPage})">

	<div id='content' class="ui container">
		<h2 class="ui center aligned inverted icon sub header">
			<i class="clipboard outline icon"></i>?????? ?????????
		</h2>
		<a href="/board/write" class='ui labeled Inverted button icon'
			style="float: right;"><i class="pencil alternate icon"> </i>Write</a>
		<br> <br>
		<table class="ui selectable padded celled center aligned table ">
			<thead>
				<tr>
					<th class="one wide">??????</th>
					<th class="six wide">??????</th>
					<th class="one wide center"><i class="user circle icon"></i>?????????</th>
					<th class="two wide">??????</th>
					<th class="one wide">??????</th>
					<th class="one wide">??????</th>
					<c:if test="${uiType==0}"> <th class="one wide"></th></c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="post">
					<tr id="${post.bNo}">
						<td class="positive" onclick="goPost('${post.bNo}','<%=sessionId%>')" style='cursor: pointer'>${post.bNo}</td>
						<td class="left aligned" onclick="goPost('${post.bNo}','<%=sessionId%>')" style='cursor: pointer'>${post.bName}(${post.bCommentCount})</td>
						<td class="warning" onclick="goPost('${post.bNo}','<%=sessionId%>')" style='cursor: pointer'>${post.uiNickName}</td>
						<td>${post.bRegDate}</td>
						<td>${post.bHit}</td>
						<td>${post.bRecom}</td>
					    <c:if test="${uiType==0}"><td style="cursor:pointer;" onclick="deleteBoard('${post.bNo}')">??????</td></c:if>
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
	<form id='postForm' action='/board/post' style="display: none">
		<input id='bNo' name='bNo' type='hidden' /> <input id='hSessionId'
			name='hSessionId' type='hidden' />
	</form>

	<form id='pageForm'
		action=<c:choose>
    <c:when test="${myPost==true}">
        '/board/mypost'
    </c:when>
    <c:when test="${myPost!=true}">
        '/board'
    </c:when>
</c:choose>
		style="display: none">
		<input id='page' name='page' type='hidden'></input> <input id='block'
			name='block' type='hidden'></input>
	</form>
</body>
</html>