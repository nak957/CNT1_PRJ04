<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, dao.ThanhToanMuaDAO, model.ThanhToanMua" %>
<%@ page import="java.math.BigDecimal" %>
<%
    ThanhToanMuaDAO dao = new ThanhToanMuaDAO();
    List<ThanhToanMua> listThanhToanMua = dao.getAll();

    String action = request.getParameter("action");
    String idRaw = request.getParameter("id");
    ThanhToanMua thanhToanSua = null;

    if ("edit".equals(action) && idRaw != null) {
        int id = Integer.parseInt(idRaw);
        for (ThanhToanMua tt : listThanhToanMua) {
            if (tt.getMaThanhToanMua() == id) {
                thanhToanSua = tt;
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý thanh toán mua</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
    <h2 class="text-center mb-4">Quản lý thanh toán mua</h2>

    <% if (thanhToanSua != null) { %>
        <div class="card mb-4">
            <div class="card-header bg-warning text-dark">
                Chỉnh sửa thanh toán mã: <strong><%= thanhToanSua.getMaThanhToanMua() %></strong>
            </div>
            <div class="card-body">
                <form method="post" action="thanhtoanmua" class="row g-3">
                    <input type="hidden" name="maThanhToanMua" value="<%= thanhToanSua.getMaThanhToanMua() %>">

                    <div class="col-md-4">
                        <label class="form-label">Mã đơn hàng</label>
                        <input type="number" name="maDonHang" class="form-control" value="<%= thanhToanSua.getMaDonHang() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Mã người dùng</label>
                        <input type="number" name="maNguoiDung" class="form-control" value="<%= thanhToanSua.getMaNguoiDung() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Số tiền</label>
                        <input type="text" name="soTien" class="form-control" value="<%= thanhToanSua.getSoTien() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Phương thức</label>
                        <input type="text" name="phuongThuc" class="form-control" value="<%= thanhToanSua.getPhuongThuc() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Trạng thái</label>
                        <input type="text" name="trangThai" class="form-control" value="<%= thanhToanSua.getTrangThai() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Mã giao dịch</label>
                        <input type="text" name="maGiaoDich" class="form-control" value="<%= thanhToanSua.getMaGiaoDich() %>">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        <a href="Qlythanhtoanmua.jsp" class="btn btn-secondary">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    <% } %>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle bg-white shadow-sm">
            <thead class="table-primary text-center">
                <tr>
                    <th>ID</th>
                    <th>Đơn hàng</th>
                    <th>Người dùng</th>
                    <th>Số tiền</th>
                    <th>Phương thức</th>
                    <th>Trạng thái</th>
                    <th>Mã giao dịch</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (ThanhToanMua tt : listThanhToanMua) {
            %>
                <tr class="text-center">
                    <td><%= tt.getMaThanhToanMua() %></td>
                    <td><%= tt.getMaDonHang() %></td>
                    <td><%= tt.getMaNguoiDung() %></td>
                    <td><%= tt.getSoTien() %></td>
                    <td><%= tt.getPhuongThuc() %></td>
                    <td><%= tt.getTrangThai() %></td>
                    <td><%= tt.getMaGiaoDich() %></td>
                    <td><%= tt.getNgayTao() %></td>
                    <td>
                        <a href="Qlythanhtoanmua.jsp?action=edit&id=<%= tt.getMaThanhToanMua() %>" class="btn btn-sm btn-warning">Sửa</a>
                        <form method="get" action="thanhtoanmua" class="d-inline" onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= tt.getMaThanhToanMua() %>">
                            <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
