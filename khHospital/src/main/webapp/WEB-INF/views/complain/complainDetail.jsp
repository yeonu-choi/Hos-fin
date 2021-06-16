<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Complain Detail</title>
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
                margin-bottom : 30px;
                margin-left : 40px;
            }
            
            h1 {
                text-align : center;
                color : #00a5db;
                margin-top : 40px;
                }
    
            .detailComplain {
                border : 1px solid lightgray;
                padding : 5px;
                width : 600px;
                height : 500px;
                border-radius : 3px;
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
                margin-right : -200px;
            }
            
            .detailComplain {
                width : 600px;
                height : 600px;
                border-collapse: collapse;
            } 
            
            th, td {
                border: 1px solid black;
                padding : 6px;
            }
            
            th {
            background-color : #87CEFA;
            }
        
            .detailComplain th:nth-child(1) {
                width : 60px;
                height : 30px;
            }
    
            #list {
                background-color: rgb(57, 133, 247);
                color : white;
                margin-right: 80px;
                width : 100px;
            }
    
            #modify {
                background-color: rgb(57, 133, 247);
                color : white;
                margin-right: 10px;
                width : 50px;
            }
            
            #delete {
                width : 50px;
                font-size : 18px;
            }
    
            textarea {
                display: inline;
                margin-top: -15px;
            }
    
            .replyBtn {
                display: inline;
                position: relative;
                top : -15px;
            }
    
            .replyWriteArea {
                width : 600px;
                height : 40px;
                margin-top : 40px;
            }

            .replySelectArea {
                width : 600px;
            }
    
            #addReply {
                height : 35px;
                background-color: rgb(57, 133, 247);
                color : white;
                border : none;
                border-radius: 3px;
                font-size: 15px;
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
            
                <table class="detailComplain">
                    
                    <tr>
                        <th>글번호</th>
                        <td align="center">${ complain.cbid }</td>
                        <th>작성자</th>
                        <td align="center">${ complain.cbwriter }</td>
                        <th>작성일</th>
                        <td align="center" width="100px"><fmt:formatDate value="${ complain.cbcreateDate }" pattern="yy.MM.dd"/></td>
                    </tr>
                    <tr>
                        <th colspan="1">제목</th>
                        <td colspan="5">${ complain.cbtitle }</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5" height="400px">${ complain.cbcontent }</td>
                    </tr>
                    
                    <c:if test="${ !empty complain.originalfileName }">
                    <tr>
                         <td colspan="6" height="20px">
                        <img src="../resources/images/clip.png" width="20px" height="20px">
                        <a href="${ contextPath }/resources/cbuploadFiles/${ complain.renamefileName }"
                        download="${ complain.originalfileName }">
                        ${ complain.originalfileName }</a>
                        </td>
                    </tr>
                    </c:if>
                </table>
            </div>
    
            <div class="btnArea">
                <button id="list" onclick="location.href='${ contextPath }/complain/list?page=${ param.page }'">목록으로</button>
                <c:if test="${ loginUser.userId eq complain.userid }">
                <button id="modify" onclick="location.href='${contextPath}/complain/updatePage?cbid=${complain.cbid}&page=${ param.page }'">수정</button>
                <button id="delete" onclick="location.href='${contextPath}/complain/delete?cbid=${complain.cbid}'">삭제</button>
                </c:if>
            </div>

        <div class="replyArea">

            <div class="replyWriteArea">
                <textarea id="replyContent" cols="65" rows="2" style="resize:none;" placeholder="댓글을 입력해주세요."></textarea>
                <div class="replyBtn">
                <button id="addReply">등록</button>
                </div>
            </div>

            <div class="replySelectArea">
                <table id="replyTable" align="left">
                	<c:if test="${ !empty rlist }">
                		<c:forEach items="${ rlist }" var="r">
                        <tr>
                            <td>${ r.rwriter }</td>
                            <td>${ r.rcontent }</td>
                            <td>${ r.rcreateDate }</td>
                            <td><button>수정</button><button>삭제</button></td>
                        </tr>
                        </c:forEach>
                    </c:if>
                </table>
            </div>

        </div>
    </div>
    <script>
		$("#addReply").on("click", function(){
		    	var rcontent = $("#replyContent").val();
		    	var cbid = ${ complain.cbid};
		    	
		    	$.ajax({
		    		url : "${contextPath}/complain/insertReply",
		    		data : { rcontent : rcontent, cbid : cbid },
		    		type : "post",
		    		dataType : "json",
		    		success : function(data) {
		    			console.log(data);
		    			
		    			td = $("#replyTable");
		    			td.html("");
		    			
		    			for(var i in data) {
		    				tr = $("<tr>");
		    				rwriter = $("<td width='50'>").text(data[i].rwriter);
		    				rcontent = $("<td>").text(data[i].rcontent);
		    				rcreateDate = $("<td width='50'>").text(data[i].rcreateDate);
		    				
		    				tr.append(rwriter, rcontent, rcreateDate);
		    				td.append(tr);
		    			}
		    			$("#replyContent").val("");
		    		}
		    	})
		    })
    </script>
    <jsp:include page ="../common/footer.jsp"/>
    </body>
</html>