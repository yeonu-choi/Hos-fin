<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KH대학병원</title>
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
        <p id="top-t">1:1 전문의 상담</p>
        <p id="top-s">궁금하신 질환 또는 건강 관련 문의를 남겨주시면 
            분야별 최고의 전문의가 친절하게 답변해드립니다.</p>
    </div>
    <div id="cArea">
        <p>· 게시글 수정 삭제가 가능하나 전문의의 답변이 달린 이후에는 수정 및 삭제가 불가합니다.</p>
        <p>· 게시판 성격에 맞지 않는 글(비방,광고성)은 관리자에 의해 임의 삭제될 수 있습니다.
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    <div id="writeArea">
        <form id="writeForm" action="${ contextPath }/counsel/insert" method="post" enctype="multipart/form-data">
            <table id="writeTable" style="border-collapse: collapse;" align="center">
                <tr class="general">
                    <td class="bold" width="20%">작성자</td>
                    <td><input type="text" id="userId" name="userId" value="${ loginUser.userId }"></td>
                </tr>
                <tr class="general">
                    <td class="bold" width="20%">제목</td>
                    <td><input type="text" id="ctitle" name="ctitle"></td>
                </tr>
                <tr id="content">
                    <td class="bold" width="20%">내용</td>
                    <td><textarea name="c_content" id="content2"></textarea></td>
                </tr>
                <tr class="general">
                    <td class="bold" width="20%">상담 사진 첨부 1</td>
                    <td>
                        <div class="fArea">
                        <input type="file" name="f1">
                        </div>
                    </td>
                </tr>
                <tr class="general">
                    <td class="bold" width="27%">상담 사진 첨부 2</td>
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
                <label for="chk1">개인정보 수집 및 이용약관에 동의합니다.</label>
            </div>
            <div id="aArea">
                <div id="agreement">
                    KH대학병원(이하‘병원’이라 함)은 귀하의 개인정보보호를 매우 중요시하며,「개인정보보호법」을 준수하고 있습니다.<br>
                    본원은 개인정보처리방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
                    이 개인정보처리방침의 순서는 다음과 같습니다.<br><br>

                    1. 수집하는 개인정보의 항목 및 수집방법<br>
                    2. 개인정보의 수집 및 이용목적<br>
                    3. 개인정보의 보유 및 이용기간 및 파기절차 및 파기방법<br>
                    4. 이용자 및 법정대리인의 권리와 그 행사방법<br>
                    5. 개인정보의 제공 및 공유<br>
                    6. 개인정보의 위탁<br>
                    7. 개인정보 보호책임자<br>
                    8. 개인정보의 안전성 확보조치<br>
                    9. 정책변경에 다른 공지의무<br><br>


                    1. 수집하는 개인정보의 항목 및 수집방법<br>
                    병원은 진료를 위해 의료법에 의해 명시된 최소한의 개인정보만을 수집합니다.<br> 
                    귀하가 본원의 진료 서비스를 이용하기 위해 작성하는 진료카드와 진료결과에 대한 기록을 관리합니다.<br>
                    - 수집항목 : 성명, 주소, 연락처, 진료기록<br>
                    ※ 의료법에 의해 고유식별정보 및 진료정보를 의무적으로 보유하여야 하여야함(별도 동의 불필요)<br><br>

                    2. 개인정보의 수집 및 이용목적<br>
                    병원은 수집한 개인정보를 진료의 목적으로만 사용하며 이용 목적이 변경될 시에는 사전 동의를 구
                    할 것입니다.<br><br>

                    3. 개인정보의 보유 및 이용기간 및 파기절차 및 파기방법<br>
                    본원은 의료법에서 정한 보유기간 동안 개인정보를 보유하며 그 이후에는 개인정보를 지체 없이 파기 합니다.<br>
                    - 보유기간 : 진료기록부 10년<br>
                    - 파기절차 : 법정 보유기간 후 파기방법에 의하여 즉시 파기<br>
                    ※ 진료기록이 최종 기록된 후 10년이 경과한 해당 개인정보는 즉시 파기하여야 함<br>
                    - 파기방법 : 전자식 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여
                    삭제하고 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기.<br><br>

                    4. 이용자 및 법정대리인의 권리와 그 행사방법<br>
                    이용자 및 법정대리인은 개인정보와 관련하여 전화, 서면 등을 이용하여 본원에 개인정보 열람 등 의 권리를 행사할 수 있으며, 병원은 지체 없이 필요한 조치를 합니다.<br>
                    * 법에 의해 보관이 의무화된 개인정보는 요청이 있더라도 보관기간내에 수정·삭제할 수 없습니다.<br><br>


                    5. 개인정보의 제3자 제공<br>
                    병원은 국민건강보호법에 의거 건강보험심사평가원에 요양급여비용 청구를 위해 진료기록을 제출<br>
                    합니다.<br>
                    ※ 법에 의해 의무적으로 제출하는 사항이므로 별도의 제공 동의 불필요<br><br>

                    6. 개인정보 처리의 위탁<br>
                    병원은 개인정보의 관리시스템의 관리를 위해 다음의 회사에 개인정보를 위탁하고 있습니다.<br>
                    - 전자진료기록 관리 : 병원관리(전산실)<br><br>

                    7. 개인정보 보호책임자<br><br>

                    [이름] : 최 연 우<br>
                    [소속] : 개인정보 담당 부서<br>
                    [전화번호] : 02) 123-4567<br>
                    [메일] : kh_hospital@iei.or.kr<br><br>

                    8. 개인정보의 안전성 확보조치<br>
                    병원은 이용자의 개인정보보호를 위한 기술적 대책으로 여러 보안장치를 마련하고 있습니다.<br>
                    이용자께서 제공하신 모든 정보는 방화벽 등 보안장비에 의해 안전하게 보호/관리되고 있습니다.<br>
                    또한 병원은 이용자의 개인정보보호를 위한 관리적 대책으로서 이용자의 개인정보에 대한 접근 및<br>
                    관리에 필요한 절차를 마련하고, 이용자의 개인정보를 처리하는 인원을 최소한으로 제한하여 지속 적인 보안교육을 실시하고 있습니다.<br> 
                    또한 개인정보를 처리하는 시스템의 사용자를 지정하여 사용 자 비밀번호를 부여하고 이를 정기적으로 갱신하겠습니다.<br><br>

                    9. 정책 변경에 공지의무<br>
                    이 개인정보처리방침은 2021년 1월 29일에 제정되었으며 법령· 정책 또는 보안기술의 변경에 따라
                    내용의 추가· 삭제 및 수정이 있을 시에는 변경되는 개인정보처리방침을 시행하기 최소 7일전에
                    병원 홈페이지를 통해 변경이유 및 내용 등을 공지하도록 하겠습니다.<br><br>

                    이상의 ‘홈페이지’ 개인정보 보호정택은 2021년 03월 23일부터 시행되었으며,
                    2021년 06월 05일자로 수정되어 시행하고 있습니다.<br>
                </div>
            </div>
            <div id="btns">
                <button id="writeBtn" type="button">등록</button>
                <button id="backBtn" type="button" onclick="history.back();">취소</button>
            </div>
        </form>
    </div>
    <script>
    	$("#writeBtn").click(function(){
    		var title = $("#ctitle").val();
    		var content = $("#content2").val();
    		
    		if(title == ""){
    			alert('제목을 작성해주세요.');
    			//console.log(content);
    		} else if(content == ""){
    			alert('글 내용을 작성해야합니다.');
    		} else if($("#chk1").is(":checked") == false){
    			alert('개인정보 수집 및 이용약관에 동의에 주세요.');
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