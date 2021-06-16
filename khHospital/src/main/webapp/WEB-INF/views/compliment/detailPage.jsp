<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칭찬 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        #content{
            width:70%;
            margin: auto;
            margin-top:80px;
            margin-bottom:100px;
            min-width: 600px;
        }
		
		/* board */
        .boardArea{
            margin: auto;
            margin-top: 50px;
            padding-right:100px;
        }

        .boardArea table{
            width: 100%;
            font-size: 15px;
            border-collapse : collapse;
        }

        .boardArea th, td {
            height: 40px;
        }

        .detailTable .txt{
        	width : 33%;
            text-align: center;  
            border-bottom: 1px rgba(224, 226, 226, 0.918) solid;
        }
        

        #titleArea{
            border-top : 2px rgb(223 230 234 / 92%) solid;
            border-bottom: 1px rgb(223 230 234 / 92%) solid;
            background-color: rgb(233 241 251);
        }
        
        #contentArea #contentText{
        	text-align:center;
        	padding : 10px;
        }
        
        #contentText div{
        	min-height: 100px;
        }

        #heart{
            text-align: right;
            padding: 3px 15px;
        }
        
        #heart i{
        	cursor : pointer;
        }
        
        #heart .bi-heart-fill {
        	color : red;
        }
        
        
		/* reply */
        .replyTable{
            border-top : 1px rgba(224, 226, 226, 0.918) solid;
            border-bottom : 2px rgb(226 232 236) solid;
            text-align: center;
        }

        .replyContent{
            margin: 5px;
            width: 80%;
            border: 1px rgb(208 208 210 / 92%) solid;
            border-radius: 2px;
            vertical-align: middle;
            resize: none;
            overflow-y: hidden;
            font-size: 15px;
        }

        #replyInsert button{
            width: 50px;
            height: 32px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:  rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
            vertical-align: middle;
        }

        .listArea {
            border-top : 1px rgba(224, 226, 226, 0.918) solid;;
        }

        .listArea td:nth-child(2n-1){
            width: 100px;
        }

        .listArea td:nth-child(2){
            text-align: left;
        }

        .replyBtn button{
            background-color: rgba(213, 218, 218, 0.918);
            border: 1px rgba(255, 255, 255, 0.918) solid;
            border-radius: 5px;
        }
        

        .updateArea, .reReplyInsert{
            display: none;
        }

        .on{
            display:table-row;
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
        
        <div class="boardArea">
            <table class="detailTable">
                <tr id="titleArea">
                    <th colspan="3" class="title">${ c.ctitle }</th>
                </tr>
                <tr id="infoArea">
                    <td class="name txt">${ c.userName }</td>
                    <td class="date txt">${ c.ccreateDate }</td>
                    <td class="count txt">${ c.ccount }</td>
                </tr>
                <c:if test="${ !empty alist }">
	            <tr>
	                <td class="file txt">첨부파일</td>
	                <td class="fileName txt" colspan="2">
	                <c:forEach items="${ alist }" var="a">
	                <a href="${ contextPath }/resources/image/cuploadFile/${ a.changeName }" download="${ a.originName }">${ a.originName }</a>
	             	&nbsp;
	                </c:forEach>
	                </td>
	            </tr>
                </c:if>
                <tr id="contentArea">
                    <td colspan="3" id="contentText">
	                    <div>
	                    ${ c.ccontent }<br><br>
		                <c:if test="${ !empty alist }">
			                <div id="imgArea">
				                <c:forEach items="${ alist }" var="a">
				                <img width="300" height="300" src="${ contextPath }/resources/image/cuploadFile/${ a.changeName }">
				                </c:forEach>
			                </div>
		                </c:if>
	                    </div>
                    </td>
                </tr>
                <tr id="heartArea">
                    <td colspan="3" id="heart">
                    	<c:if test="${ check eq 0 }"><i class="bi bi-heart" ></i></c:if>
                    	<c:if test="${ check > 0}"><i class="bi bi-heart-fill"></i></c:if>
                        &nbsp;<span id="count">${ c.heart }</span>
                    </td>
                </tr>
            </table>
			
			<script>
			$(".bi").on("click", function(){
				var userId = "${ loginUser.userId }";
				var obj = {userId : userId, cno : "${ c.cno }"};
				
				 if( userId != ""){
					$.ajax({
						url : "${ contextPath }/compliment/good",
						data : JSON.stringify(obj),
						type : "post",
						dataType : "json",
						contentType : "application/json; charset=utf-8",
						success : function(data){
							console.log(data.count);
 							$("#count").text(data.count);
							if(data.check == 0){
								$(".bi-heart-fill").removeClass('bi-heart-fill').addClass('bi-heart');
							} else {
								$(".bi-heart").removeClass('bi-heart').addClass("bi-heart-fill");
							} 
						},
						error : function(e){
							alert("실패했습니다.");
						}
					});
				} else {
					alert("로그인 유저만 가능합니다.");
				} 
			});
			</script>
			
            <table class="replyTable">
            	
                <tr id="replyInsert">
                    <td colspan="5">
                        <textarea class="replyContent" name="rcontent" id="rcontent" required
                        <c:if test="${ !empty loginUser }">placeholder="댓글을 입력해주세요"</c:if>
                        <c:if test="${ empty loginUser }">placeholder="로그인 유저만 작성이 가능합니다." disabled</c:if>></textarea>
                        <button type="button" onclick="insertReply();">등록</button>
                    </td>
                </tr>
           		  
                <c:if test="${ !empty rlist }">
                <c:forEach items="${ rlist }" var="r">
                <tr class="listArea replyArea">
                	<c:if test="${ empty r.rno2 }">
                    <td colspan="1"><div>${ r.rwriterName }&nbsp;&nbsp;:</div></td>
                    <td colspan="3">
                        <div>${ r.rcontent }</div>
                    </td> 
                    <td colspan="1" class="replyBtn">
                    	<c:if test="${ loginUser.userId eq c.userId || loginUser.userName eq '관리자' }"><button type="button" onclick="insertReReply(this, ${ r.rno });"><i class="bi bi-arrow-return-right"></i></button></c:if> 
                        <c:if test="${ loginUser.userId eq r.rwriter  }"><button type="button" onclick="updateReply(this, ${ r.rno});"><i class="bi bi-pencil"></i></button>
                        <button type="button" onclick="deleteReply(this, ${ r.rno });"><i class="bi bi-x"></i></button></c:if>
                    </td>
                    </c:if>
                    
                    <c:if test="${ !empty r.rno2 }">
                    <td colspan="1"><i class="bi bi-arrow-return-right"></i></td>
                    <td colspan="3">
                    	<div>${ r.rwriterName }&nbsp;&nbsp;:&nbsp;&nbsp;${ r.rcontent }</div>
			        </td>
			        <td colspan="1" class="replyBtn">
				        <c:if test="${ loginUser.userId eq r.rwriter }"><button type="button" onclick="updateReply(this, ${ r.rno });"><i class="bi bi-pencil"></i></button>
				        <button type="button" onclick="deleteReply(this, ${ r.rno });"><i class="bi bi-x"></i></button></c:if>
			        </td>
                    </c:if>
                </tr>
                <tr class="updateArea">
                    <td colspan="4">
                        <textarea class="replyContent" name="rcontent"></textarea>
                    </td>
                    <td colspan="1" class="replyBtn">
                        <button type="button" onclick="submitUpdate(this, ${ r.rno });"><i class="bi bi-pencil"></i></button>
                        <button type="button" onclick="cancelUpdate(this, ${ r.rno });"><i class="bi bi-x"></i></button>
                    </td>
                </tr>    
                
				<tr class="reReplyInsert">
                    <td colspan="4">
                        <i class="bi bi-arrow-return-right"></i>&nbsp;<textarea class="replyContent" name="rcontent"></textarea>
                    </td>
                    <td colspan="1" class="replyBtn">
                        <button type="button" onclick="submitReReply(this, ${ r.rno });" ><i class="bi bi-pencil"></i></button>
                       <button type="button" onclick="cancelReReply(this, ${ r.rno });"><i class="bi bi-x"></i></button>
                    </td>
                </tr> 

                </c:forEach>
                </c:if>
                <c:if test="${ empty rlist }">
                <tr class="listArea">
                	<td></td>
                	<td colspan="3"><div align="center">작성된 댓글이 없습니다.</div></td>
                	<td></td>
                </tr>
                </c:if>
            </table>
        </div>

        <div class="btnArea">
            <c:if test="${ loginUser.userId eq c.userId}"><button type="button" class="updateBtn" onclick="location.href='${ contextPath }/compliment/updatePage?cno=${ c.cno }&page=${ param.page }'">수정</button></c:if>
            <button type="button" id="cancelBtn" onclick="location.href='${ contextPath }/compliment/list?page=${ param.page }'">목록으로</button>
            <c:if test="${ loginUser.userId eq c.userId || loginUser.userName eq '관리자'  }"><button type="button" class="updateBtn" onclick="deleteCompliment();">삭제</button></c:if>
        </div>
    </div>

    <script>
    	function deleteCompliment(){
    		if(confirm("해당 글을 삭제하시겠습니까?")) location.href='${ contextPath }/compliment/delete?cno=${ c.cno }';
    	}
    	
    	$(".replyContent").on('keyup',function(){
            $(this).css("height", "auto");
            $(this).height(this.scrollHeight);
        });
    	
    	function insertReply(){	
    		var userId = "${ loginUser.userId }";
    		var cwriter = "${ c.userId }";
    		var rcontent = $("#replyInsert #rcontent").val();
    		var cno = "${ c.cno }";
    		var userName ="${ loginUser.userName }";
    		
     		if(userId == cwriter || userName == '관리자'){
    			if(rcontent != ""){
	    			$.ajax({
	    				url : "${ contextPath }/compliment/reply/insert",
	    				data : {rcontent : rcontent, rwriter : userId, cno: cno},
	    				type : "post",
	    				dataType : 'json',
	    				success : function(data){
	    					replyList(data);
	    					alert('댓글이 등록되었습니다.');
	    					$("#rcontent").val("");
	    				},
	    				error : function(e){
	    					console.log(e);
	    					alert('댓글 작성에 실패했습니다.');
	    				}
	    			});
    			 } else {
    				 alert("댓글을 작성해주세요");
    			 }
    		} else {
    			alert("관리자와 작성자만 댓글 작성이 가능합니다.");
    		}  
    	}
    	
    	function replyList(data){
    		var userId = "${ loginUser.userId }";
    		var cuserId = "${ c.userId }";
    		var userName = "${ loginUser.userName }";
    		
    		var tr = $('.listArea');
			tr.text("");
			var replyTable = $('.replyTable');
			var rlist = data;
			
    		for(var i in rlist){
    			var html = "";
    			html += "<tr class='listArea replyArea'>";
    			
    			if( rlist[i].rno2 == null ){
	    			html += "<td colspan='1'><div>" + rlist[i].rwriterName + "&nbsp;&nbsp;:</div></td>";
	    			html += "<td colspan='3'><div>" + rlist[i].rcontent + "</div></td>";
	    			html += "<td colspan='1' class='replyBtn'>";
	    			if(userId == cuserId || userName == '관리자') 
	    			html += "<button type='button' onclick='insertReReply(this," + rlist[i].rno + ");'><i class='bi bi-arrow-return-right'></i></button>";
	    			if(userId == rlist[i].rwriter){
	    				html += "<button type='button' onclick='updateReply(this," + rlist[i].rno + ");'><i class='bi bi-pencil'></i></button>";
	    				html += "<button type='button' onclick='deleteReply(this," + rlist[i].rno + ");'><i class='bi bi-x'></i></button>";
	    			}
	    			html += "</td>";
    			} 
    			if( rlist[i].rno2 != null ){
    				html += "<td colspan='1'><i class='bi bi-arrow-return-right'></i></td>";
	    			html += "<td colspan='3'><input type='hidden' value='rrlist[j].rno' name='rno'>"
	    			html +="<div>" +  rlist[i].rwriterName + "&nbsp;&nbsp;:&nbsp;&nbsp;" + rlist[i].rcontent+"</div></td>";
	    			html += "<td colspan='1' class='replyBtn'>";
	    			if(userId == rlist[i].rwriter){
	    				html += "<button type='button' onclick='updateReply(this," + rlist[i].rno + ");'><i class='bi bi-pencil'></i></button>";
	    				html += "<button type='button' onclick='deleteReply(this," + rlist[i].rno + ");'><i class='bi bi-x'></i></button>";
	    			}
	    			html += "</td>";
    			}
    			
    			html +="</tr>";
    			html += "<tr class='updateArea'>";
    			html += "<td colspan='4'><textarea class='replyContent' name='rcontent'></textarea></td>";
    			html += "<td colspan='1' class='replyBtn'>";
    			html += "<button type='button' onclick='submitUpdate(this," + rlist[i].rno + ");'><i class='bi bi-pencil'></i></button>";
    			html += "<button type='button' onclick='cancelUpdate(this," + rlist[i].rno + ");'><i class='bi bi-x'></i></button>";
    			html += "</td></tr>";
    			
    			html += "<tr class='reReplyInsert'>";
    			html += "<td colspan='4'><i class='bi bi-arrow-return-right'></i>&nbsp;<textarea class='replyContent' name='rcontent'></textarea></td>";
    			html += "<td colspan='1' class='replyBtn'>";
    			html += "<button type='button' onclick='submitReReply(this," + rlist[i].rno + ");'><i class='bi bi-pencil'></i></button>";
    			html += "<button type='button' onclick='cancelReReply(this," + rlist[i].rno + ");'><i class='bi bi-x'></i></button>";
    			html += "</td></tr>";
    			
    			replyTable.append(html);
    		}
    	}
        
    	
        function updateReply(e, rno){
    		$(e).parents('tr').next('tr').addClass('on');
            $(e).parent('td').css('visibility','hidden');
    	}
        
        function submitUpdate(e, rno){
        	$(e).parents('tr').removeClass('on');
            $(e).parents('tr').prev().children().eq(2).css('visibility','visible');
        	var rcontent = $(e).parent('td').prev('td').children('textarea');
        	var cno = "${ c.cno }";
        	
        	 if(rcontent.val() != "" ){
        		$.ajax({
        			url : "${ contextPath }/compliment/reply/update",
        			type : "post",
        			data : { rno : rno, rcontent : rcontent.val(), cno : cno},
        			dataType : "json", 
        			success : function(data){
        				replyList(data);
        	        	rcontent.val("");
        	            rcontent.css("height", "auto");
        	            alert("댓글이 수정되었습니다.");
        			},
        			error : function(e){
        				console.log(e);
        				alert("댓글 수정에 실패했습니다.");
        			}
        		});
        	} else {
        		alert("댓글을 작성해주세요");
        	} 
        }
        
        function cancelUpdate(e, rno){
        	$(e).parents('tr').removeClass('on');
            $(e).parents('tr').prev().children().eq(2).css('visibility','visible');
            $(e).parent('td').prev('td').children('textarea').val("");
            $(e).parent('td').prev('td').children('textarea').css("height", "auto");
    	}
        
        function deleteReply(e, rno){
        	var cno = "${ c.cno }";
        	var count;
        	if(confirm("해당 댓글을 삭제하시겠습니까?")){
        		$.ajax({
        			url : "${ contextPath }/compliment/reply/check",
        			type : "post",
        			data : { rno : rno, cno : cno },
        			dataType : "json",
        			success : function(data){
        				console.log(data);
        				if(data.result != null) {
        					alert("해당 댓글은 삭제할 수 없습니다.");
        				} else {
        					replyList(data.rlist);
        					alert("댓글이 삭제되었습니다.");
        				}
        			},
        			error : function(e){
        				console.log(e);
        				alert("댓글 삭제에 실패했습니다.");
        			}
        		})
        	}
        }
        
        
        function insertReReply(e, rno){
    		$(e).parents('tr').next().next('tr').addClass('on');
            $(e).parent('td').css('visibility','hidden');
    	}
        
        function submitReReply(e, rno){
        	$(e).parents('tr').removeClass('on');
            $(e).parents('tr').prev().prev().children().eq(2).css('visibility','visible');
        	var rwriter = '${ loginUser.userId }';
        	var rcontent = $(e).parents('tr').children().children().eq(1);
        	var cno = '${ c.cno }';
        		
        	if(rcontent.val() != "" ){
        		$.ajax({
        			url : "${contextPath }/compliment/reply/insert", 
        			type : "post",
        			data : { rwriter : rwriter, rcontent : rcontent.val(), cno : cno, rno2 : rno },
        			dataType : "json",
        			success : function(data){
        				replyList(data);
        				alert("댓글이 등록되었습니다.")
        				rcontent.val("");
        			},
        			error : function(e){
        				console.log(e);
        				alert("댓글 등록에 실패했습니다.");
        			}
        		})
        	} else {
        		alert("댓글을 작성해주세요");
        	}
        }
        
        
        function cancelReReply(e, rno){
        	  $(e).parents('tr').removeClass('on');
              $(e).parents('tr').prev().prev().children().eq(2).css('visibility','visible');
              $(e).parent('td').prev('td').children('textarea').val("");
              $(e).parent('td').prev('td').children('textarea').css("height", "auto");
        }
        
        
    </script>
    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>