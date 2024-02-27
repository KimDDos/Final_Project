<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<!DOCTYPE html>
<!-- Page Content-->
<section class="py-5">
	<div class="container px-1 my-5">
		<div class="row gx-5">
			<div class="col-lg-9">
				<div class="Link">
					<div class="Banner26Other">
						<div id="aboutmap26" class="aboutmap52" tabindex="0"
							style="overflow: hidden; background: rgb(248, 249, 250);">
							<form action="/main/searchMap"
								style="position: absolute; z-index: 100">
								<input id="address" type="text" name="address"
									placeholder="검색할 주소" value="불정로 6">
								<button type="submit" value="주소 검색"
									style="position: absolute; z-index: 100"></button>
							</form>
						</div>
						<script type="text/javascript"></script>
						<script type="text/javascript"
							src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rfx8temqs8"></script>
						<script type="text/javascript" src="/resources/js/naverMap.js">
						</script>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<c:forEach var="nvo" items="${KList }">
					<div class="d-flex align-items-center">
						<img class="img-fluid rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						<div class="ms-3">
							<div class="fw-bold">${nvo.title}</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
</main>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
</body>
</html>
