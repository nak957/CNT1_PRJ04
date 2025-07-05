<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Header động -->
<c:choose>
    <c:when test="${not empty sessionScope.userId}">
        <jsp:include page="../khachhang/header_khachhang.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="../header.jsp" />
    </c:otherwise>
</c:choose>

<div class="container mt-5">
    <h2 class="text-center mb-4">Giỏ Hàng</h2>

    <!-- Nếu giỏ hàng trống -->
    <c:if test="${empty gioHangList}">
        <div class="alert alert-info text-center">
            Giỏ hàng của bạn đang trống. <a href="${pageContext.request.contextPath}/sanpham">Mua sắm ngay!</a>
        </div>
    </c:if>

    <!-- Nếu có sản phẩm -->
    <c:if test="${not empty gioHangList}">
        <div class="list-group mb-4">
            <c:forEach var="item" items="${gioHangList}">
                <div class="list-group-item d-flex align-items-center">
                    <!-- Checkbox chọn -->
                    <input type="checkbox" name="chonSanPham" value="${item.maSanPham}" class="form-check-input me-3"/>

                    <!-- Ảnh -->
                    <img src="${pageContext.request.contextPath}/${item.sanPham.urlAnh}" alt="Ảnh"
                         class="img-thumbnail me-3" style="width: 80px; height: 80px;"
                         onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/default.png';" />

                    <div class="flex-grow-1">
                        <h6 class="mb-1">${item.sanPham.ten}</h6>
                        <p class="mb-1">
                            Giá thuê: <fmt:formatNumber value="${item.sanPham.giaThue}" type="currency" currencySymbol="đ"/>
                        </p>
                        <p class="mb-1">
                            Giá mua: <fmt:formatNumber value="${item.sanPham.giaBan}" type="currency" currencySymbol="đ"/>
                        </p>

                        <!-- Form cập nhật số lượng -->
                        <form action="${pageContext.request.contextPath}/GioHangServlet" method="post" class="d-inline">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="maSanPham" value="${item.maSanPham}">
                            <div class="input-group input-group-sm" style="max-width: 140px;">
                                <button class="btn btn-outline-secondary" type="submit" name="soLuong" value="${item.soLuong - 1}"
                                        <c:if test="${item.soLuong <= 1}">disabled</c:if>>-</button>
                                <input type="text" class="form-control text-center" value="${item.soLuong}" readonly>
                                <button class="btn btn-outline-secondary" type="submit" name="soLuong" value="${item.soLuong + 1}"
                                        <c:if test="${item.soLuong >= item.sanPham.soLuongTon}">disabled</c:if>>+</button>
                            </div>
                        </form>
                    </div>

                    <!-- Nút XÓA -->
                    <form action="${pageContext.request.contextPath}/GioHangServlet" method="post" class="d-inline">
                        <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="maSanPham" value="${item.maSanPham}" />
                        <button type="submit" class="btn btn-danger btn-sm ms-3"
                                onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')">
                            Xóa
                        </button>
                    </form>
                </div>
            </c:forEach>
        </div>

        <!-- nút xác nhận thuê và mua -->
        <div class="d-flex justify-content-between align-items-center">
            <a href="${pageContext.request.contextPath}/sanpham" class="btn btn-outline-secondary">⬅ Tiếp tục mua sắm</a>

            <div class="d-flex gap-2">
                <c:choose>
                    <c:when test="${not empty sessionScope.userId}">
                        <!-- Form thuê -->
                        <form id="formThue" action="${pageContext.request.contextPath}/XuLyGioHangServlet" method="post" class="d-inline">
                            <input type="hidden" name="action" value="thue"/>
                            <button type="submit" class="btn btn-primary">Thuê</button>
                        </form>

                        <!-- Form mua -->
                        <form id="formMua" action="${pageContext.request.contextPath}/XuLyGioHangServlet" method="post" class="d-inline">
                            <input type="hidden" name="action" value="mua"/>
                            <button type="submit" class="btn btn-success">Mua</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login_register/login.jsp" class="btn btn-primary">Đăng nhập để tiếp tục</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:if>
</div>

<!-- Script xử lý chọn sản phẩm -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btnThue = document.querySelector("#formThue button");
        const btnMua = document.querySelector("#formMua button");

        btnThue.addEventListener("click", function (e) {
            const form = document.getElementById("formThue");
            copyCheckedCheckboxesToForm(form);
        });

        btnMua.addEventListener("click", function (e) {
            const form = document.getElementById("formMua");
            copyCheckedCheckboxesToForm(form);
        });

        function copyCheckedCheckboxesToForm(form) {
            // Xoá các checkbox cũ
            form.querySelectorAll("input[name='chonSanPham']").forEach(e => e.remove());

            // Lấy checkbox đã chọn
            const checked = document.querySelectorAll("input[name='chonSanPham']:checked");
            checked.forEach(cb => {
                const clone = cb.cloneNode(true);
                clone.type = "hidden";
                form.appendChild(clone);
            });
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
