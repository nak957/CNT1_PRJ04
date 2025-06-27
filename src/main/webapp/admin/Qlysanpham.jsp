<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SanPham, model.DanhMuc" %>

<%
    if (request.getAttribute("danhSachSanPham") == null || request.getAttribute("danhSachDanhMuc") == null) {
        RequestDispatcher rd = request.getRequestDispatcher("/SanPhamServlet?action=list");
        rd.forward(request, response);
        return;
    }

    List<SanPham> danhSachSanPham = (List<SanPham>) request.getAttribute("danhSachSanPham");
    List<DanhMuc> danhSachDanhMuc = (List<DanhMuc>) request.getAttribute("danhSachDanhMuc");
    SanPham sanPhamChinhSua = (SanPham) request.getAttribute("sanPhamChinhSua");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Quản Lý Sản Phẩm</h2>

    <div class="card mb-4">
        <div class="card-header">
            <%= sanPhamChinhSua != null ? "Cập nhật sản phẩm" : "Thêm sản phẩm mới" %>
        </div>
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/SanPhamServlet" enctype="multipart/form-data">
                <input type="hidden" name="action" value="<%= sanPhamChinhSua != null ? "update" : "insert" %>">
                <% if (sanPhamChinhSua != null) { %>
                    <input type="hidden" name="maSanPham" value="<%= sanPhamChinhSua.getMaSanPham() %>">
                <% } %>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên sản phẩm</label>
                        <input type="text" name="ten" class="form-control" required value="<%= sanPhamChinhSua != null ? sanPhamChinhSua.getTen() : "" %>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Danh mục</label>
                        <select name="maDanhMuc" class="form-select" required>
                            <% for (DanhMuc dm : danhSachDanhMuc) { %>
                                <option value="<%= dm.getMaDanhMuc() %>" <%= sanPhamChinhSua != null && sanPhamChinhSua.getMaDanhMuc() == dm.getMaDanhMuc() ? "selected" : "" %>>
                                    <%= dm.getTen() %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Giá thuê</label>
                        <input type="number" name="giaThue" class="form-control" required step="0.01" value="<%= sanPhamChinhSua != null ? sanPhamChinhSua.getGiaThue() : "" %>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Giá bán</label>
                        <input type="number" name="giaBan" class="form-control" step="0.01" value="<%= sanPhamChinhSua != null ? sanPhamChinhSua.getGiaBan() : "" %>">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Tiền cọc</label>
                        <input type="number" name="tienCoc" class="form-control" step="0.01" value="<%= sanPhamChinhSua != null ? sanPhamChinhSua.getTienCoc() : "" %>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Số lượng tồn</label>
                        <input type="number" name="soLuongTon" class="form-control" required value="<%= sanPhamChinhSua != null ? sanPhamChinhSua.getSoLuongTon() : "" %>">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <textarea name="moTa" class="form-control"><%= sanPhamChinhSua != null ? sanPhamChinhSua.getMoTa() : "" %></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Ảnh sản phẩm</label>
                    <input type="file" name="fileAnh" class="form-control" <%= sanPhamChinhSua == null ? "required" : "" %>>
                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-success"><%= sanPhamChinhSua != null ? "Cập nhật" : "Thêm" %></button>
                    <a href="${pageContext.request.contextPath}/admin/Qlysanpham.jsp" class="btn btn-secondary">Làm mới</a>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Tên</th>
            <th>Danh mục</th>
            <th>Giá thuê</th>
            <th>Giá bán</th>
            <th>Số lượng</th>
            <th>Ảnh</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <% for (SanPham sp : danhSachSanPham) { %>
            <tr>
                <td><%= sp.getMaSanPham() %></td>
                <td><%= sp.getTen() %></td>
                <td>
                    <% for (DanhMuc dm : danhSachDanhMuc) {
                        if (dm.getMaDanhMuc() == sp.getMaDanhMuc()) {
                            out.print(dm.getTen());
                            break;
                        }
                    } %>
                </td>
                <td><%= sp.getGiaThue() %></td>
                <td><%= sp.getGiaBan() %></td>
                <td><%= sp.getSoLuongTon() %></td>
                <td>
                    <img src="${pageContext.request.contextPath}/<%= sp.getUrlAnh() %>" width="60" height="60" alt="Ảnh sản phẩm"
                         onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/default.png';">
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/SanPhamServlet?action=edit&id=<%= sp.getMaSanPham() %>" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="${pageContext.request.contextPath}/SanPhamServlet?action=delete&id=<%= sp.getMaSanPham() %>" class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
