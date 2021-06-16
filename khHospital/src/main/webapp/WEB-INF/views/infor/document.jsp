<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/document.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div class="title">
    
        <h1>증명서발급</h1>

        <p>
            진료 기록 열람 및 사본 발급   
        </p>
    </div>

    <!-- container-->
    <div class="container" id="container">
        <!-- content -->
        <div class="content_wrap">
            <!-- 발급 허가 절차 -->
            <div class="admission_step">
                <h4>증명서 발급 절차</h4>
                
                <ul class="step_four">
                    <li>
                        <div>
                            <strong>
                                "01"
                            </strong>
                            <span>접수</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <strong>
                                "02"
                            </strong>
                            <span>주치의 상담</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <strong>
                                "03"
                            </strong>
                            <span>주치의 확인 후 날인</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <strong>
                                "04"
                            </strong>
                            <span>수납, 증명서 발행</span>
                        </div>
                    </li>
                </ul>
                <div>
                    <ul>
                        <li>
                            · 입원(퇴원) 중 발급을 원하시는 경우 해당병동 간호사실에 신청하신 후 발급 받으시면 됩니다.
                        </li>
                        <li>
                            · 외래 진료를 받으신 경우 해당과 접수 후 담당주치의와 상의하셔서 받으시면 됩니다.
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 서류 다운로드 -->
            <div class="admission_dc">
                <div class="document_dl">
                    <h4>증명서 발급시 준비서류</h4>

                    <div class="download_wrap">
                    
                        <a href="${ contextPath }/resources/cuploadFiles/document1.docx" download="${ contextPath }/resources/cuploadFiles/document1.docx">
						진료기록 열람 및 사본발급</a>
                        
                    </div>
                </div>
                <div class="admission_guide">
                    <ol>
                        <li>
                            환자본인이 요청 시
                            <h6>- 본인 신분증 지참</h6>
                        </li>
                        <li>
                            환자의 가족, 대리인이 요청 시
                            <h6>- 진료기록 열람 및 사본발급 구비서류와 동일</h6>
                        </li>
                    </ol>
                </div>

            </div>
        
        </div>
    
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>