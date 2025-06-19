<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.DanhMucDAO, model.DanhMuc, java.util.List" %>
<%
    DanhMucDAO dao = new DanhMucDAO();
    List<DanhMuc> danhMucs = dao.getAll();
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table td, .table th { vertical-align: middle; }
        .modal input, .modal textarea { width: 100%; }
    </style>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow rounded-4">
        <div class="card-header bg-primary text-white text-center fs-4">
            Quản lý Danh mục sản phẩm
        </div>
        <div class="card-body">
            <!-- Form thêm danh mục -->
            <form class="row g-3 mb-4" method="post" action="<%=request.getContextPath()%>/DanhMucServlet">
                <input type="hidden" name="action" value="insert">
                <div class="col-md-4">
                    <input type="text" class="form-control" name="ten" placeholder="Tên danh mục" required>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" name="moTa" placeholder="Mô tả">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success w-100">Thêm mới</button>
                </div>
            </form>

            <!-- Danh sách danh mục -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover text-center align-middle">
                    <thead class="table-secondary">
                        <tr>
                            <th>#</th>
                            <th>Tên</th>
                            <th>Mô tả</th>
                            <th>Ngày tạo</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (DanhMuc dm : danhMucs) { %>
                        <tr>
                            <td><%= dm.getMaDanhMuc() %></td>
                            <td><%= dm.getTen() %></td>
                            <td><%= dm.getMoTa() %></td>
                            <td><%= dm.getNgayTao() %></td>
                            <td>
                                <button class="btn btn-sm btn-warning me-1" data-bs-toggle="modal" data-bs-target="#editModal<%= dm.getMaDanhMuc() %>">
                                    Sửa
                                </button>
                                <a href="<%=request.getContextPath()%>/DanhMucServlet?action=delete&id=<%=dm.getMaDanhMuc()%>"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>

                                <!-- Modal sửa danh mục -->
                                <div class="modal fade" id="editModal<%= dm.getMaDanhMuc() %>" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <form method="post" action="<%=request.getContextPath()%>/DanhMucServlet">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="maDanhMuc" value="<%= dm.getMaDanhMuc() %>">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Sửa danh mục</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label class="form-label">Tên danh mục</label>
                                                        <input type="text" class="form-control" name="ten" value="<%= dm.getTen() %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Mô tả</label>
                                                        <textarea class="form-control" name="moTa"><%= dm.getMoTa() %></textarea>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
