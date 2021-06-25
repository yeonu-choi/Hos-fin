<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq listPage</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

header, nav, section, body, footer {
	display: block;
}

body {
	margin: auto;
}

/* 바디 화면  */
/* ------------- 타이틀 option 영역 ------------------------ */
#outer {
	height: 100%;
	width: 1400px;
	margin: auto;
}

#D_search02 {
	width: 100%;
	height: 6%;
	text-align: center;
}

#D_title02 {
	height: 100%;
	width: 50%;
	margin: auto;
}

.top_title {
	font-size: 17px;
	color: rgb(58, 56, 56);
	text-align: center;
}

.title {
	text-align: center;
	font-size: 30px;
	padding: 5px;
	font-weight: bold;
	color: rgb(147, 156, 156);
}

/* ------------content--------------- */
#content {
	width: 90%;
	margin: auto;
}

.faqArea {
	width: 800px;
	margin: auto;
}

.pageCount {
	margin-top: 20px;
	text-align: center;
}

.mi-blank {
	height: 50px;
}
/* ------------------- 검색 선택 필터 ------------------------- */
#D_title02 select {
	border-radius: 5px;
	width: 130px;
	height: 33px;
	border: 1px solid gray;
}

input[type=search] {
	border: 1px solid gray;
	border-radius: 5px;
	width: 250px;
	height: 33px;
}

#searchFaq {
	border: 1px solid gray;
	border-radius: 5px;
	width: 70px;
	height: 33px;
	border: 1px solid gray;
	background-color: white;
	cursor: pointer;
}

/* ----------------------------------------------------------- */
div.menu {
	font-size: 17px;
	font-weight: bold;
	color: rgb(83, 83, 83);
	padding: 12px 20px;
	cursor: pointer;
	border: none;
	outline: none;
	background: none;
	width: 100%;
	text-align: left;
	border: 1px solid rgb(184, 182, 182);
	border-radius: 10px;
	/* margin-top: 20px; */
}

pre.contents {
	display: none;
	background-color: rgb(225, 240, 250);
	padding: 15px 20px;
	border-radius: 10px;
	font-size: 15px;
	padding-bottom: 30px;
    line-height: 23px;
    color: rgb(83, 84, 85);
    font-family: "돋움";
    line-height: 27px;
}

.blank {
	height: 70px;
}

/* ------------ 글작성 버튼 ------------- */
.btnForm {
	margin-top: 25px;
	margin-left: 600px;
}

#insert_btn {
	width: 100px;
	height: 30px;
	border: 1px solid gray;
	background-color: white;
	cursor: pointer;
}

#update_btn {
	width: 70px;
	height: 24px;
	border: 1px solid gray;
	background-color: white;
	cursor: pointer;
}

/* ------------------------- */
.tableArea {
	border: 3px solid #f3f5f7;
	margin: auto;
	width: 80%;
	min-width: 580px;
	padding: 5px;
	margin-top: 40px;
}

#listTable {
	text-align: center;
	width: 100%;
	min-width: 570px;
	line-height: 2.5;
	border-collapse: collapse;
	font-family: 'Nanum Gothic', sans-serif;
}

#listTable tr:not(:last-child) {
	border-bottom: 1px solid #f3f5f7;
}

#listTable td {
	cursor: pointer;
}

#listTable th:nth-child(1) {
	width: 130px;
}

#listTable th:nth-child(2) {
	width: 50px;
}

#listTable th:nth-child(3) {
	width: 500px;
}

#listTable th:nth-child(4) {
	width: 100px;
}

#listTable th:nth-child(5) {
	width: 100px;
}

#listTable td:nth-child(5) {
	line-height: 1px;
}

