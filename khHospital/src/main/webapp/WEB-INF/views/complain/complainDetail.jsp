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
    
            #detailComplain {
                border : 1px solid lightgray;
                padding : 5px;
                border-radius : 3px;
                width : 600px;
                height : 600px;
                border-collapse: collapse;
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
            
            #detailComplain th {
                border: 2px solid lightgray;
                padding : 6px;
            }
            
            #detailComplain td {
                border: 2px solid lightgray;
                padding : 6px;
            }
            
            #detailComplain th {
                background-color : #87CEFA;
            }
        
            #detailComplain th:nth-child(1) {
                width : 70px;
                height : 30px;
            }

            #detailComplain td:nth-child(2) {
                width : 50px;
            }

            #detailComplain th:nth-child(3) {
                width : 70px;
            }

            #detailComplain td:nth-child(4) {
                width : 130px;
            }

            #detailComplain th:nth-child(5) {
                width : 70px;
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
                border : 1px solid lightgray;
                height : auto;
            }
            
            #addReply {
                height : 35px;
                background-color: rgb(57, 133, 247);
                color : white;
                border : none;
                border-radius: 3px;
                font-size: 15px;
            }
            
            #replyTable {
            	border-collapse: collapse;
            	width : 700px;
            	height : auto;
            }
            
            #rUpdate {
            	background-color: lightblue;
                color : white;
                border : none;
                border-radius: 3px;
            }
            
            #rDelete {
            	background-color: gray;
                color : white;
                border : none;
                border-radius: 3px;
            }
            
            .replyArea {
            	height : auto;
            }
            
            .rMo {
           		width : 600px;
           		hdight : 100px;
           		margin : 10px;
            }
            
            #replyContent2 {
            	
            }
            
            #rModiBtn {
            	width : 80px;
            	height : 30px;
            	background : lightblue;
            	color : white;
            	border : none;
            	border-radius : 3px;
            	
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
             <br><br>
            <div class="formTable" align="center">
            
                <table id="detailComplain">
                    
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
                        <td colspan="5" height="400px" style="vertical-align:top">${ complain.cbcontent }</td>
                    </tr>
                    
                    <c:if test="${ !empty complain.originalfileName }">
                    <tr>
                    	<th>첨부파일</th>
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
                <c:if test="${ loginUser.userId eq complain.userid || loginUser.userName == '관리자'}">
                <button id="modify" onclick="location.href='${contextPath}/complain/updatePage?cbid=${complain.cbid}&page=${ param.page }'">수정</button>
                <button id="delete" onclick="deleteComple();">삭제</button>
                </c:if>
            </div>
		
			 <div class="replyArea">
				<c:if test="${ loginUser.userName eq '관리자' }">
		            <div class="replyWriteArea">
		                <textarea id="replyContent" cols="65" rows="2" style="resize:none;" placeholder="댓글을 입력해주세요."></textarea>
		                <div class="replyBtn">
		                <button id="addReply">등록</button>
		                </div>
		            </div>
	            </c:if>
	
				
	            <div class="replySelectArea">
	                <table id="replyTable" align="left">
	                	<c:if test="${ !empty rlist }">
		                	<c:forEach items="${ rlist }" var="r">
		                        <tr>
		                            <td>${ r.rwriter }</td>
		                            <td>${ r.rcreateDate }</td>
		                        </tr>
		                        <tr>
		                            <td colspan="2">${ r.rcontent }</td>
		                            <c:if test="${loginUser.userName eq '관리자' }">
		                            <td>
			                            <button type="button" id="rUpdate" onclick="rUpdate(this,${r.rno}, '${r.rcontent}')">수정</button>
			                            <button type="button" id="rDelete" onclick="rDelete(this,${r.rno})">삭제</button>
		                            </td>
		                            </c:if>
		                            
		                        </tr>
		                        
		                     </c:forEach>
	                	</c:if>
	                		
	                    
	                    <c:if test="${ empty rlist }">
	                    <tr>
	                    	<td colspan="2">작성된 댓글이 없습니다.</td>
	                    </tr>
	                    </c:if>
	                </table>
	            </div>
	
	        </div>
       
    </div>
    <script>
    	function deleteComple() {
    		confirm("게시글을 삭제하시겠습니까?");
    		location.href='${contextPath}/complain/delete?cbid=${complain.cbid}';
    	}
    </script>
    <script>
		$("#addReply").on("click", function(){
		    	var rcontent = $("#replyContent").val();
		    	var cbid = ${ complain.cbid };
		    	
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
		    				td.append(tr);
		    				rcreateDate = $("<td width='50'>").text(data[i].rcreateDate);
		    				
		    				tr.append(rwriter, rcontent, rcreateDate);
		    				td.append(tr);
		    				window.location.href="${contextPath}/complain/detail?cbid=" + cbid;
		    			}
		    			$("#replyContent").val("");
		    			
		    		}
		    	});
		    });
		
		 function rDelete(e, rno) {
			 var cbid = ${complain.cbid};
			 
			if(!confirm("댓글을 삭제하시겠습니까?")) return;
			
			$.ajax({
				url : "${contextPath}/complain/deleteReply",
				type : "post",
				data : {"rno" : rno},
				success : function(data) {
					if(data == "confirm") {	
						alert("삭제되었습니다.");
						window.location.href="${contextPath}/complain/detail?cbid=" + cbid;
					} else {
						alert("삭제에 실패하였습니다.");
					}
				},
				error : function(e) {
					console.log(e);
				}
			})
			
		}
		 
		function rUpdate(e, rno, rcontent) {
			var td = $(e).parents('td');
	         td.css('visibility','hidden');
			$(e).parent().prev().html("");
			$(e).parent().prev().html("<br><div class='rMo'><textarea id='replyContent2' rows='2' cols='70'>" + rcontent + "</textarea><div id = 'rModi' align='center'><button id='rModiBtn' onclick='replyModify(this," + rno + ",replyContent2.value)'>댓글수정</button></div></div>");
		
			
			
			$("#replyContent2").focus();
			$("#replyContent2").val(rcontent);
		}
		
		function replyModify(e, rno, rcontent){
			var cbid = ${complain.cbid};
	    	var rarea = $(e).parent().parent();
	    	var modiBtn = $(e).parent().parent().next().children().first();
	    	
	    	$.ajax({
				url : "${contextPath}/complain/updateReply",
				data : {"rno" : rno, "rcontent" : rcontent},
				type : "post",
				dataType : "json",
				success : function(data){
					if(data.rcontent != null){
						rarea.html("");
						rarea.html(data.rcontent);
						modiBtn.removeAttr("onclick");
						modiBtn.attr("onclick", "rModify(this,'" + rno + "','" + rcontent + "')");
						window.location.href="${contextPath}/complain/detail?cbid=" + cbid;
					} else {
						alert('댓글 수정에 실패했습니다.');
					}	
				},
				error : function(e){
					console.log(e);
				}
			});
	    }
    </script>
    
    <br><br><br><br><br>
    <jsp:include page ="../common/footer.jsp"/>
    </body>
</html>