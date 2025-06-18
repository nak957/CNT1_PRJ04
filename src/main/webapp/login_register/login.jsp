<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Goldwin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">
<jsp:include page="../header.jsp" />
<div class="container mt-5 pt-5 d-flex justify-content-center" style="margin-top: 120px !important;">

 <div class="col-md-6 d-flex justify-content-center align-items-center">

                <img src="../assets/img/signin.png" alt="Nội thất" class="img-fluid" style="width: 100%; max-width: 500px;">
            </div>
    <div class="card shadow-sm rounded-4 w-100" style="max-width: 400px;">
        <div class="card-body px-4 py-4">
            <div class="text-center mb-3">
                <a class="navbar-brand fw-bold text-primary" href="/K22CNT1_nhom03_prj04/index.jsp">
                    <img src="../assets/img/logo.png" alt="Goldwin Logo" class="d-inline-block align-text-top img-fluid" style="width: 140px; height: 90px;">
                </a>
                <h5 class="mt-2 mb-1">Đăng nhập</h5>
                <small class="text-muted">để tiếp tục với Goldwin</small>
            </div>

            <!-- ✅ Thông báo đăng xuất thành công -->
            <c:if test="${param.logout == 'success'}">
                <div class="alert alert-success text-center" role="alert">
                    Bạn đã đăng xuất thành công!
                </div>
            </c:if>

            <%-- Hiện thị lỗi khi đăng nhập sai --%>
				<%
				    String error = request.getParameter("error");
				    String message = request.getParameter("message");
				    if ("true".equals(error) && message != null) {
				%>
				    <div class="alert alert-danger text-center" role="alert">
				        <%= java.net.URLDecoder.decode(message, "UTF-8") %>
				    </div>
				<%
				    }
				%>


            <form action="${pageContext.request.contextPath}/DangNhapServlet" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Địa chỉ email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="password" name="password" required>
                        <button type="button" class="btn btn-outline-secondary" id="togglePasswordBtn">
                            <i class="fas fa-eye" id="togglePasswordIcon"></i>
                        </button>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Tiếp tục</button>
            </form>

            <div class="text-center mt-3">
                <small>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/login_register/register.jsp">Đăng ký</a></small>
            </div>

            <div class="text-center mt-3">
                <small class="text-muted">Secured by <strong>Goldwin</strong></small>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('togglePasswordBtn').addEventListener('click', function () {
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