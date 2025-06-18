<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.NhanVien, dao.NhanVienDAO" %>
<%
    request.setCharacterEncoding("UTF-8");

    NhanVienDAO dao = new NhanVienDAO();
    String action = request.getParameter("action");
    String error = null;

    if ("delete".equals(action)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteNhanVien(id);
        } catch (Exception e) {
            error = "Lỗi khi xóa: " + e.getMessage();
        }
    }

    if ("save".equals(action) && "POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int ma = Integer.parseInt(request.getParameter("ma_nhan_vien"));
            String hoTen = request.getParameter("ho_ten");
            String sdt = request.getParameter("so_dien_thoai");
            String email = request.getParameter("email");
            String diaChi = request.getParameter("dia_chi");
            String vaiTro = request.getParameter("vai_tro");
            String trangThai = request.getParameter("trang_thai");

            NhanVien nv = new NhanVien(ma, hoTen, sdt, email, diaChi, vaiTro, trangThai);
            if (dao.getNhanVienById(ma) != null) {
                dao.updateNhanVien(nv);
            } else {
                dao.insertNhanVien(nv);
            }
        } catch (Exception e) {
            error = "Lỗi khi lưu: " + e.getMessage();
        }
    }

    NhanVien nhanVien = null;
    if ("edit".equals(action)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            nhanVien = dao.getNhanVienById(id);
        } catch (Exception e) {
            error = "Lỗi khi lấy dữ liệu: " + e.getMessage();
        }
    }

    List<NhanVien> danhSach = dao.getAllNhanVien();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý nhân viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="mb-4 text-center fw-bold text-primary">Quản lý nhân viên</h2>

    <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <div class="card shadow-sm mb-4">
        <div class="card-header bg-primary text-white fw-semibold">
            <%= (nhanVien != null) ? "Cập nhật nhân viên" : "Thêm nhân viên mới" %>
        </div>
        <div class="card-body">
            <form action="Qlynhanvien.jsp?action=save" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Mã nhân viên</label>
                        <input type="number" name="ma_nhan_vien" class="form-control"
                               value="<%= (nhanVien != null) ? nhanVien.getMaNhanVien() : "" %>"
                               <%= (nhanVien != null) ? "readonly" : "" %> required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Họ tên</label>
                        <input type="text" name="ho_ten" class="form-control"
                               value="<%= (nhanVien != null) ? nhanVien.getHoTen() : "" %>" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Số điện thoại</label>
                        <input type="text" name="so_dien_thoai" class="form-control"
                               value="<%= (nhanVien != null) ? nhanVien.getSoDienThoai() : "" %>" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control"
                               value="<%= (nhanVien != null) ? nhanVien.getEmail() : "" %>" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Địa chỉ</label>
                        <input type="text" name="dia_chi" class="form-control"
                               value="<%= (nhanVien != null) ? nhanVien.getDiaChi() : "" %>">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Vai trò</label>
                        <input type="text" name="vai_tro" class="form-control"
                               value="<%= (nhanVien != null) ? nhanVien.getVaiTro() : "" %>">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Trạng thái</label>
                        <select name="trang_thai" class="form-select">
                            <option value="Đang làm" <%= (nhanVien != null && "Đang làm".equals(nhanVien.getTrangThai())) ? "selected" : "" %>>Đang làm</option>
                            <option value="Nghỉ làm" <%= (nhanVien != null && "Nghỉ làm".equals(nhanVien.getTrangThai())) ? "selected" : "" %>>Nghỉ làm</option>
                        </select>
                    </div>
                </div>
                <div class="mt-4">
                    <button type="submit" class="btn btn-success">Lưu</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-header bg-dark text-white fw-semibold">
            Danh sách nhân viên
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-secondary">
                <tr>
                    <th>Mã</th>
                    <th>Họ tên</th>
                    <th>SĐT</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th>Vai trò</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <% if (danhSach != null && !danhSach.isEmpty()) {
                    for (NhanVien item : danhSach) { %>
                        <tr>
                            <td><%= item.getMaNhanVien() %></td>
                            <td><%= item.getHoTen() %></td>
                            <td><%= item.getSoDienThoai() %></td>
                            <td><%= item.getEmail() %></td>
                            <td><%= item.getDiaChi() %></td>
                            <td><%= item.getVaiTro() %></td>
                            <td><%= item.getTrangThai() %></td>
                            <td>
                                <a href="Qlynhanvien.jsp?action=edit&id=<%= item.getMaNhanVien() %>" class="btn btn-sm btn-warning me-1">Sửa</a>
                                <a href="Qlynhanvien.jsp?action=delete&id=<%= item.getMaNhanVien() %>" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                            </td>
                        </tr>
                    <% }
                } else { %>
                    <tr><td colspan="8">Không có nhân viên nào.</td></tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
