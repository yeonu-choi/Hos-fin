<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        .outer {
			width: 90%;
			min-width:700px;
			height: auto;
			margin: auto;
			position:relative;
   		}
        
        #notice {
			width : 700px;
			height : 70px;
       		margin-left : 40px;
			margin-bottom : 30px;
	    }
        
        h1 {
	    	text-align : center;
	        color : #00a5db;
	        margin-top : 30px;
   	 	}

        .detailBoard {
            border : 1px solid lightgray;
            padding : 5px;
            width : 600px;
            height : 500px;
            border-radius : 3px;
        }
        
        table {
        	width : 600px;
        }


        .btnArea {
            margin-top : 20px;
            margin-bottom : 20px;
        }

        .btnArea button {
            height : 40px;
            border-radius: 3px;
            border: none;
            font-size : 18px;
        }

        #list {
            background-color: rgb(57, 133, 247);
            color : white;
            margin-right: 60px;
            width : 100px;
        }

        #submit {
            background-color: rgb(57, 133, 247);
            color : white;
            margin-right: 10px;
            width : 50px;
        }
        
        #cancel {
        	width : 50px;
        	font-size : 18px;
        }
        input {
         width : 600px;
         height : 35px;
         font-size: 18px;
     }

        textarea {
         width : 600px;
         height : 400px;
         font-size: 18px;
     }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
    <h1>불편사항</h1>
    <div class="outer" align="center">
	    <div id="notice" align="left">
	        <p id="p1">
	            고객님의 의견은 병원 서비스 향상에 도움이 됩니다.<br>
	            고객님께서 보다 편리하게 KH대학병원을 이용하실 수 있도록 모든 임직원이 최선을 다해 노력하겠습니다.<br>
	             ＊ 회신이 필요한 사안에 따라 1주 이내에 답변을 드리지만 경우에 따라 초과될 수 있습니다.<br>
	             ＊ 운영 취지에 맞지 않거나 비방 및 욕설은 관리자에 의하여 임의 삭제될 수 있습니다.
	        </p>
	    </div>
        <div class="formTable" align="center">
            <form action="${ contextPath }/complain/update" id="writeForm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="cbid" value="${ complain.cbid }" required>
                <table id="detail"> 
                    <tr>
                        <td><input type="text" name="cbtitle" maxlength="40" value="${ complain.cbtitle }" required></td>
                    </tr>
                    <tr>
                        <td><textarea name="cbcontent" style="resize:none;" required>${ complain.cbcontent }</textarea></td>
                    </tr>
                    <tr>
                        <td><input type="file" name="uploadFile">
                        <c:if test="${ !empty complain.originalfileName }">
                        <a href="${ contextPath }/complain/download?cbid=${ complain.cbid }">${ complain.originalfileName }</a>
                        <input type="hidden" name="originalfileName" value="${ complain.originalfileName }">
                        <input type="hidden" name="renamefileName" value="${ complain.renamefileName }">
                        </c:if>
                        <input type="hidden" name="cbid" value="${ complain.cbid }">
                        </td>
                    </tr>
                </table>
                 <div class="btnArea">
		            <button id="submit">수정</button>
		            <button id="cancel" onclick="history.back()">취소</button>
		        </div>
            </form>            
        </div>

       
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>