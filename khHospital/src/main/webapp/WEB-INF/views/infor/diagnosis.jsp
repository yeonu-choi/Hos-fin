<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<style>
.title h1 {
    margin-top: 50px;
    text-align: center;
    height: 200px;
    font-size: 42px;
    line-height: 200px;
    
}

.title p {
    border-top: 3px solid #a08b65;
    text-align: center;
    margin-bottom: 50px;
}

/* container */


.guide_wrap {
   
    height: 1500px;
    
}

.guide_wrap > div {
    width: 1200px;
}

.diagnosis {
   
    margin-left: auto;
    margin-right: auto;

    
}

.diagnosis h4 {
    border-bottom : 3px solid #a08b65;
    text-align: left;
    margin-bottom: 50px;
    padding-bottom: 17px;
    font-size: 30px;
    font-weight: 600;
    line-height: 52px;
    
    padding-top: 30px;
}

.diagnosis_time > div:first-child {
    border: 1px solid;
    margin-bottom: 100px;
    border-bottom: 1px solid #ebebeb;
    width: 50px;
}

.diagnosis img {
    margin-right: 10px;
    padding: 30px;
    background-color:  #006a79;
    border-radius: 130px;
    margin-left: 20px;
}

.diagnosis_time div {
    
    display: inline-block;
    margin-left: 40px;
}

.diagnosis_time > div:last-child {
    display: inline-block;
    width: 700px;
    
    
}

.diagnosis_time div dl {
    border-left: 2px solid;
    border-top: 0;
    line-height: 85px;
    height: 100px;
    text-align: center;
    font-size: 15px;
    font-weight: 700;
    margin-left: 100px;
    
}

.diagnosis_time div dl dt {
    width: 100px;
    float: left;
    
}

.diagnosis_time div dl dd {
   
    width: 200px;
    float: left;
}

/* 접수및 예약*/
.diagnosis_receipt {
   
    margin-top: 60px;
    height: 600px;
}

.diagnosis_receipt div{
    
    display: inline-block;
    margin-left: 40px;
    
}

.diagnosis_receipt div:last-child {
    border-left: 2px solid;
    display: inline-block;
    margin-left: 130px;

}

.diagnosis_receipt table {
    
    height: 300px;
    text-align: center;
    width: 670px;
    font-size: 15px;
    font-weight: 700;
    
}

</style>
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