#nameStyle {
	/* font-weight : lighter;  */
	color: gray;
}


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<section id="outer">
		<div>
			<p class="top_title">진료과별 자주묻는 질문을 확인할 수있습니다.</p>
			<p class="title">FAQ</p>
		</div>

		<section id="D_search02">
			<div id="D_title02">
				<form action="${ contextPath }/faq/search" method="GET">
					<select name="searchId" >
						<option value="1" <c:if test="${ param.searchId eq 1 }">selected</c:if>>외과</option>
						<option value="2" <c:if test="${ param.searchId eq 2 }">selected</c:if>>호흡기내과</option>
						<option value="3" <c:if test="${ param.searchId eq 3 }">selected</c:if>>순환기내과</option>
						<option value="4" <c:if test="${ param.searchId eq 4 }">selected</c:if>>내분비내과</option>
						<option value="5" <c:if test="${ param.searchId eq 5 }">selected</c:if>>소화기내과</option>
						<option value="6" <c:if test="${ param.searchId eq 6 }">selected</c:if>>소아외과</option>
						<option value="7" <c:if test="${ param.searchId eq 7 }">selected</c:if>>소아청소년과</option>
						<option value="8" <c:if test="${ param.searchId eq 8 }">selected</c:if>>산부인과과</option>
						<option value="9" <c:if test="${ param.searchId eq 9 }">selected</c:if>>내과</option>
						<option value="10" <c:if test="${ param.searchId eq 10 }">selected</c:if>>진단검사의학과</option>
						<option value="11" <c:if test="${ param.searchId eq 11 }">selected</c:if>>치과</option>
						<option value="12" <c:if test="${ param.searchId eq 12 }">selected</c:if>>신경과</option>
						<option value="13" <c:if test="${ param.searchId eq 13 }">selected</c:if>>정신건강의학과</option>
						<option value="14" <c:if test="${ param.searchId eq 14 }">selected</c:if>>비뇨의학과</option>
						<option value="15" <c:if test="${ param.searchId eq 15 }">selected</c:if>>마취통증의학과</option>
						<option value="16" <c:if test="${ param.searchId eq 16 }">selected</c:if>>행정과</option>
						<option value="31" <c:if test="${ param.searchId eq 31 }">selected</c:if>>유방갑상선암센터</option>
						<option value="32" <c:if test="${ param.searchId eq 32 }">selected</c:if>>소화기내시경센터</option>
						<option value="33" <c:if test="${ param.searchId eq 33 }">selected</c:if>>시험관아기센터</option>
						<option value="34" <c:if test="${ param.searchId eq 34 }">selected</c:if>>로봇수술센터</option>
						<option value="35" <c:if test="${ param.searchId eq 35 }">selected</c:if>>난임센터</option>
					</select> 
					<select name="searchCondition">
						<option value="title"
							<c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
						<option value="contents"
							<c:if test="${ param.searchCondition == 'contents' }">selected</c:if>>내용</option>
						<option value="total"
							<c:if test="${ param.searchCondition == 'total' }">selected</c:if>>전체</option>
					</select> 
					<input type="search" name="searchValue" value="${ param.searchValue }">
					<button id="searchFaq">검색</button>
					<!-- <input type="button" value="검색" id="searchFaq"> -->
				</form>
			</div>
			<c:if test="${ loginUser.userId eq 'admin11' }">
				<div class="btnForm">
					<button id="insert_btn"
						onclick="location.href='${contextPath}/faq/write'">등록</button>
				</div>
			</c:if>
		</section>
	
		<section id="content">
			<c:choose>
				<c:when test="${loginUser.userId eq 'admin11' }">
					<div class="tableArea">
						<table id="listTable">
							<tr>
								<th>카테고리</th>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							
							<c:if test="${ fail == null }">
							<c:forEach items="${ adList }" var="f">
								<tr onclick="selectFaq(${f.fid});">
									<c:choose>
										<c:when test="${ f.dname != null }">
											<td>${ f.dname }</td>
										</c:when>
										<c:when test="${ f.cname != null }">
											<td>${ f.cname }</td>
										</c:when>
									</c:choose>
									<td>${ f.fid }</td>
									<td>${ f.ftitle }</td>
									<td>${ f.fwriter }</td>
									<td>${ f.fcreatedate }</td>
								</tr>
							</c:forEach>
							</c:if>
								<c:if test="${ fail != null }">
								<h2>조회 실패</h2>
								</c:if>
						</table>
					</div>
					
					<c:if test="${ param.searchValue eq null }">
						<c:set var="pa" value="/faq/list" scope="page"/>
					</c:if>
					<c:if test="${ param.searchValue ne null }">
						<c:set var="pa" value="/faq/search" scope="page"/>
					</c:if>
				
					<div class="pageCount">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							[이전] &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<%-- <c:url var="before" value="/faq/list"> --%>
							<c:url var="before" value="${ pa }">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
								<c:if test="${ param.searchValue ne null }">
									<c:param name="searchId" value="${ param.searchId }"/>
									<c:param name="searchCondition" value="${ param.searchCondition }"/>
									<c:param name="searchValue" value="${ param.searchValue }"/>
								</c:if>
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
						</c:if>
						
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[ ${ p } ]</b></font> &nbsp;
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<%-- <c:url var="pagination" value="/faq/list"> --%>
								<c:url var="pagination" value="${ pa }">
									<c:param name="page" value="${ p }" />
									<c:if test="${ param.searchValue ne null }">
										<c:param name="searchId" value="${ param.searchId }"/>
										<c:param name="searchCondition" value="${ param.searchCondition }"/>
										<c:param name="searchValue" value="${ param.searchValue }"/>
									</c:if>
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<%-- <c:url var="after" value="/faq/list"> --%>
							<c:url var="after" value="${ pa }">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
								<c:if test="${ param.searchValue ne null }">
									<c:param name="searchId" value="${ param.searchId }"/>
									<c:param name="searchCondition" value="${ param.searchCondition }"/>
									<c:param name="searchValue" value="${ param.searchValue }"/>
								</c:if>
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</div>

					<script>
					  function selectFaq(fid){
						  location.href='${ contextPath }/faq/detail?fid=' + fid;
					  }
			 		</script>
				</c:when>
				
				<c:otherwise>
					<div class="mi-blank"></div>
					<c:forEach items="${adList}" var="f">
						<div class="faqArea">
							<div class="faqFid" style="display: none;">${f.fid}</div>
							<div class="menu">
								<c:choose>
									<c:when test="${ f.dname != null }">
										<label id="nameStyle">${ f.dname }&nbsp; : &nbsp; </label>
									</c:when>
									<c:when test="${ f.cname != null }">
										<label id="nameStyle">${ f.cname }&nbsp; : &nbsp;</label>
									</c:when>
								</c:choose>
								${f.ftitle}
							</div>
							<pre class="contents" style="width: 100%; overflow: auto; white-space: pre-wrap">${f.fcontent}</pre><br>
							
							<%-- <button id="update_btn" onclick="location.href='${contextPath}/faq/detail?fid'+fid;">수정</button> --%>
						</div>
					</c:forEach>

					<div class="pageCount">
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							[이전] &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<%-- <c:url var="before" value="/faq/list"> --%>
							<c:url var="before" value="${ pa }">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
								<c:if test="${ param.searchValue ne null }">
									<c:param name="searchId" value="${ param.searchId }"/>
									<c:param name="searchCondition" value="${ param.searchCondition }"/>
									<c:param name="searchValue" value="${ param.searchValue }"/>
								</c:if>
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
						</c:if>
						
						<!-- 페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[ ${ p } ]</b></font> &nbsp;
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<%-- <c:url var="pagination" value="/faq/list"> --%>
								<c:url var="pagination" value="${ pa }">
									<c:param name="page" value="${ p }" />
									<c:if test="${ param.searchValue ne null }">
										<c:param name="searchId" value="${ param.searchId }"/>
										<c:param name="searchCondition" value="${ param.searchCondition }"/>
										<c:param name="searchValue" value="${ param.searchValue }"/>
									</c:if>
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<%-- <c:url var="after" value="/faq/list"> --%>
							<c:url var="after" value="${ pa }">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
								<c:if test="${ param.searchValue ne null }">
									<c:param name="searchId" value="${ param.searchId }"/>
									<c:param name="searchCondition" value="${ param.searchCondition }"/>
									<c:param name="searchValue" value="${ param.searchValue }"/>
								</c:if>
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</div>

					<script>
		            $(function(){
		                $("div.menu").click(function(){
		                    if($(this).next("pre.contents").css("display") == 'none'){
		                        $(this).siblings("pre.contents").slideUp();
		                        $(this).next("pre.contents").slideDown();
		                    } else {
		                        $(this).next("pre.contents").slideUp();
		                    }
		                });
		            });
        			</script>

				</c:otherwise>
			</c:choose>
		</section>

		<div class="blank"></div>

	</section>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>