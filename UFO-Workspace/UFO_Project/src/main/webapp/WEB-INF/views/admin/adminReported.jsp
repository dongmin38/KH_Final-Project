<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 신고 관리</title>

	<link href="resources/css/adminReported.css" rel="stylesheet">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!--
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">
-->
</head>
<body>
	<!-- 전체 영역 -->
    <div class="wrap">

		<!-- 플로팅 버튼 영역 -->
        <jsp:include page="../common/floatingButton.jsp" />

		<!-- 헤더 영역 -->
        <jsp:include page="../common/header.jsp" />
	
		
        <!-- 컨텐츠 영역 (개별 구현 구역) -->
        <div id="content_container">
        	
	        <table id="admin_profile">
	            <tr>
	                <td width="220"><img src="resources/image/user/profile/admin.png" width="170" height="170"></td>
	                <td width="380" style="font-size:50px; font-weight:900;">관리자</td>
	            </tr>
	        </table>
	    	
	    	<!-- !!! 본인이 맡은 탭 div에 id="selected_tab" 붙어녛기 !!!-->
		    <div id="admin_mypage_navi">
		        <div><a href="admin_list.me">회원 관리</a></div>
		        <div><a href="">콘텐츠 관리</a></div>
				<div><a href="commentList.ad">코멘트 관리</a></div>
		        <div><a href="">이용권 관리</a></div>       
		        <div id="selected_tab"><a href="reportManagement.ad">신고 관리</a></div>
		        <div><a href="admin_stat.st">통계 관리</a></div>
			</div>

			<!-- 이곳부터 본인 화면 구현 -->
			<div id="reportManagement">
				<br>
				<div id="reportCategory">
					<!-- 구현하는 페이지 option에 옵션 selected 넣을 것 -->
					<select id="reportPageTab">
						<option>커뮤니티 글</option>
						<option>커뮤니티 댓글</option>
						<option value="comment" name="comment" selected>코멘트</option>
					</select>
					<div style="text-align:right; color: white; font-size:bold;"><button type="button" onclick="processedCommentList();">처리된 코멘트 보기</button></div>
				</div>
				
					<div id="commentListAll">
						<br>
					<c:choose>
						<c:when test="${ not empty list }">
							<table id="commentTable">
								<thead>
									<tr id="comment_head" class="line">
										<th class="comment_head1" width="10%;">작성자</th>
										<th class="comment_head1" width="10%;">작성일</th>
										<th class="comment_head1" width="10%;">코멘트 번호</th>
										<th class="comment_head1" width="25%;">코멘트 내용</th>
										<th class="comment_head1" width="20%;">신고사유</th>
										<th class="comment_head1" width="8%;">신고처리</th>
										<th class="comment_head1" width="17%;">삭제상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="r" items="${ list }">
										<tr class="personalComment">
											<td id="userMail">${ r.userId }</td>
											<td id="commentDate">${ r.reviewDate }</td>
											<td id="commentNo">${ r.reviewNo }</td>
											<td id="review_content">${ r.reviewContent }</td>
											<td id="reportedReason">${ r.reportReason }</td>
											<td id="reportedCount">${ r.reportStatus }</td>
											<td>
												<input type="hidden" id="commentReportNo" name="commentReportNo" value=${ r.reportNo }>
												<input type="hidden" id="commentReviewNo" name="commentReviewNo" value=${ r.reviewNo }>
												<button type="button" class="btn btn-danger" id="deleteReportedComment">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
		
							<br><br>
		
							<div id="pagingArea">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<button type="button" onclick="location.href='#';" disabled>«</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='reportManagement.ad?cpage=${ pi.currentPage - 1}';">«</button>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
									<button type="button" onclick="location.href='reportManagement.ad?cpage=${ p }';">${ p }</button>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<button type="button" onclick="location.href='#';" disabled>»</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="location.href='reportManagement.ad?cpage=${ pi.currentPage + 1}';">${ p }</button>
									</c:otherwise>
								</c:choose>
							</div>
							</c:when>
							<c:otherwise>
								조회된 내역이 없습니다.
							</c:otherwise>
							</c:choose>
								
				</div> <!-- commentListAll 영역 끝 -->
				
				<script>
					$("#commentListAll").on("click", "#deleteReportedComment", function(){
						
						const reportNo = $(this).siblings("#commentReportNo").val();
						const reviewNo = $(this).siblings("#commentReviewNo").val();
						
						// console.log(reportNo);
						// console.log(reviewNo);
						
						if(confirm("해당 코멘트를 삭제 처리하시겠습니까?")) {
							
							$.ajax({
								url : "deleteReportedComment.ad",
								type : "get",
								data : { reportNo : reportNo,
										 reviewNo : reviewNo
									   },
								success : function(result) {
									
									if(result > 0) {
										alert("성공적으로 처리되었습니다.");
										location.reload();
									}
									
								},
								error : function() {
									console.log("신고된 댓글 삭제용 ajax 통신 실패!");
								}
								
							});
						}
					
					});
					
					function processedCommentList() {
						location.href="processedCommentList.ad";
					}
				</script>

			</div>
			
        </div>

		<!-- 푸터 영역 -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>