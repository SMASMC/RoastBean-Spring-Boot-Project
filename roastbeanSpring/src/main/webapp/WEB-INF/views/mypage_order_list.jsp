<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Roast Bean : My Order List</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <style type="text/css">
  .form-control3 {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  font-weight: 400;
  	  line-height: 1em;
  	  text-align-center;
	  color: #212529;
	  background-color: #CFD4D9;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.375rem;
	  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	  height: 32px; 
	}
  </style>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>
<body>
  <!-- ======= Header ======= -->
	<%@include file = "header_innerpage.jsp" %>
  <!-- End Header -->
  <main id="main">
    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
			<a class="nav-link scrollto" href="mypage_info_list">My Information</a>
			<a class="nav-link scrollto" href="mypage_order_list_"><font color="8784D6" style="font-size: 1.2em; font-weight: bold;">My Order List</font></a>
			<a class="nav-link scrollto" href="myboardlist">My Write</a>
			<a class="nav-link scrollto" href="mypage_qna_list_">My QnA</a>
			&emsp;&emsp;&emsp;
			<ol>
				<li><a href="index.jsp">Home</a></li>
				<li>My page</li>
			</ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs Section -->
    
	<section class="inner-page">
		<div class="container">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;Order List</h3>
				<hr style="border: solid 2px red;">
				<br>
				<table class="table table-hover" style="vertical-align: middle;">
					<thead>
						<tr align="center">
							<th style="width: 30%;">상품정보</th>
							<th style="width: 15%;">주문일자</th>
							<th style="width: 15%;">주문번호</th>
							<th style="width: 15%;">주문금액(수량)</th>
							<th style="width: 15%;">주문상태</th>
						</tr>
					</thead>
					<c:forEach items="${myOrderList}" var="dto">
						<tr align="center">
							<td align="left"><a href="productDetail?product_id=${dto.product_id}"><img width="100" height="100" alt="" src="assets/img/product/${dto.product_image}">${dto.product_name}</a></td>
							<td>${dto.order_date}</td>
							<td>${dto.order_seq}</td>
							<td><fmt:formatNumber value="${dto.order_price}" groupingUsed="true" />원<br>${dto.order_qty}개</td>
							<c:if test="${dto.order_reviewcheck < 1 or dto.order_reviewcheck == null}">
								<td><a href="productReview?order_seq=${dto.order_seq}">후기작성</a></td>
							</c:if>
							<c:if test="${dto.order_reviewcheck > 0}">
								<td>후기작성 완료</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
				<div class="container" align="center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${(page.curPage - 1) < 1 }">
									<li class="page-item disabled"><a class="page-link">처음</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="mypage_order_list_?page=1">처음</a>
									</li>
								</c:otherwise>
							</c:choose>
							<!-- 이전 -->
							<c:choose>
								<c:when test="${(page.curPage - 1) < 1 }">
									<li class="page-item disabled"><a class="page-link">이전</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="mypage_order_list_?page=${page.curPage - 1 }">이전</a>
									</li>
								</c:otherwise>
							</c:choose>
							<!-- 개별 페이지 -->
							<c:forEach var="fEach" begin="${page.startPage }"
								end="${page.endPage }" step="1">
								<c:choose>
									<c:when test="${page.curPage == fEach}">
										<li class="page-item disabled"><a class="page-link active">&nbsp;${fEach }&nbsp;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="mypage_order_list_?page=${fEach }">&nbsp;${fEach }&nbsp;</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- 다음 -->
							<c:choose>
								<c:when test="${(page.curPage + 1) > page.totalPage }">
									<li class="page-item disabled"><a class="page-link">다음</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="productDetail?page=${page.curPage + 1 }">다음</a>
									</li>
								</c:otherwise>
							</c:choose>
							<!-- 끝 -->
							<c:choose>
								<c:when test="${page.curPage == page.totalPage }">
									<li class="page-item disabled"><a class="page-link">마지막</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="mypage_order_list_?page=${page.totalPage }">마지막</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
			</div>
	</section>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
	<%@include file = "footer.jsp" %>
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>