<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칭찬 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>
        #content{
            width:70%;
            margin: auto;
            margin-top:80px;
            margin-bottom:100px;
            min-width: 600px;
        }
        
        .txtArea{
            float: right;
            color: red;
        }
		
		/* board */
        .boardWrite{
            margin: auto;
            padding-right:100px;
        }

        .boardTable{
            width: 100%;
            border-top: 2px rgb(218 218 220 / 92%) solid;
            border-radius: 3px;
            border-collapse: collapse;
            font-size: 15px;
		}        

        .boardTable th{
            width: 20%;
            height: 42px;
            background-color: rgb(233 241 251 / 67%);
            border-bottom: 1px rgba(224, 226, 226, 0.918) solid;
        }
        
        .boardTable td{
            height: 42px;
            border-bottom: 1px rgba(224, 226, 226, 0.918) solid;
            padding: 0px 10px;
        }

        #ctitle,#ccontent{
            border: none;
            width: 98%;
            height: 90%;
            padding: 1px 0px;
            font-size: 15px;
        }

        #ccontent{
            resize: none;
            padding : 5px;
        }

        tr:nth-child(3), td:nth-child(3){
            height: 250px;
        }
        
        /* button */
        .btnArea{
            text-align: center;
        }

        .btnArea button{
            width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:  rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
            margin-top : 3%;
        }

        #cancelBtn{
            background-color: rgba(213, 218, 218, 0.918);
        }

    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 
	<div id="content">
        <h1>칭찬합시다</h1>
        <p class="txt">
        	병원 이용중 친절한 직원을 칭찬해주세요.<br>
        	소중한 칭찬 한마디를 귀담아 듣고, 고객 서비스에 최선을 다하겠습니다.
        </p>
        <div class="boardWrite">
            <div class="txtArea"><p>* 필수 입력 항목</p></div>
            <form action="${ contextPath }/compliment/update" method="post" enctype="multipart/form-data">
                <table class="boardTable">
                    <tr>
                        <th>고객 정보</th>
                        <td>${ loginUser.userName }</td>
                    </tr>
                    <tr>
                        <th>제목*</th>
                        <td><input type="hidden" name="cno" value=${ c.cno }><input type="text" id="ctitle" name="ctitle" value="${ c.ctitle }" required></td>
                    </tr>
                    <tr>
                        <th>내용*</th>
                        <td><textarea id="ccontent" name="ccontent" required>${ c.ccontent }</textarea></td>
                    </tr>
                    <c:if test="${ not empty alist }">
                    <tr>
                    	<th>현재 첨부 파일</th>
                    	<td>
						<c:forEach items="${ alist }" var="a">
						<img width="150" height="150" src="${ contextPath }/resources/image/cuploadFile/${ a.changeName }">
						${ a.originName } &nbsp;
						</c:forEach>
						</td>
                    </tr>
                    </c:if>
                    <tr>
                        <th>파일 첨부</th>
                        <td><input type="file" name="uploadFile1"></td>
                    </tr>
                    <tr>
                        <th>파일 첨부</th>
                        <td><input type="file" name="uploadFile2"></td>
                    </tr>
                    
                </table>

                <br>
                <br>

                <div class="btnArea">
                    <button id="modifyBtn">수정</button>
                    <button type="button" id="cancelBtn" onclick="location.href='${ contextPath }/compliment/list?page=${ param.page }'">취소</button>
                </div>
            </form>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>