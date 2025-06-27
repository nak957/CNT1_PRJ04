<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm theo danh mục - Khách vãng lai</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

    <!-- Header cho khách vãng lai -->
    <jsp:include page="../header.jsp" />

    <!-- Breadcrumb -->
    <div class="bg-light py-2 mt-5">
        <div class="container-fluid px-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent p-0 m-0">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Bộ sưu tập</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="container py-4">
        <div class="row text-center">
            <c:forEach var="sp" items="${danhSachSanPham}">
                <div class="col-6 col-md-4 col-lg-3 mb-4">
                    <div class="border bg-white rounded p-3 shadow h-100">
                        <img src="${pageContext.request.contextPath}/${sp.urlAnh}" class="img-fluid w-50 mx-auto d-block mb-2" alt="${sp.ten}">
                        <div class="font-weight-bold">${sp.ten}</div>
                        <div class="text-danger">
                            <fmt:formatNumber value="${sp.giaThue}" type="currency" currencySymbol="đ"/>/tháng
                        </div>
                        <div class="text-muted small">
                            Hoặc <fmt:formatNumber value="${sp.giaBan}" type="currency" currencySymbol="đ"/>
                        </div>

                        <!-- Form thêm vào giỏ hàng -->
                        <c:choose>
                            <c:when test="${sp.soLuongTon > 0}">
                                <form action="${pageContext.request.contextPath}/GioHangServlet" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="maSanPham" value="${sp.maSanPham}">
                                    <input type="hidden" name="soLuong" value="1">
                                    <button type="submit" class="btn btn-outline-dark btn-sm mt-2 w-100">
                                        <i class="fas fa-cart-plus mr-1"></i> Thêm vào giỏ hàng
                                    </button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-secondary btn-sm mt-2 w-100" disabled>Hết hàng</button>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="../footer.jsp" />

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
