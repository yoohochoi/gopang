<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>KCH</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/main2.css" />
		<script src="/SmartEditor/js/service/HuskyEZCreator.js"></script>
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="/resources/assets/js/jquery.form.js"></script>
		<script type="text/javascript">
			$(function(){
    			//전역변수선언
    			var editor_object = [];
    			nhn.husky.EZCreator.createInIFrame({
    			oAppRef: editor_object,
        		elPlaceHolder: "editor",
        		sSkinURI: "/SmartEditor/SmartEditor2Skin.html",
        		fCreator : "createSEditor2",
        		htParams : {
            		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            		bUseToolbar : true,            
            		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            		bUseVerticalResizer : true,    
            		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            		bUseModeChanger : true
        	}
    	});
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        	editor_object.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
        	add();
            // 이부분에 에디터 validation 검증
            //폼 submit
            //$("#formsign").submit();
    })
})
</script>
	</head>
	<body class="is-preload">

		<!-- Header -->
			<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

		<!-- Heading -->
			<div id="heading" >
				<h1>image</h1>
			</div>
			<div class="login-form">
					<form name="addimage" id="addimage" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label>닉네임</label>
				        	<input type="text" class="form-control" name="nicname" required="required">
				        </div>
						<div class="form-group">
							<label>제목</label>
				        	<input type="text" class="form-control" name="title" required="required">
				        </div>
				        <div class="form-group">
							<label>이미지</label>
				            <input type="file" class="form-control" name="imag" required="required">
				        </div>
				        <div class="form-group">
							<label>내용</label>
				            <textarea rows="10" cols="30" id="editor" name="content" id="editor" style="width:780px; height:350px; "></textarea>
				        </div>
						<div class="form-group">
				            <p align="right">
				            <button type="button" id="savebutton" class="btn btn-primary btn-lg">등록하기</button></p>
				        </div>
				    </form>
				</div>
			
		<!-- Footer -->
			<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>
			
			<!-- Scripts -->
			<script type="text/javascript">
				function add() {

					$('#addimage').ajaxSubmit({
						url : "/imag/addimg.do",
						type: "post",
						dataType : 'json',
						enctype : "multipart/form-data",
						success : function(response) {
							
							var result = response;
							if ( typeof response === 'string' ) {
								result = $.parseJSON(response);
							 } 
							if(result == '0'){
								alert("로그인 후 사용해주세요!");
								window.location = "/user/UserLogin.do";
							}else if(result == '1'){
								alert("등록이 완료되었습니다.");
								window.location = "/imag/imagpage.do";
							}else if(result == '2'){
								alert("다시 시도해 주세요")
							}							
						},
						error : function(err) {
							alert(err.responseText);
						}
					})
					
				}
				
			</script>
			
		<!-- Scripts -->
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>