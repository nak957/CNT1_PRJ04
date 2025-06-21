<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.NguoiDung" %>
<%
    NguoiDung nguoiDung = (NguoiDung) session.getAttribute("nguoiDung");
%>
<!-- Navbar (Fixed) -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4 fixed-top">
    <!-- Logo -->
    <a class="navbar-brand font-weight-bold text-primary" href="${pageContext.request.contextPath}/index.jsp">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Goldwin Logo" width="140" height="90" class="d-inline-block align-text-top">
    </a>

    <!-- Toggle button on mobile -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navigation links & actions -->
    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
        <!-- Menu trung tâm -->
        <ul class="navbar-nav mx-auto">
            <li class="nav-item <%= request.getRequestURI().contains("index.jsp") ? "active" : "" %>">
                <a class="nav-link" href="${pageContext.request.contextPath}/khachhang/index_khachhang.jsp">Trang chủ</a>
            </li>
            <li class="nav-item <%= request.getRequestURI().contains("nguoidung/Doanhnghiep.jsp") ? "active" : "" %>">
                <a class="nav-link" href="${pageContext.request.contextPath}/khachhang/Doanhnghiep_khachhang.jsp">Cho Doanh nghiệp</a>
            </li>
            <li class="nav-item <%= request.getRequestURI().contains("Sanpham.jsp") ? "active" : "" %>">
                <a class="nav-link" href="${pageContext.request.contextPath}/khachhang/Sanpham_khachhang.jsp">Sản phẩm</a>
            </li>
        </ul>

        <!-- Nút bên phải -->
		<div class="d-flex align-items-center">
		    <% if (nguoiDung != null) { %>
		        <span class="text-primary fw-semibold pe-3 me-4">
		            👋 Xin chào, <%= nguoiDung.getHoTen() %>!
		        </span>
		    <% } %>
		
		    <!-- Giỏ hàng -->
		    <a id="cartButton" href="${pageContext.request.contextPath}/nguoidung/Giohang.jsp" class="btn btn-outline-primary btn-sm position-relative me-2">
		        <i class="fa-solid fa-shopping-cart"></i>
		        <span id="cartCount" class="badge badge-warning position-absolute" style="top: -6px; right: -10px;">0</span>
		    </a>
		
		    <!-- Vị trí -->
		    <button class="btn btn-outline-secondary btn-sm me-2">
		        <img src="https://flagcdn.com/w20/vn.png" width="20" height="14" class="me-1 align-middle"> Hà Nội
		    </button>
		
		    <!-- Sửa thông tin -->
		    <a href="${pageContext.request.contextPath}/khachhang/suathongtin_khachhang.jsp" class="btn btn-outline-info btn-sm me-2">
		        <i class="fas fa-user-edit me-1"></i> Sửa thông tin
		    </a>
		
		    <!-- Đăng xuất -->
		    <button class="btn btn-outline-danger btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/logout'">
		        <i class="fas fa-sign-out-alt me-1"></i> Đăng xuất
		    </button>
		</div>
    </div>
</nav>
