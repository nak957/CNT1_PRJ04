<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.HopDongThue" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (request.getAttribute("danhSachHopDong") == null) {
        request.getRequestDispatcher("hopdongthue?action=list").forward(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý hợp đồng thuê</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">📄 Quản lý hợp đồng thuê</h2>

    <!-- Tìm kiếm -->
    <form method="get" action="hopdongthue" class="row g-3 mb-4 align-items-center">
        <input type="hidden" name="action" value="search">
        <div class="col-md-4">
            <input type="text" class="form-control" name="tenNguoiDung" placeholder="Tên người dùng"
                   value="${timTenNguoiDung}">
        </div>
        <div class="col-md-4">
            <select class="form-select" name="trangThai">
                <option value="">-- Trạng thái --</option>
                <option value="cho_xu_ly" ${timTrangThai == 'cho_xu_ly' ? 'selected' : ''}>Chờ xử lý</option>
                <option value="hoat_dong" ${timTrangThai == 'hoat_dong' ? 'selected' : ''}>Hoạt động</option>
                <option value="da_huy" ${timTrangThai == 'da_huy' ? 'selected' : ''}>Đã hủy</option>
                <option value="hoan_thanh" ${timTrangThai == 'hoan_thanh' ? 'selected' : ''}>Hoàn thành</option>
            </select>
        </div>
        <div class="col-md-4">
            <button type="submit" class="btn btn-primary">🔍 Tìm kiếm</button>
            <a href="hopdongthue" class="btn btn-secondary">🔄 Tải lại</a>
        </div>
    </form>

    <!-- Bảng dữ liệu -->
    <div class="table-responsive">
        <table class="table table-bordered text-center align-middle">
            <thead class="table-light">
            <tr>
                <th>Mã HĐ</th>
                <th>Mã ND</th>
                <th>Loại</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Thời gian</th>
                <th>Tổng phí</th>
                <th>Tiền cọc</th>
                <th>Trạng thái</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhật</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hd" items="${danhSachHopDong}">
                <tr>
                    <td>${hd.maHopDong}</td>
                    <td>${hd.maNguoiDung}</td>
                    <td>${hd.loaiHopDong}</td>
                    <td>${hd.ngayBatDau}</td>
                    <td>${hd.ngayKetThuc}</td>
                    <td>${hd.thoiGianThue}</td>
                    <td>${hd.tongPhi}</td>
                    <td>${hd.tienCoc}</td>
                    <td>${hd.trangThai}</td>
                    <td>${hd.ngayTao}</td>
                    <td>${hd.ngayCapNhat}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal"
                                onclick="fillForm('${hd.maHopDong}', '${hd.loaiHopDong}', '${hd.ngayBatDau}', '${hd.ngayKetThuc}', '${hd.thoiGianThue}', '${hd.tongPhi}', '${hd.tienCoc}', '${hd.trangThai}', '${hd.ngayTraThucTe}', '${hd.phiPhat}', '${hd.ghiChu}')">
                            ✏️
                        </button>
                        <a href="hopdongthue?action=delete&id=${hd.maHopDong}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa hợp đồng này?')">🗑️</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal sửa -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <form method="post" class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa hợp đồng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="maHopDong" id="maHopDong">
                    <div class="form-floating mb-2">
                        <input type="text" class="form-control" name="loaiHopDong" id="loaiHopDong" required>
                        <label>Loại hợp đồng</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="date" class="form-control" name="ngayBatDau" id="ngayBatDau" required>
                        <label>Ngày bắt đầu</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="date" class="form-control" name="ngayKetThuc" id="ngayKetThuc" required>
                        <label>Ngày kết thúc</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="number" class="form-control" name="thoiGianThue" id="thoiGianThue" required>
                        <label>Thời gian thuê (tháng)</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="number" class="form-control" name="tongPhi" id="tongPhi" required>
                        <label>Tổng phí</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="number" class="form-control" name="tienCoc" id="tienCoc">
                        <label>Tiền cọc</label>
                    </div>
                    <div class="mb-2">
                        <label>Trạng thái</label>
                        <select class="form-select" name="trangThai" id="trangThai">
                            <option value="cho_xu_ly">Chờ xử lý</option>
                            <option value="hoat_dong">Hoạt động</option>
                            <option value="da_huy">Đã hủy</option>
                            <option value="hoan_thanh">Hoàn thành</option>
                        </select>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="date" class="form-control" name="ngayTraThucTe" id="ngayTraThucTe">
                        <label>Ngày trả thực tế</label>
                    </div>
                    <div class="form-floating mb-2">
                        <input type="number" class="form-control" name="phiPhat" id="phiPhat">
                        <label>Phí phạt</label>
                    </div>
                    <div class="form-floating">
                        <textarea class="form-control" name="ghiChu" id="ghiChu" style="height: 80px"></textarea>
                        <label>Ghi chú</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">💾 Lưu</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function fillForm(maHopDong, loaiHopDong, ngayBatDau, ngayKetThuc, thoiGianThue, tongPhi, tienCoc, trangThai, ngayTraThucTe, phiPhat, ghiChu) {
        document.getElementById('maHopDong').value = maHopDong;
        document.getElementById('loaiHopDong').value = loaiHopDong;
        document.getElementById('ngayBatDau').value = ngayBatDau;
        document.getElementById('ngayKetThuc').value = ngayKetThuc;
        document.getElementById('thoiGianThue').value = thoiGianThue;
        document.getElementById('tongPhi').value = tongPhi;
        document.getElementById('tienCoc').value = tienCoc;
        document.getElementById('trangThai').value = trangThai;
        document.getElementById('ngayTraThucTe').value = ngayTraThucTe || '';
        document.getElementById('phiPhat').value = phiPhat;
        document.getElementById('ghiChu').value = ghiChu;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
