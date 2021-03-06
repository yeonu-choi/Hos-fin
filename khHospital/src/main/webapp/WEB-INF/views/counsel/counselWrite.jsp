<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KHëíë³ì</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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

       #cArea {
           width: 100%;
           position: relative;
           text-align: center;
       }

      #cArea p:first-child { margin-top: 50px; }

      #writeArea {
          width: 100%;
          position: relative;
          margin-top: 40px;
          margin-bottom: 150px;
      }

      #writeTable {
        width: 60%;
        margin-left: 20%;
        margin-bottom: 30px;
      }

      #writeTable tr { border-bottom: 2px solid #e3e3e3; }
      #writeTable tr:first-child { border-top: 3px solid #02a6db; }

      .general { height: 60px;}
      #content { height: 400px; }

      .bold {
          font-weight: 600;
          background: #f5f5f5;
          padding-left: 30px;
      }

      #cpwd {
        width: 30%;
        height: 30px;
        background: #f7f7f7;
        border: 1px solid #a7a7a7;
      }

      #writeTable td:not(.bold) { padding-left: 30px; }

      #ctitle { 
          width: 50%;
          height: 30px;
          background: #f7f7f7;
          border: 1px solid #a7a7a7;
          }

      #content2 {
        resize: none;
        margin-top: 10px;
        margin-bottom : 10px;
        width : 98%;
        height : 410px;
        border: 1px solid #a7a7a7;
      }

      .fArea {
          width: 99%;
          height: 40px;
          border: 1px solid #a7a7a7;
          position: relative;
      }

      .fArea input { 
          margin-top: 8px;
          margin-left: 5px;
          }
        
       #chkArea {
          width: 100%;
          position: relative;
          text-align: center;
        }

        #chk1 { 
            position: relative; 
            top: 1.8px;
            }
        
        #aArea { 
            width: 100%; 
            position: relative;
            margin-top: 20px;
            }

        #agreement { 
            width: 57%; 
            margin-left: 20.2%; 
            height: 270px; 
            overflow: auto;
            padding: 20px;
            padding-top: 15px;
            border: 2px solid #e3e3e3;
            }
        #btns {
            width: 100%;
            position: relative;
            margin-top: 40px;
            text-align: center;
        }

        #btns button {
            width: 130px;
            height: 35px;
            border: none;
            color: white;
            cursor: pointer;
        }

        #writeBtn { background: #00a6f0; }
        #backBtn { background: #555555; }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">1:1 ì ë¬¸ì ìë´</p>
        <p id="top-s">ê¶ê¸íì  ì§í ëë ê±´ê° ê´ë ¨ ë¬¸ìë¥¼ ë¨ê²¨ì£¼ìë©´ 
            ë¶ì¼ë³ ìµê³ ì ì ë¬¸ìê° ì¹ì íê² ëµë³í´ëë¦½ëë¤.</p>
    </div>
    <div id="cArea">
        <p>Â· ê²ìê¸ ìì  ì­ì ê° ê°ë¥íë ì ë¬¸ìì ëµë³ì´ ë¬ë¦° ì´íìë ìì  ë° ì­ì ê° ë¶ê°í©ëë¤.</p>
        <p>Â· ê²ìí ì±ê²©ì ë§ì§ ìë ê¸(ë¹ë°©,ê´ê³ ì±)ì ê´ë¦¬ìì ìí´ ìì ì­ì ë  ì ììµëë¤.
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    <div id="writeArea">
        <form id="writeForm" action="${ contextPath }/counsel/insert" method="post" enctype="multipart/form-data">
            <table id="writeTable" style="border-collapse: collapse;" align="center">
                <tr class="general">
                    <td class="bold" width="20%">ìì±ì</td>
                    <td><input type="text" id="userId" name="userId" value="${ loginUser.userId }"></td>
                </tr>
                <tr class="general">
                    <td class="bold" width="20%">ì ëª©</td>
                    <td><input type="text" id="ctitle" name="ctitle"></td>
                </tr>
                <tr id="content">
                    <td class="bold" width="20%">ë´ì©</td>
                    <td><textarea name="c_content" id="content2"></textarea></td>
                </tr>
                <tr class="general">
                    <td class="bold" width="20%">ìë´ ì¬ì§ ì²¨ë¶ 1</td>
                    <td>
                        <div class="fArea">
                        <input type="file" name="f1">
                        </div>
                    </td>
                </tr>
                <tr class="general">
                    <td class="bold" width="27%">ìë´ ì¬ì§ ì²¨ë¶ 2</td>
                    <td>
                        <div class="fArea">
                        <input type="file" name="f2">
                        </div>
                    </td>
                </tr>
            </table>
            <div id="chkArea">
            	<input type="hidden" name="did" value="${did}">
                <input type="checkbox" id="chk1" name="chk1" style="zoom: 1.2;">
                <label for="chk1">ê°ì¸ì ë³´ ìì§ ë° ì´ì©ì½ê´ì ëìí©ëë¤.</label>
            </div>
            <div id="aArea">
                <div id="agreement">
                    KHëíë³ì(ì´íâë³ìâì´ë¼ í¨)ì ê·íì ê°ì¸ì ë³´ë³´í¸ë¥¼ ë§¤ì° ì¤ììíë©°,ãê°ì¸ì ë³´ë³´í¸ë²ãì ì¤ìíê³  ììµëë¤.<br>
                    ë³¸ìì ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨ì íµíì¬ ê·íê»ì ì ê³µíìë ê°ì¸ì ë³´ê° ì´ë í ì©ëì ë°©ìì¼ë¡ ì´ì©ëê³  ìì¼ë©° ê°ì¸ì ë³´ë³´í¸ë¥¼ ìí´ ì´ë í ì¡°ì¹ê° ì·¨í´ì§ê³  ìëì§ ìë ¤ëë¦½ëë¤.<br>
                    ì´ ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨ì ììë ë¤ìê³¼ ê°ìµëë¤.<br><br>

                    1. ìì§íë ê°ì¸ì ë³´ì í­ëª© ë° ìì§ë°©ë²<br>
                    2. ê°ì¸ì ë³´ì ìì§ ë° ì´ì©ëª©ì <br>
                    3. ê°ì¸ì ë³´ì ë³´ì  ë° ì´ì©ê¸°ê° ë° íê¸°ì ì°¨ ë° íê¸°ë°©ë²<br>
                    4. ì´ì©ì ë° ë²ì ëë¦¬ì¸ì ê¶ë¦¬ì ê·¸ íì¬ë°©ë²<br>
                    5. ê°ì¸ì ë³´ì ì ê³µ ë° ê³µì <br>
                    6. ê°ì¸ì ë³´ì ìí<br>
                    7. ê°ì¸ì ë³´ ë³´í¸ì±ìì<br>
                    8. ê°ì¸ì ë³´ì ìì ì± íë³´ì¡°ì¹<br>
                    9. ì ì±ë³ê²½ì ë¤ë¥¸ ê³µì§ìë¬´<br><br>


                    1. ìì§íë ê°ì¸ì ë³´ì í­ëª© ë° ìì§ë°©ë²<br>
                    ë³ìì ì§ë£ë¥¼ ìí´ ìë£ë²ì ìí´ ëªìë ìµìíì ê°ì¸ì ë³´ë§ì ìì§í©ëë¤.<br> 
                    ê·íê° ë³¸ìì ì§ë£ ìë¹ì¤ë¥¼ ì´ì©íê¸° ìí´ ìì±íë ì§ë£ì¹´ëì ì§ë£ê²°ê³¼ì ëí ê¸°ë¡ì ê´ë¦¬í©ëë¤.<br>
                    - ìì§í­ëª© : ì±ëª, ì£¼ì, ì°ë½ì², ì§ë£ê¸°ë¡<br>
                    â» ìë£ë²ì ìí´ ê³ ì ìë³ì ë³´ ë° ì§ë£ì ë³´ë¥¼ ìë¬´ì ì¼ë¡ ë³´ì íì¬ì¼ íì¬ì¼í¨(ë³ë ëì ë¶íì)<br><br>

                    2. ê°ì¸ì ë³´ì ìì§ ë° ì´ì©ëª©ì <br>
                    ë³ìì ìì§í ê°ì¸ì ë³´ë¥¼ ì§ë£ì ëª©ì ì¼ë¡ë§ ì¬ì©íë©° ì´ì© ëª©ì ì´ ë³ê²½ë  ììë ì¬ì  ëìë¥¼ êµ¬
                    í  ê²ìëë¤.<br><br>

                    3. ê°ì¸ì ë³´ì ë³´ì  ë° ì´ì©ê¸°ê° ë° íê¸°ì ì°¨ ë° íê¸°ë°©ë²<br>
                    ë³¸ìì ìë£ë²ìì ì í ë³´ì ê¸°ê° ëì ê°ì¸ì ë³´ë¥¼ ë³´ì íë©° ê·¸ ì´íìë ê°ì¸ì ë³´ë¥¼ ì§ì²´ ìì´ íê¸° í©ëë¤.<br>
                    - ë³´ì ê¸°ê° : ì§ë£ê¸°ë¡ë¶ 10ë<br>
                    - íê¸°ì ì°¨ : ë²ì  ë³´ì ê¸°ê° í íê¸°ë°©ë²ì ìíì¬ ì¦ì íê¸°<br>
                    â» ì§ë£ê¸°ë¡ì´ ìµì¢ ê¸°ë¡ë í 10ëì´ ê²½ê³¼í í´ë¹ ê°ì¸ì ë³´ë ì¦ì íê¸°íì¬ì¼ í¨<br>
                    - íê¸°ë°©ë² : ì ìì íì¼ííë¡ ì ì¥ë ê°ì¸ì ë³´ë ê¸°ë¡ì ì¬ìí  ì ìë ê¸°ì ì  ë°©ë²ì ì¬ì©íì¬
                    ì­ì íê³  ì¢ì´ì ì¶ë ¥ë ê°ì¸ì ë³´ë ë¶ìê¸°ë¡ ë¶ìíê±°ë ìê°íì¬ íê¸°.<br><br>

                    4. ì´ì©ì ë° ë²ì ëë¦¬ì¸ì ê¶ë¦¬ì ê·¸ íì¬ë°©ë²<br>
                    ì´ì©ì ë° ë²ì ëë¦¬ì¸ì ê°ì¸ì ë³´ì ê´ë ¨íì¬ ì í, ìë©´ ë±ì ì´ì©íì¬ ë³¸ìì ê°ì¸ì ë³´ ì´ë ë± ì ê¶ë¦¬ë¥¼ íì¬í  ì ìì¼ë©°, ë³ìì ì§ì²´ ìì´ íìí ì¡°ì¹ë¥¼ í©ëë¤.<br>
                    * ë²ì ìí´ ë³´ê´ì´ ìë¬´íë ê°ì¸ì ë³´ë ìì²­ì´ ìëë¼ë ë³´ê´ê¸°ê°ë´ì ìì Â·ì­ì í  ì ììµëë¤.<br><br>


                    5. ê°ì¸ì ë³´ì ì 3ì ì ê³µ<br>
                    ë³ìì êµ­ë¯¼ê±´ê°ë³´í¸ë²ì ìê±° ê±´ê°ë³´íì¬ì¬íê°ìì ììê¸ì¬ë¹ì© ì²­êµ¬ë¥¼ ìí´ ì§ë£ê¸°ë¡ì ì ì¶<br>
                    í©ëë¤.<br>
                    â» ë²ì ìí´ ìë¬´ì ì¼ë¡ ì ì¶íë ì¬í­ì´ë¯ë¡ ë³ëì ì ê³µ ëì ë¶íì<br><br>

                    6. ê°ì¸ì ë³´ ì²ë¦¬ì ìí<br>
                    ë³ìì ê°ì¸ì ë³´ì ê´ë¦¬ìì¤íì ê´ë¦¬ë¥¼ ìí´ ë¤ìì íì¬ì ê°ì¸ì ë³´ë¥¼ ìííê³  ììµëë¤.<br>
                    - ì ìì§ë£ê¸°ë¡ ê´ë¦¬ : ë³ìê´ë¦¬(ì ì°ì¤)<br><br>

                    7. ê°ì¸ì ë³´ ë³´í¸ì±ìì<br><br>

                    [ì´ë¦] : ìµ ì° ì°<br>
                    [ìì] : ê°ì¸ì ë³´ ë´ë¹ ë¶ì<br>
                    [ì íë²í¸] : 02) 123-4567<br>
                    [ë©ì¼] : kh_hospital@iei.or.kr<br><br>

                    8. ê°ì¸ì ë³´ì ìì ì± íë³´ì¡°ì¹<br>
                    ë³ìì ì´ì©ìì ê°ì¸ì ë³´ë³´í¸ë¥¼ ìí ê¸°ì ì  ëì±ì¼ë¡ ì¬ë¬ ë³´ìì¥ì¹ë¥¼ ë§ë ¨íê³  ììµëë¤.<br>
                    ì´ì©ìê»ì ì ê³µíì  ëª¨ë  ì ë³´ë ë°©íë²½ ë± ë³´ìì¥ë¹ì ìí´ ìì íê² ë³´í¸/ê´ë¦¬ëê³  ììµëë¤.<br>
                    ëí ë³ìì ì´ì©ìì ê°ì¸ì ë³´ë³´í¸ë¥¼ ìí ê´ë¦¬ì  ëì±ì¼ë¡ì ì´ì©ìì ê°ì¸ì ë³´ì ëí ì ê·¼ ë°<br>
                    ê´ë¦¬ì íìí ì ì°¨ë¥¼ ë§ë ¨íê³ , ì´ì©ìì ê°ì¸ì ë³´ë¥¼ ì²ë¦¬íë ì¸ìì ìµìíì¼ë¡ ì ííì¬ ì§ì ì ì¸ ë³´ìêµì¡ì ì¤ìíê³  ììµëë¤.<br> 
                    ëí ê°ì¸ì ë³´ë¥¼ ì²ë¦¬íë ìì¤íì ì¬ì©ìë¥¼ ì§ì íì¬ ì¬ì© ì ë¹ë°ë²í¸ë¥¼ ë¶ì¬íê³  ì´ë¥¼ ì ê¸°ì ì¼ë¡ ê°±ì íê² ìµëë¤.<br><br>

                    9. ì ì± ë³ê²½ì ê³µì§ìë¬´<br>
                    ì´ ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨ì 2021ë 1ì 29ì¼ì ì ì ëìì¼ë©° ë²ë ¹Â· ì ì± ëë ë³´ìê¸°ì ì ë³ê²½ì ë°ë¼
                    ë´ì©ì ì¶ê°Â· ì­ì  ë° ìì ì´ ìì ììë ë³ê²½ëë ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨ì ìííê¸° ìµì 7ì¼ì ì
                    ë³ì ííì´ì§ë¥¼ íµí´ ë³ê²½ì´ì  ë° ë´ì© ë±ì ê³µì§íëë¡ íê² ìµëë¤.<br><br>

                    ì´ìì âííì´ì§â ê°ì¸ì ë³´ ë³´í¸ì íì 2021ë 03ì 23ì¼ë¶í° ìíëìì¼ë©°,
                    2021ë 06ì 05ì¼ìë¡ ìì ëì´ ìííê³  ììµëë¤.<br>
                </div>
            </div>
            <div id="btns">
                <button id="writeBtn" type="button">ë±ë¡</button>
                <button id="backBtn" type="button" onclick="history.back();">ì·¨ì</button>
            </div>
        </form>
    </div>
    <script>
    	$("#writeBtn").click(function(){
    		var title = $("#ctitle").val();
    		var content = $("#content2").val();
    		
    		if(title == ""){
    			alert('ì ëª©ì ìì±í´ì£¼ì¸ì.');
    			//console.log(content);
    		} else if(content == ""){
    			alert('ê¸ ë´ì©ì ìì±í´ì¼í©ëë¤.');
    		} else if($("#chk1").is(":checked") == false){
    			alert('ê°ì¸ì ë³´ ìì§ ë° ì´ì©ì½ê´ì ëìì ì£¼ì¸ì.');
    		} else {
    			content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
    			$('#content2').val(content);
    			
    			$("#writeForm").submit();
    		}
    	})
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>