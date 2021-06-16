<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KH대학병원</title>
<style>
      #cArea {
         position: relative;
         width: 100%;
         text-align: center;
     }

     #cTitle { 
         margin-top: 30px;
         font-size: 26px;
         font-weight: 600;
         color: #00a5db;
         margin-bottom: 10px;
         }

     #vTable {width: 100%;}

     #newsTitle, #newsLink {
         width: 350px;
         height: 35px;
         border-radius: 5px;
         border: 1px solid rgb(192, 192, 192);
     }

     #newsTitle { margin-top: 20px;}
     #newsLink { margin-top: 5px;}

     .intitle { padding-right: 20px;}

     .btns { margin-top: 20px;}

     #goSubmit {
         width: 120px;
         height: 40px;
         border: none;
         background: #bdbdbd;
         color: white;
         font-weight: 600;
         font-size: 16px;
         cursor: pointer;
     }
</style>
</head>
<body>
    <div id="cArea">
        <p id="cTitle">기사 등록</p>
        <table class="vTable" style="border-collapse:collapse" align="center">
            <tr>
                <td align="center">
                    <input type="text" id="newsTitle" name="ntitle" placeholder="기사 제목 입력">
                </td>
            </tr> 
            <tr>
                <td align="center">
                    <input type="text" id="newsLink" name="nlink"  placeholder="기사 링크 입력">
                </td>
            </tr>
            </table>
            <div class="btns">
                <button id="goSubmit">등록하기</button>
            </div>
    </div>
    <script>
		$(document).on('click', '#goSubmit', function(){
			var link = $("#newsLink").val();
		    var title = $("#newsTitle").val();
		    
			if(title == ""){
				alert('기사 제목을 입력해주세요.');
			} else if(link == ""){
				alert('기사 링크를 입력해주세요.');
			} else {
				 $.ajax({
		                url:"${contextPath}/main/newsInsert",
		                type:"get",
		                data:{ntitle: title, nlink: link},
		              success:function(data){
		            	  console.log(data);
		           	  if(data == 'success'){
		           		  alert("기사가 등록되었습니다.");
		  				  opener.location.reload();
		  				  window.close();
		           	  } else if(data == 'fail'){
		           		  alert("기사 등록에 실패했습니다.");
		           		  window.close();
		           	  };  
		                },
		                error : function(e){
							console.log(e);
						 }
		             });
			}
		});
    </script>
</body>
</html>