<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/diagnosis.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div class="title">
        <h1>진료안내</h1>

        <p>
            진료 정보시간을 안내합니다.
        </p>
    </div>

     <!-- container-->
     <div class="container" id="container">
          <!-- content -->
        <div class="guide_wrap">
            <div class="diagnosis">
                <div class="diagnosis_time">
                    <h4>접수 시간</h4>
                    <div>
                        <img src="${contextPath}/resources/images/timeicon1.png">
                    </div>
                    <div>
                        <dl>
                            <dt>평일</dt>
                            <dd>08:30 ~ 17:00</dd>
                            <dd>점심시간 13:00 ~ 14:00</dd>
                        </dl>
                        <dl>
                            <dt>토요일</dt>
                            <dd>08:30 ~ 12:30</dd>
                            <dd></dd>
                        </dl>
                        <dl>
                            <dt>응급진료</dt>
                            <dd>365일 진료</dd>
                            <dd>응급, 분만 환자</dd>
                        </dl>     
                    </div>


                
                </div>
                <div class="diagnosis_receipt">
                    <h4>접수 및 예약 안내</h4>
                   
                    <div>
                        <img src="${contextPath}/resources/images/timeicon2.png">
                    </div>
                    <div>
                        <table>
                            <colgroup>
                            <col width="220">
                            <col width="120">
                            <col>
                            </colgroup>
                            <tr>
                                <th rowspan="2">예약한경우</th>
                                <th>초진</th>
                                <td>원무과 창구에서 예약 확인 후 진료과에서 접수</td>                            
                            </tr>
                            <tr>
                                <th>재진</th>
                                <td>진료과 간호접수대에서 접수</td>
                            </tr>
                            <tr>
                                <th rowspan="2">예약없이 내원한 경우</th>
                                <th>초진</th>
                                <td>원무과 창구에서 건강보험증 또는 신분증을 창구 직원에게 제출하여 접수</td>                            
                            </tr>
                            <tr>
                                <th>재진</th>
                                <td>원무과 창구에서 접수</td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
          

        </div>

     </div>
     
     <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>