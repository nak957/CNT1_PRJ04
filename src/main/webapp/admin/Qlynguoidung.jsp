<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.NguoiDung" %>
<%@ page import="dao.NguoiDungDAO" %>
<%
    List<NguoiDung> listNguoiDung = (List<NguoiDung>) request.getAttribute("listNguoiDung");
    if (listNguoiDung == null) {
        NguoiDungDAO dao = new NguoiDungDAO();
        listNguoiDung = dao.getAllUsers("khachhang");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<h2 class="mb-4">Quản lý người dùng (khách hàng)</h2>

<!-- Form Thêm Người Dùng -->
<form action="${pageContext.request.contextPath}/NguoiDungServlet" method="post" class="mb-4">
    <input type="hidden" name="action" value="insert">
    <div class="row g-3">
        <div class="col-md-3">
            <input type="text" name="email" class="form-control" placeholder="Email" required>
        </div>
        <div class="col-md-2">
            <input type="password" name="matKhau" class="form-control" placeholder="Mật khẩu" required>
        </div>
        <div class="col-md-2">
            <input type="text" name="hoTen" class="form-control" placeholder="Họ tên" required>
        </div>
        <div class="col-md-2">
            <input type="text" name="soDienThoai" class="form-control" placeholder="Số điện thoại">
        </div>
        <div class="col-md-2">
            <input type="text" name="diaChi" class="form-control" placeholder="Địa chỉ">
        </div>
        <div class="col-md-1 d-grid">
            <button type="submit" class="btn btn-success">Thêm</button>
        </div>
    </div>
</form>

<!-- Bảng danh sách người dùng -->
<table class="table table-bordered table-striped align-middle">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Họ tên</th>
        <th>SĐT</th>
        <th>Địa chỉ</th>
        <th>Ngày tạo</th>
        <th>Ngày cập nhật</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (NguoiDung nd : listNguoiDung) {
    %>
        <tr>
            <form action="${pageContext.request.contextPath}/NguoiDungServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="maNguoiDung" value="<%= nd.getMaNguoiDung() %>">
                <td><%= nd.getMaNguoiDung() %></td>
                <td><input type="text" name="email" value="<%= nd.getEmail() %>" class="form-control" required></td>
                <td><input type="text" name="hoTen" value="<%= nd.getHoTen() %>" class="form-control" required></td>
                <td><input type="text" name="soDienThoai" value="<%= nd.getSoDienThoai() %>" class="form-control"></td>
                <td><input type="text" name="diaChi" value="<%= nd.getDiaChi() %>" class="form-control"></td>
                <td><%= nd.getNgayTao() %></td>
                <td><%= nd.getNgayCapNhat() %></td>
                <td class="d-flex gap-1">
                    <input type="password" name="matKhau" value="<%= nd.getMatKhau() %>" hidden>
                    <button type="submit" class="btn btn-primary btn-sm">Sửa</button>
                    <a href="${pageContext.request.contextPath}/NguoiDungServlet?action=delete&id=<%= nd.getMaNguoiDung() %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc muốn xóa người dùng này?');">Xóa</a>
                </td>
            </form>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
