<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>
<script type="text/javascript">
			var markers = [];
</script>

<style>
	
	.aboutmap52 {
		display: block;
		position: relative;
		width: 100%;
		height: 30em;
		margin: auto;
		border: 1px solid #6c757d;
		border-radius: 15px;
	}
	
	.aboutmap52-serch {
		display: block;
		position: relative;
		left: 15px;
		top: 15px;
		width: 92%;
		height: 100%;
	}
	
	.aboutmap52-serch-input {
		border: 0.5px inset #6c757d;
		box-shadow: 1px 1px 1px 0px;
		transition: all 1.25s;
		padding: 10px 10px;
		font-size: 20px;
	}
	
	.aboutmap52-serch-input:focus {
		border-style: inset;
		background: #e9ecef;
	}
	
	.aboutmap52-serch-box {
		width: 100%;
		height: 100%;
	}
	
	@media (min-width: 576px) {
		.aboutmap52-serch {
			width: 85%;
			height: 55px;
		}
	
	}
	
	@media (min-width: 768px) {
		.aboutmap52-serch {
			width: 60%;
			height: 48px;
		}
		
		.aboutmap52-serch-input {
			width: 100%; height: 100%;
		}
	}
	
	@media (min-width: 992px) {
		.aboutmap52-serch {
			width: 33.3333%;
			height: 38px;
		}
		.aboutmap52-serch-input {
			width: 100%; height: 100%;
		}
	}
	
	@media (min-width: 1200px) {
		.aboutmap52-serch {
			width: 25%;
			height: 30px;
		}
		.aboutmap52-serch-input {
			width: 100%; height: 100%;
		}
	}
	
	@media (min-width: 1400px) {
		.aboutmap52-serch {
			width: 15%;
			height: 24px;
		}
		.aboutmap52-serch-input {
			width: 100%; height: 100%;
		}
	}
	/*
	지도부분임 
	.Banner26Other{}
				.Banner26Other .aboutmap26{display:block; position:relative; width:100%; height:10em; margin:auto;}
				.Banner26Other #aboutmap26{}
				.Banner26Other .aboutmap52{display:block; position:relative; width:100%; height:10em; margin:auto;}
				.Banner26Other #aboutmap52{}
				.Banner26Other p{display:block; font-size:10pt; font-weight:200; margin-bottom:0.5em;}
				.Banner26Other p span{}
				.Banner26Other .mapLink{display:block; position:absolute; left:0%; right:0%; top:0%; bottom:0%; width:100%; height:100%;}
				.Banner26Other .mapLink a{display:block; position:relative; width:100%; height:100%;}		
	 */
	
</style>

<div class="container px-1 my-5">
	<div class="row gx-8 ">
	
		<h1>헬스장 선택</h1>
	
		<div class="col-12">
			<div class="Link">
				<div class="mapToSelectGym">
					<div id="aboutmap52" class="aboutmap52" tabindex="0"
						style="overflow: hidden; background: rgb(248, 249, 250);">
						<form action="/main/searchMap"
							style="position: absolute; z-index: 100" class="aboutmap52-serch">
							<input class="aboutmap52-serch-input" id="address" type="text" name="address"
								placeholder="검색할 주소" value="불정로 6">
							<div calss="aboutmap52-serch-box">
								<button type="submit" value="주소 검색"
									style="position: absolute; z-index: 100"><i class="bi bi-box-arrow-left"></i></button>
							</div>
						</form>
					</div>
					<script type="text/javascript"></script>
					<script type="text/javascript"
						src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rfx8temqs8"></script>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3">
			<form action="/reservation/register" method="get">
			<input id="selTitle" name="selTitle" type="text" style="visibility: hidden">
			<input id="selAddress" name="selAddress" type="text" style="visibility: hidden">
				<c:forEach var="nvo" items="${KList }" varStatus="status">
					<button type="button" id="MList${status.index}">
						<div class="d-flex align-items-center">
							<img class="img-fluid rounded-circle"
								src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							<div class="ms-3">
								<div class="fw-bold">${nvo.title}</div>
							</div>
						</div>
						<script type="text/javascript">
								var tmp = {};
								tmp.title = `${nvo.title}`;
								tmp.address = `${nvo.address}`;
								tmp.link = `${nvo.link}`;
								tmp.x = ${nvo.mapx};
								tmp.y = ${nvo.mapy};	
								markers.push(tmp);
								console.log(markers);
							</script>
					</button>
				</c:forEach>
				<button id="selSub" type="submit" style="visibility: hidden">이 장소를 선택</button>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/naverMap.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>