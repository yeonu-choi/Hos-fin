<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Complain Write</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
     #notice {
        width : 700px;
        height : 70px;
        margin-bottom : 30px;
        margin-left : 40px;
     }
      
     h1 {
          text-align : center;
        color : #00a5db;
        margin-top : 30px;
     }
    
     .btnArea {
        margin-top : 20px;
        margin-bottom : 20px;
     }
            
     .btnArea button {
        margin-top : 20px;
        height : 40px;
        width : 50px;
        border : none;
        border-radius: 3px;
        font-size : 18px;
     }
    
     table {
        width : 600px;
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

     input::placeholder {
   	    font-size : 18px;
        padding-left : 2px;
   }
    textarea::placeholder {
        font-size : 18px;
        padding-left : 2px;
        padding-top : 4px;
    }
    
      #update{
          margin-right: 10px;
          background-color: rgb(57, 133, 247);
          color : white;
      }
    
      #submit {
          background-color: rgb(57, 133, 247);
          color : white;
          margin-right: 10px;
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
                <form action="${ contextPath }/complain/insert" id="writeForm" method="post" enctype="multipart/form-data">
                    <table id="detail">
                        <tr>
                            <td><input type="text" name="cbtitle" maxlength="40" placeholder="제목을 입력해주세요." required></td>
                        </tr>
                        <tr>
                            <td><textarea name="cbcontent" style="resize:none;" placeholder="내용을 입력해주세요."required></textarea></td>
                        </tr>
                        <tr>
                            <td><input type="file" name="uploadFile"></td>
                        </tr>
                    </table>
                     <div class="btnArea">
                        <button id="submit">등록</button>
                        <button id="cancel" onclick="history.back()">취소</button>
                    </div>
                    <input type="hidden" name="cbwriter" value="${loginUser.userName }">
                    <input type="hidden" name="userid" value="${ loginUser.userId }">
                </form>            
            </div>
    
           
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>