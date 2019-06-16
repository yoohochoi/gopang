<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>KCH</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/main2.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">

	<!-- Header -->
	<%@ include file="/WEB-INF/jsp/layout/header.jsp"%>
	<div id="heading">
		<h1>엑셀 업로드</h1>
	</div>
	<div class="login-form">
		<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action= "#none">
    		<div class="contents">
        		<div><h1>첨부파일은 한개만 등록 가능합니다.</h1></div> 
        	<dl class="vm_name">
            	<dt class="down w90">첨부 파일</dt>
                <dd><input id="excelFile" type="file" name="excelFile" /></dd>
        	</dl>        
    		</div>
		    <div class="bottom">
        		<button type="button" id="addExcelImpoartBtn" class="btn" onclick="check()" ><span>추가</span></button> 
    		</div>
		</form> 
		<p class="text-center">
			<a href="/user/regsterpage.do">Create an Account</a>
		</p>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/jsp/layout/footer.jsp"%>
	
	<script type="text/javascript">
	function checkFileType(filePath) {
        var fileFormat = filePath.split(".");
        if (fileFormat.indexOf("xlsx") > -1) {
            return true;
        } else {
            return false;
        }

    }

    function check() {
        var file = $("#excelFile").val();
        if (file == "" || file == null) {
            alert("파일을 선택해주세요.");
            return false;
        } else if (!checkFileType(file)) {
            alert("엑셀 파일만 업로드 가능합니다.");
            return false;
        }

        if (confirm("업로드 하시겠습니까?")) {
            var options = {
                success : function(data) {
                	if(data == 1){
                   		alert("모든 데이터가 업로드 되었습니다.");
                	}else if(data == 2){
                		alert("다시 시도해 주세요");	
                	}
                },
                type : "POST"
            };
            $("#excelUploadForm").ajaxSubmit(options);

        }
    }
	</script>


	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>

</html>