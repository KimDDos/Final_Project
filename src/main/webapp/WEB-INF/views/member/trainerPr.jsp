<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>

<style>
#image_container img {
      max-width: 400px; /* 이미지 최대 너비 설정 */
      height: auto; /* 이미지 비율에 맞추어 자동으로 높이 조절 */
      display: block; /* 이미지가 가로로 화면에 정확히 맞도록 함 */
      margin: 0 auto; /* 이미지 중앙 정렬 */
    }
</style>


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
							<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
    						<div id="image_container"></div>
						</tr>
						<tr>
							<div id="editor"></div>
	    				  	<textarea style="display:none;" id="tranierContent"name="tranierContent"></textarea>
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
	
	<script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
	
</body>
</html>