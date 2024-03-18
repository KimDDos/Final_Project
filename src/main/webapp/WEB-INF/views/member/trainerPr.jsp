<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>

<%
    String imagePath = request.getRealPath("upload") + File.separator + "example.jpg"; // 예시 이미지 경로
    String thumbnailPath = request.getRealPath("upload") + File.separator + "thumbnail_example.jpg"; // 썸네일 저장 경로
    int thumbnailWidth = 100; // 썸네일 너비
    int thumbnailHeight = 100; // 썸네일 높이
    
    try {
        // 원본 이미지 로드
        File imageFile = new File(imagePath);
        BufferedImage originalImage = ImageIO.read(imageFile);
        
        // 썸네일 이미지 생성
        BufferedImage thumbnail = new BufferedImage(thumbnailWidth, thumbnailHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics2D = thumbnail.createGraphics(); // Graphics2D 객체 생성
        graphics2D.drawImage(originalImage, 0, 0, thumbnailWidth, thumbnailHeight, null); // 썸네일 이미지 그리기
        graphics2D.dispose(); // 그래픽 객체 해제
        
        // 썸네일 이미지 파일로 저장
        ImageIO.write(thumbnail, "jpg", new File(thumbnailPath));
    } catch (IOException e) {
        e.printStackTrace();
    }
%>


<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	
<jsp:include page="../layout/header.jsp"></jsp:include>


<form action="/admin/register" class="row g-3" method="post" onsubmit="return sendForm(this);">
	<section class="py-5">
		<div class="container px-1 my-5">
			<div class="row gx-5">
				<jsp:include page="../member/mypageLayout.jsp"></jsp:include>
				<div class="col-lg-9">
					<article>
						<header class="mb-4">
							<h1 class="fw-bolder mb-1">자기소개</h1>
						</header>
						<table>
						<tr>
							<p>이미지 업로드:</p>
							<input type="file"/>						
						</tr>
						<tr>
							<div id="editor"></div>
	    				  	<textarea style="display:none;" id="noticeContent"name="noticeContent"></textarea>
	    				 </tr>
						</table>
		<button type="submit">등록</button>
						
					</article>
				</div>
			</div>
		</div>
</section>
</form>



<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	
	<script src="/resources/js/toastui.js"></script>
	<script>
		function sendForm(form){
			form.noticeContent.innerText = editor.getHTML();
			form.submit();
			return false;
		}	
	</script>
	
</body>
</html>