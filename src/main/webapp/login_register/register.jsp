<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - Goldwin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

    <jsp:include page="../header.jsp" />

    <div class="container mt-5 pt-5" style="margin-top: 120px !important;">
        <div class="row">
            <div class="col-md-6 d-flex justify-content-center">
                <div class="card shadow-sm rounded-4 w-100" style="max-width: 400px;">
                    <div class="card-body px-4 py-4">
                        <div class="text-center mb-3">
                            <a class="navbar-brand fw-bold text-primary" href="/K22CNT1_nhom03_prj04/index.jsp">
                                <img src="../assets/img/logo.png" alt="Goldwin Logo" class="d-inline-block align-text-top img-fluid" style="width: 140px; height: 90px;">
                            </a>
                            <h5 class="mt-2 mb-1">Đăng ký tài khoản</h5>
                            <small class="text-muted">để tiếp tục với Goldwin</small>
                        </div>

                        <%
                            String error = request.getParameter("error");
                            String message = request.getParameter("message");
                            if (error != null && error.equals("true")) {
                        %>
                            <div class="alert alert-danger mt-3" role="alert">
                                <%= message != null ? java.net.URLDecoder.decode(message, "UTF-8") : "Có lỗi xảy ra! Vui lòng thử lại." %>
                            </div>
                        <%
                            } else if (message != null) {
                        %>
                            <div class="alert alert-success mt-3" role="alert">
                                <%= java.net.URLDecoder.decode(message, "UTF-8") %>
                            </div>
                        <%
                            }
                        %>

                        <form action="/K22CNT1_nhom03_prj04/login_register/nguoidung?action=register" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">vui lòng nhập email</label>
                                <input type="text" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật khẩu</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="password" name="matKhau" required>
                                    <button type="button" class="btn btn-outline-secondary" id="togglePasswordBtn">
                                        <i class="fas fa-eye" id="togglePasswordIcon"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="confirm-password" class="form-label">Nhập lại mật khẩu</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
                                    <button type="button" class="btn btn-outline-secondary" id="toggleConfirmPasswordBtn">
                                        <i class="fas fa-eye" id="toggleConfirmPasswordIcon"></i>
                                    </button>
                                </div>
                            </div>
							 <div class="mb-3">
							    <label for="soDienThoai" class="form-label">Số điện thoại</label>
							    <input type="text" class="form-control" id="soDienThoai" name="soDienThoai" required>
							</div><div class="mb-3">
							    <label for="hoTen" class="form-label">Họ tên</label>
							    <input type="text" class="form-control" id="hoTen" name="hoTen" required>
							</div>
							
                            
                            <button type="submit" class="btn btn-primary w-100">Tiếp tục</button>
                            <div id="error-message" class="alert alert-danger mt-3" role="alert" style="display: none;">
                                Mật khẩu không khớp!
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <small>Đã có tài khoản? <a href="/K22CNT1_nhom03_prj04/login_register/login.jsp">Đăng nhập</a></small>
                        </div>

                        <div class="text-center mt-3">
                            <small class="text-muted">Secured by <strong>clerk</strong></small>
                        </div>
                    </div>
                </div>
            </div>
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

        document.getElementById('toggleConfirmPasswordBtn').addEventListener('click', function() {
            const passwordField = document.getElementById('confirm-password');
            const icon = document.getElementById('toggleConfirmPasswordIcon');
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

        document.querySelector('form').addEventListener('submit', function(event) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            if (password !== confirmPassword) {
                event.preventDefault();
                document.getElementById('error-message').style.display = 'block';
            }
        });
    </script>
</body>
</html>