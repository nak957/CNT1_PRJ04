<%@ page import="dao.NhanVienDAO" %>
<%@ page import="model.NhanVien" %>
<%@ page import="java.util.List" %>
<%
    NhanVienDAO dao = new NhanVienDAO();
    List<NhanVien> danhSach = dao.getAllNhanVien();
%>
<%@ page import="model.NguoiDung" %>
<%
    NguoiDung user = (NguoiDung) session.getAttribute("nguoiDung");
    if (user == null) {
        // Nếu chưa đăng nhập thì chuyển hướng về trang login
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Trang quản trị</title>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous">
</head>
<body>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar (unchanged) -->
    <div class="col-md-2 bg-white border-end vh-100 p-3">
      <div class="text-center mb-4">
        <a href="${pageContext.request.contextPath}/index.jsp">
          <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Logo" class="img-fluid" style="max-height: 100px;">
        </a>
      </div>

      <ul class="nav flex-column">
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlynguoidung.jsp"><i class="fas fa-users me-2" ></i>Người dùng</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlysanpham.jsp"><i class="fas fa-box me-2"></i>Sản phẩm</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlydanhmuc.jsp"><i class="fas fa-list me-2"></i>Danh mục</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlygiohang.jsp"><i class="fas fa-shopping-cart me-2"></i>Giỏ hàng</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlydonhang.jsp"><i class="fas fa-truck me-2"></i>Đơn hàng</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlyhopdongthue.jsp"><i class="fas fa-file-contract me-2"></i>Hợp đồng thuê</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlythanhtoanmua.jsp"><i class="fas fa-credit-card me-2"></i>Thanh toán mua</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlythanhtoanthue.jsp"><i class="fas fa-credit-card me-2"></i>Thanh toán thuê</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlynhanvien.jsp"><i class="fas fa-user-tie me-2"></i>Nhân viên</a></li>

        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlychitietdonhang.jsp"><i class="fas fa-file-alt me-2"></i>Chi tiết đơn hàng</a></li>
        <li class="nav-item"><a href="#" class="nav-link text-dark" data-content="${pageContext.request.contextPath}/admin/Qlychitiethopdongthue.jsp"><i class="fas fa-file-alt me-2"></i>Chi tiết hợp đồng thuê </a></li>
     
     
      </ul>
    </div>

    <!-- Main content -->
    <div class="col-md-10 bg-light vh-100 p-4">
      <!-- Header (modified) -->
      <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top" style="left: 16.67%; width: 83.33%;">
        <div class="container-fluid">
          <!-- Navbar brand -->
          <a class="navbar-brand fw-bold text-dark" href="${pageContext.request.contextPath}/admin/index.jsp">Home Admin</a>
          
          <!-- Toggle button for mobile -->
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                  aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <!-- Nút bên phải -->
          <div class="d-flex align-items-center gap-3 ms-auto">
         <!-- Lời chào -->
  			<span class="fw-bold text-dark me-3">Xin chào, <%= user.getHoTen() %>!</span>
            <!-- Thông báo -->
            <a id="notificationButton" href="#" class="btn btn-outline-primary btn-sm position-relative">
              <i class="fa-solid fa-bell"></i>
              <span id="notificationCount" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark">0</span>
            </a>
            <!-- Tin nhắn -->
            <a id="messageButton" href="#" class="btn btn-outline-primary btn-sm position-relative">
              <i class="fa-solid fa-envelope"></i>
              <span id="messageCount" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark">0</span>
            </a>
            <!-- Đăng xuất -->
            <button class="btn btn-outline-danger btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/login_register/login.jsp'">
              <i class="fas fa-sign-out-alt me-1"></i>Đăng xuất
                
              
            </button>
          </div>
        </div>
      </nav>

      <!-- Dynamic Content Area -->
      <div id="main-content" class="mt-5 pt-4">
        <!-- Default content or loading message -->
        <p class="text-center"></p>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    $('.nav-link').click(function(e) {
      e.preventDefault();
      var contentUrl = $(this).data('content');
      $('#main-content').html('<div class="text-center"><div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div></div>');
      $.get(contentUrl, function(data) {
        $('#main-content').html(data);
      }).fail(function() {
        $('#main-content').html('<p class="text-danger text-center mt-5">Không thể tải nội dung.</p>');
      });
    });

    // Load default content (e.g., sanpham.jsp) on page load if desired
    // Uncomment the line below and set the default URL
    // $.get('${pageContext.request.contextPath}/admin/sanpham.jsp', function(data) {
    //   $('#main-content').html(data);
    // });

    // JavaScript to handle cart/notification/message count (optional)
    document.addEventListener('DOMContentLoaded', function() {
      const notificationCount = localStorage.getItem('notificationCount') || 0;
      const messageCount = localStorage.getItem('messageCount') || 0;
      document.getElementById('notificationCount').textContent = notificationCount;
      document.getElementById('messageCount').textContent = messageCount;
    });
  });
</script>
</body>
</html>