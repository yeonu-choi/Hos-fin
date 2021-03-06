<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KHëíë³ì</title>
<meta charset="UTF-8">
   <style>
        #top {
           margin-top: 80px;
           text-align: center;
       }

       #top-t {
           margin-left: 10%;
           width: 80%;
           color: #00a5db;
           font-size: 43px;
           font-weight: 600;
           margin-bottom: 0;
       }

       #top-s {
           margin-left: 10%;
           width: 80%;
           margin-top: 25px;
           color: #404040;
           font-size: 19px;
           font-weight: 600;
           border-bottom: 2px solid #e3e3e3;
           padding-bottom: 30px;
       }

       #dArea {
           width: 100%;
           position: relative;
       }

       #detailTable {
           width: 70%;
           margin-left: 15%;
           margin-top: 30px;
       }

       #title, #info { height: 50px;}
       #title { border-top: 3px solid #02a6db;}
       #attach { height: 60px;}

       #detailTable tr:not(#content){
           border-bottom: 2px solid #e3e3e3;
       }
       
       #detailTable tr th { padding-left: 10px;}

       #content td, #aImg td { 
           padding: 50px;
           padding-top: 30px;
           padding-bottom: 30px;
           }
        
        #aImg img { max-width: 500px;}

        #replyArea {
            width: 70%;
            margin-left: 15%;
            margin-top: 10px;
            border-bottom: 2px solid black;
        }

        #write {
            width: 98%;
            margin-left: 1%;
            background: #f1f1f1;
            height: 130px;
            position: relative;     
        }

        #write td:first-child {
            width: 80%; 
            padding-top: 25px;
        }

        #writeTable { width: 100%;}
        
        #write td:last-child {    
            width: 20%;
            padding-top: 23px;
        }

        #write textarea { 
            width: 100%; 
            height: 50px; 
            margin-left: 30px;
            padding: 10px;
            padding-top: 7px;
            }

        #write button { 
            width: 60%; 
            height: 69px;
            margin-left: 20px;
            margin-top: -1px;
            background: #01a4cf;
            color: white;
            font-weight: 600;
            border: none;
            font-size: 15px;
            cursor: pointer;
            }
        
        #write p { 
            margin-top: 0; 
            margin-left: 35px;
            font-size: 13px;
            }

        #view {
            width: 100%;
            position: relative;
            margin-top: 10px;
        }

        #replyTable { width: 98%; }

        .rInfo { 
            height: 50px; 
            border-top: 2px solid #e3e3e3; 
            border-bottom: 2px solid #e3e3e3;
            }
        
        .rContent {
           padding: 20px;
           padding-top: 30px;
           padding-bottom: 30px;
        }

        #btns {
            margin-top: 40px;
            width: 100%;
            position: relative;
            text-align: center;
            margin-bottom: 150px;
        }

        #btns button {
            border: none;
            color: white;
            font-size: 15px;
            cursor: pointer;
            font-weight: 600;
            width: 130px;
            height: 35px;
        }

        #modify {background: #01a4cf;}
        #delete {background: #555555;}
        
        .rModify, .rDelete {         
            border-radius: 5px;
            cursor: pointer;
            width: 45px;
            height: 30px;
            }
        
        .rDelete { 
            border: none; 
            background: #686868;
            color: white;
            }
            
        .rModify { 
            background: #f5f5f5;  
            color: #000000; 
            border: 1px solid rgb(143, 143, 143);
            }
            
        #goList {
            background: #f3f3f3;
            color: black !important;
            border: 1px solid #c0c0c0 !important;
        }
        
        textarea {
     		resize : none;
        }
        
        #rModi {
            display: inline-block;
            position: absolute;    
        }

        #rModiBtn { 
        background: #969696; 
        color: white; 
        font-weight: 600;
        border: none; 
        width: 80px; 
        height: 67px;
        cursor: pointer;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">1:1 ì ë¬¸ì ìë´</p>
        <p id="top-s">ê¶ê¸íì  ì§í ëë ê±´ê° ê´ë ¨ ë¬¸ìë¥¼ ë¨ê²¨ì£¼ìë©´ 
            ë¶ì¼ë³ ìµê³ ì ì ë¬¸ìê° ì¹ì íê² ëµë³í´ëë¦½ëë¤.</p>
    </div>
    <div id="dArea">
        <table id="detailTable" style="border-collapse: collapse;" align="center">
            <tr id="title">
                <th align="left">ì ëª©</th>
                <td colspan="3">${c.ctitle}</td>
            </tr>
            <tr id="info">
                <th align="left" width="7%">ìì±ì</th>
                <td align="left" width="76%">${c.userId}</td>
                <th align="right" width="7%">ë±ë¡ì¼</th>
                <td align="center" width="10%">${c.c_createDate}</td>
            </tr>
            <tr id="attach">
                <th width="7%" align="left">ì²¨ë¶íì¼</th>
                <td colspan="3">
                <c:if test="${ !empty flist }">
                <c:forEach items="${ flist }" var="f">
                <a href="${contextPath}/resources/counselFiles/${f.changeName}" download="${f.originName}">
                ${f.originName}</a>&nbsp;
                </c:forEach>
                </c:if>
                </td>
            </tr>
            <tr id="content">
                <td colspan="4">${c.c_content}</td>
            </tr>
            <tr id="aImg">
                <td colspan="4">
                    <c:if test="${ !empty flist }">
                	<c:forEach items="${ flist }" var="f">
                    <img src="${contextPath}/resources/counselFiles/${f.changeName}"><br>
                    </c:forEach>
                    </c:if>
                </td>
            </tr>
        </table>
        <div id="replyArea">
        	<c:if test="${loginUser.grade == 'ìì¬' && loginUser.did == c.did}">
            <div id="write">
                <table id="writeTable" style="border-collapse: collapse;" align="center">
                <tr>
                    <td width="80%" align="center"><textarea id="rArea" placeholder="ëµë³ì ìì±í´ì£¼ì¸ì." maxlength="1000"></textarea></td>
                    <td width="15%" align="center"><button id="replyBtn">ëµë³ ìì±</button></td>
                </tr>
                </table> 
                <p id="kup">íì¬ <span id="kleng">0</span>ì (ìµì 5ì, ìµë 1000ì)</p>
            </div>
            </c:if>
            <script>
	            $('#rArea').keyup(function(){
	            	var txLength = $(this).val().length; 
	            	var remain = 1000-txLength; 
	                
	            	$('#kleng').html(txLength);
	
	            	if(remain>=1 && remain<=30){
	            		$('#kleng').css('color', 'red');
	            	}
	            	if(remain<1){
	            		alert("ìµë 1000ìê¹ì§ë§ ìë ¥ ê°ë¥í©ëë¤.");
	            	}
	            });
   			</script>
   			<c:if test="${!empty rlist}">
            <div id="view">
                <table id="replyTable" style="border-collapse: collapse;" align="center">
                    <c:forEach items="${ rlist }" var="r">
                    <tr class="rInfo">
                        <th align="center" width="7%">ì§ë£ì</th>
                        <td align="left" width="76%">${r.userName}</td>
                        <th align="right" width="7%">ë±ë¡ì¼</th>
                        <td align="center" width="10%">${r.rcreateDate}</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="rContent">${r.rcontent}</td>
                        <th align="center" width="12%">
                        <c:if test="${loginUser.grade == 'ìì¬' && loginUser.userName == r.userName}">
                        <button type="button" class="rModify" onclick="rModify(this,${r.rid},'${r.rcontent}')">ìì </button> 
                        <button type="button" class="rDelete" onclick="rDelete(this,${r.rid},${r.cid})">ì­ì </button>
                        </c:if>
                        </th>
                    </tr>
                    </c:forEach>
                </table>
            </div>
           </c:if>
           <c:if test="${empty rlist}">
           		<div id="view">
                <table id="replyTable" style="border-collapse: collapse;" align="center">
                
                </table>
                </div>
           </c:if>
        </div>
    </div>
    <script>
	    $("#replyBtn").click(function () {
	    	var rc = $("#rArea").val();
	    	var rcontent = rc.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			var cid = ${c.cid};

			$.ajax({
				url : "${contextPath}/counsel/insertReply",
				data : {rcontent : rcontent, cid : cid},
				type : "post",
				dataType : "json",
				success : function(data){
					console.log(data);	
					
					table = $("#replyTable");
					table.html("");
					
					for(var i in data){
						tr1 = $("<tr class='rInfo'>");
						tr2 = $("<tr>");
						userId1 = $("<th align='center' width='7%'>").text("ì§ë£ì");
						userId2 = $("<td align='left' width='76%'>").text(data[i].userName);
						rcreateDate1 = $("<th align='right' width='7%'>").text("ë±ë¡ì¼");
						rcreateDate2 = $("<td align='center' width='10%'>").text(data[i].rcreateDate);
						rcontent = $("<td colspan='3' class='rContent'>").html(data[i].rcontent);
						rbtn = $("<th align='center' width='12%'>").html("<button type='button' class='rModify' onclick='rModify(this," + data[i].rid + ",&quot" + data[i].rcontent + "&quot)'>ìì </button>&nbsp;<button type='button' class='rDelete' onclick='rDelete(this,"+ data[i].rid + "," + cid + ")'>ì­ì </button>");
						
						tr1.append(userId1, userId2, rcreateDate1, rcreateDate2);
						tr2.append(rcontent);
						if("${loginUser.userName}" == data[i].userName)
							tr2.append(rbtn);
						
						table.append(tr1, tr2);
					}				
					$("#rArea").val("");
					
				},
				error : function(e){
					console.log(e);
				}
			});
		});
	    
	    function rDelete(e, rid, cid){ 	
	    	if(!confirm("ì­ì íìê² ìµëê¹"))
	    		return;
	    	
	    	$.ajax({
				url : "${contextPath}/counsel/deleteReply",
				data : {"rid" : rid, "cid" : cid},
				type : "post",
				success : function(data){
					if(data == 'ì±ê³µ'){
						$(e).parent().parent().prev().remove();
						$(e).parent().parent().remove();
						alert('ëê¸ì´ ì­ì ëììµëë¤.');
					} else {
						alert('ëê¸ ì­ì ì ì¤í¨íìµëë¤.');
					}	
				},
				error : function(e){
					console.log(e);
				}
			});
	    }
	    
	    function rModify(e, rid, rcon){
	    	
	    	console.log(rcon);
	    	if(rcon.indexOf('<br/>') !== -1){
    			rcon = rcon.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
	    	}
	    	$(e).parent().prev().html("");
	    	$(e).parent().prev().html("<textarea id='rArea2' rows='4' cols='135' maxlength='1000'>" + rcon + "</textarea><div id = 'rModi'><button id='rModiBtn' onclick='replyModify(this," + rid + ",rArea2.value)'>ëµë³ ìì </button></div>");
	    	
	    	$("#rArea2").focus();
	    	$("#rArea2").val(rcon);
	    }
	    
	    function replyModify(e, rid, rcon){
	    	var rarea = $(e).parent().parent();
	    	var rc = rcon.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	    	var modiBtn = $(e).parent().parent().next().children().first();
	    	
	    	$.ajax({
				url : "${contextPath}/counsel/modifyReply",
				data : {"rid" : rid, "rcontent" : rc},
				type : "post",
				dataType : "json",
				success : function(data){
					if(data.rcontent != null){
						rarea.html("");
						rarea.html(data.rcontent);
						modiBtn.removeAttr("onclick");
						modiBtn.attr("onclick", "rModify(this,'" + rid + "','" + rc + "')");
					} else {
						alert('ëê¸ ìì ì ì¤í¨íìµëë¤.');
					}	
				},
				error : function(e){
					console.log(e);
				}
			});
	    }
    </script>
    <div id="btns">
    	<c:if test="${empty rlist}">
    	<c:if test="${ c.userId eq loginUser.userId || loginUser.grade == 'ìì¬'}">
        <button id="modify" type="button" onclick="location.href='${contextPath}/counsel/modifyPage?cid=${c.cid}&page=${ param.page }'">ìì </button>
        <button id="delete" type="button" onclick="location.href='${contextPath}/counsel/delete?cid=${c.cid}&did=${c.did}'">ì­ì </button>
        </c:if>
        </c:if>
        <button id="goList" type="button" onclick="location.href='${contextPath}/counsel/list?did=${c.did}&page=${param.page}'">ëª©ë¡</button>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>