<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="model.DonHangView" %>

<%
    List<DonHangView> danhSach = (List<DonHangView>) request.getAttribute("danhSachDonHang");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đơn hàng của tôi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card border shadow-sm">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">🧾 Đơn hàng của bạn</h4>
            <span class="text-muted">Hiển thị cả đơn mua và đơn thuê</span>
        </div>

        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="thead-light">
                        <tr>
                            <th>Loại</th>
                            <th>Mã giao dịch</th>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if (danhSach != null && !danhSach.isEmpty()) {
                            for (DonHangView dh : danhSach) {
                    %>
                        <tr>
                            <td>
                                <% if ("mua".equals(dh.getLoai())) { %>
                                    <span class="badge badge-primary">Mua</span>
                                <% } else if ("thue".equals(dh.getLoai())) { %>
                                    <span class="badge badge-success">Thuê</span>
                                <% } else { %>
                                    <span class="badge badge-secondary">Khác</span>
                                <% } %>
                            </td>
                            <td>#<%= dh.getMaGiaoDich() %></td>
                            <td><%= sdf.format(dh.getNgayDat()) %></td>
                            <td><%= String.format("%,.0f", dh.getTongTien()) %> VNĐ</td>
                            <td>
                                <% String tt = dh.getTrangThai(); %>
                                <% if ("cho_xac_nhan".equals(tt)) { %>
                                    <span class="badge badge-warning">Chờ xác nhận</span>
                                <% } else if ("dang_giao".equals(tt)) { %>
                                    <span class="badge badge-info">Đang giao</span>
                                <% } else if ("da_huy".equals(tt)) { %>
                                    <span class="badge badge-secondary">Đã huỷ</span>
                                <% } else if ("hoan_thanh".equals(tt)) { %>
                                    <span class="badge badge-success">Hoàn thành</span>
                                <% } else if ("cho_xu_ly".equals(tt)) { %>
                                    <span class="badge badge-warning">Chờ xử lý</span>
                                <% } else { %>
                                    <span class="badge badge-light">Không rõ</span>
                                <% } %>
                            </td>
                            <td>
                                <%-- Điều hướng đến trang chi tiết tùy loại --%>
                                <% if ("mua".equals(dh.getLoai())) { %>
                                    <a href="chitietdonmua.jsp?id=<%= dh.getMaGiaoDich() %>" class="btn btn-sm btn-outline-primary">Xem</a>
                                <% } else if ("thue".equals(dh.getLoai())) { %>
                                    <a href="chitiethopdong.jsp?id=<%= dh.getMaGiaoDich() %>" class="btn btn-sm btn-outline-success">Xem</a>
                                <% } else { %>
                                    <button class="btn btn-sm btn-secondary" disabled>Không rõ</button>
                                <% } %>
                            </td>
                        </tr>
                    <% 
                            }
                        } else { 
                    %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">Không có đơn hàng nào.</td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
