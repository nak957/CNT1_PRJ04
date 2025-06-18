<%@ page import="model.NguoiDung" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Lấy user từ session
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
    <title>Trang Người Dùng - Thuê Nội Thất</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light pt-5 pt-md-5">
    <!-- Giao diện giống hệt index.jsp nhưng dành cho người đã đăng nhập -->
    <jsp:include page="/content_index.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JQuery (phải có trước Bootstrap JS) -->
	
    
</body>
</html>