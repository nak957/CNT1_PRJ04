<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
    class DonHang {
        int ma;
        double tongTien;
        String trangThai;
        Date ngayDat;

        public DonHang(int ma, double tongTien, String trangThai, Date ngayDat) {
            this.ma = ma;
            this.tongTien = tongTien;
            this.trangThai = trangThai;
            this.ngayDat = ngayDat;
        }
    }

    List<DonHang> danhSach = new ArrayList<>();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

    danhSach.add(new DonHang(1001, 1500000, "cho_xac_nhan", new Date()));
    danhSach.add(new DonHang(1002, 2200000, "dang_giao", new Date()));
    danhSach.add(new DonHang(1003, 900000, "da_huy", new Date()));
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
        <div class="card-header bg-white">
            <h4 class="mb-0">🧾 Đơn hàng của bạn</h4>
        </div>

        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="thead-light">
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (DonHang dh : danhSach) { %>
                        <tr>
                            <td>#<%= dh.ma %></td>
                            <td><%= sdf.format(dh.ngayDat) %></td>
                            <td><%= String.format("%,.0f", dh.tongTien) %> VNĐ</td>
                            <td>
                                <% if ("cho_xac_nhan".equals(dh.trangThai)) { %>
                                    <span class="badge badge-warning">Chờ xác nhận</span>
                                <% } else if ("dang_giao".equals(dh.trangThai)) { %>
                                    <span class="badge badge-info">Đang giao</span>
                                <% } else if ("da_huy".equals(dh.trangThai)) { %>
                                    <span class="badge badge-secondary">Đã huỷ</span>
                                <% } else if ("hoan_thanh".equals(dh.trangThai)) { %>
                                    <span class="badge badge-success">Hoàn thành</span>
                                <% } else { %>
                                    <span class="badge badge-light">Không rõ</span>
                                <% } %>
                            </td>
                            <td><a href="chitietdonhang.jsp?id=<%= dh.ma %>" class="btn btn-sm btn-outline-primary">Xem</a></td>
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
