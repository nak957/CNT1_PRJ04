<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.NguoiDung" %>
<%@ page session="true" %>
<%
    NguoiDung user = (NguoiDung) session.getAttribute("nguoiDung");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login_register/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Thông Tin Cá Nhân</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<jsp:include page="../header.jsp" />

<div class="container mt-5 pt-5" style="margin-top: 120px !important;">
    <div class="row">
        <!-- Cột form -->
        <div class="col-md-6 d-flex justify-content-center">
            <div class="card shadow-sm rounded-4 w-100" style="max-width: 400px;">
                <div class="card-body px-4 py-4">
                    <div class="text-center mb-3">
                        <a class="navbar-brand fw-bold text-primary" href="<%=request.getContextPath()%>/index.jsp">
                            <img src="../assets/img/logo.png" alt="Logo" style="width: 140px; height: 90px;">
                        </a>
                        <h5 class="mt-2 mb-1">Sửa Thông Tin Cá Nhân</h5>
                        <small class="text-muted">Cập nhật hồ sơ của bạn</small>
                    </div>

                    <% String message = (String) request.getAttribute("message");
                       if (message != null) { %>
                        <div class="alert alert-success mt-3"><%= message %></div>
                    <% } %>

                    <form method="post" action="<%=request.getContextPath()%>/NguoiDungServlet">
                        <input type="hidden" name="action" value="update_profile">
                        <input type="hidden" name="maNguoiDung" value="<%=user.getMaNguoiDung()%>">

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mật khẩu mới (nếu muốn đổi)</label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="matKhau" id="password" placeholder="Để trống nếu không đổi">
                                <button type="button" class="btn btn-outline-secondary" id="togglePasswordBtn">
                                    <i class="fas fa-eye" id="togglePasswordIcon"></i>
                                </button>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Họ tên</label>
                            <input type="text" class="form-control" name="hoTen" value="<%=user.getHoTen()%>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" name="soDienThoai" value="<%=user.getSoDienThoai()%>" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Địa chỉ</label>
                            <input type="text" class="form-control" name="diaChi" value="<%=user.getDiaChi()%>" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
                        <div class="text-center mt-3">
                            <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-link">Quay lại trang chủ</a>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <small class="text-muted">Secured by <strong>Goldwin</strong></small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cột hình ảnh -->
        <div class="col-md-6 d-flex justify-content-center align-items-center">
            <img src="../assets/img/signup.png" alt="Nội thất" class="img-fluid" style="width: 100%; max-width: 500px;">
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('togglePasswordBtn').addEventListener('click', function() {
        const passwordField = document.getElementById('password');
        const icon = document.getElementById('togglePasswordIcon');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
</script>
</body>
</html>
