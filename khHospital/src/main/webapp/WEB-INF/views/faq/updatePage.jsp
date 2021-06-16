<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 작성 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
		* { box-sizing: border-box; }

        header,
        nav,
        section,
        body,
        footer {
            display: block;
            /* border: 1px solid red; */
        }

       body {
          /*  width: 1200px;
           height: 1200px; */
           margin: auto;
       }
       
       /* 바디 화면  */
       #outer {
           /* border: 1px solid red; */
           width: 1400px;
           height: 100%;
           max-width: 100%;
           margin: auto;
           margin-bottom: 40px;
       }

       #content {
           /* border: 1px solid green; */
           width: 1000px;
           height: 100%;
           margin: auto;
       }

       #faqTop {
           /* border: 1px solid blue; */
           width: 1000px;
           height: 140px;
           margin: auto;
           text-align: center;
           font-size: 30px;
           font-weight: bold;
           color: gray;
       }
       
       #updateFaq {
           padding: 20px 130px;
           margin: auto;
       }

       select[name=did]{
           width: 140px;
           height: 35px;
           margin-bottom: 12px;
       }

       #f_title {
           width: 700px;
           height: 35px;
           margin-bottom: 20px;
       }

       textarea {
           width: 700px;
           height: 500px;
           padding: 10px 10px 10px 10px;
       }
       
      
       #btnArea {
           /* border: 1px solid slategray; */
           width: 700px;
           height: 80px;
           /* margin: auto; */
           text-align: center;
           padding: 30px 190px;
       }

       #updatebtn,
       #deletebtn {
           width: 100px;
           height: 35px;
           border-radius: 5px;
           border: 1px solid gray;
           cursor: pointer;
       }
       
      
    </style>
</head>
<body>
	<section id="outer">
        <div id="faqTop">
            <h1>FAQ </h1>
        </div>
        <div id="content">
            <div class="insertArea">
                <form action="${contextPath }/faq/update" method="POST" id="updateFaq">
                <select name="did">
                        <option value="1">외과</option>
                        <option value="2">호흡기내과</option>
                        <option value="3">순환기내과</option>
                        <option value="4">내분비내과</option>
                        <option value="5">소화기내과</option>
                        <option value="6">소아외과</option>
                        <option value="7">소아청소년과</option>
                        <option value="8">산부인과과</option>
                        <option value="9">내과</option>
                        <option value="10">진단검사의학과</option>
                        <option value="11">치과</option>
                        <option value="12">신경과</option>
                        <option value="13">정신건강의학과</option>
                        <option value="14">비뇨의학과</option>
                        <option value="15">마취통증의학과</option>
                        <option value="16">행정과</option>
                        <option value="31">유방갑상선암센터</option>
                        <option value="32">소화기내시경센터</option>
                        <option value="33">시험관아기센터</option>
                        <option value="34">로봇수술센터</option>
                        <option value="35">난임센터</option>
                </select>
                <input type="text" name="fid" value="${ faq.fid }" style="display:none;">
                <input type="text" name="fwriter" value="${ loginUser.userId }" style="display:none;">
                <input type="text" name="ftitle" id="f_title" value="${ faq.ftitle }">
                <textarea name="fcontent" style="resize:none;">${faq.fcontent }</textarea>
                <div id="btnArea">
                    <button id="updatebtn">등록</button>
                </div>
                
                </form>
            </div>
        </div>
        <script>
        	
        </script>
    </section>
</body>
</html>