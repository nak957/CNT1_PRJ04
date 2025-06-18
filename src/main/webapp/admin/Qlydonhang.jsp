<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
    class DonHang {
        int ma;
        String tenNguoiDung;
        double tongTien;
        String trangThai;
        Date ngayDat, ngayCapNhat;

        public DonHang(int ma, String tenNguoiDung, double tongTien, String trangThai, Date ngayDat, Date ngayCapNhat) {
            this.ma = ma;
            this.tenNguoiDung = tenNguoiDung;
            this.tongTien = tongTien;
            this.trangThai = trangThai;
            this.ngayDat = ngayDat;
            this.ngayCapNhat = ngayCapNhat;
        }
    }

    List<DonHang> ds = new ArrayList<>();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    ds.add(new DonHang(1, "Nguyễn Văn A", 1200000, "cho_xac_nhan", new Date(), new Date()));
    ds.add(new DonHang(2, "Trần Thị B", 3500000, "dang_giao", new Date(), new Date()));
    ds.add(new DonHang(3, "Lê Văn C", 900000, "da_huy", new Date(), new Date()));
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-sm border border-secondary">
        <div class="card-header bg-white border-bottom d-flex justify-content-between align-items-center">
            <h4 class="mb-0">🧾 Quản lý đơn hàng</h4>
            <select class="form-control w-auto" onchange="locTrangThai(this.value)">
                <option value="tat_ca">Tất cả</option>
                <option value="cho_xac_nhan">Chờ xác nhận</option>
                <option value="dang_giao">Đang giao</option>
                <option value="da_huy">Đã huỷ</option>
            </select>
        </div>

        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="thead-light">
                        <tr>
                            <th>Mã Đơn</th>
                            <th>Khách Hàng</th>
                            <th>Tổng Tiền</th>
                            <th>Trạng Thái</th>
                            <th>Ngày Đặt</th>
                            <th>Ngày Cập Nhật</th>
                            <th>Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (DonHang d : ds) { %>
                        <tr data-trangthai="<%= d.trangThai %>">
                            <td>#<%= d.ma %></td>
                            <td><%= d.tenNguoiDung %></td>
                            <td><%= String.format("%,.0f", d.tongTien) %> VNĐ</td>
                            <td>
                                <% if ("cho_xac_nhan".equals(d.trangThai)) { %>
                                    <span class="badge badge-warning">Chờ xác nhận</span>
                                <% } else if ("dang_giao".equals(d.trangThai)) { %>
                                    <span class="badge badge-info">Đang giao</span>
                                <% } else if ("da_huy".equals(d.trangThai)) { %>
                                    <span class="badge badge-secondary">Đã huỷ</span>
                                <% } %>
                            </td>
                            <td><%= sdf.format(d.ngayDat) %></td>
                            <td><%= sdf.format(d.ngayCapNhat) %></td>
                            <td>
                                <% if ("cho_xac_nhan".equals(d.trangThai)) { %>
                                    <button class="btn btn-sm btn-success">Xác nhận</button>
                                    <button class="btn btn-sm btn-danger">Huỷ</button>
                                <% } else { %>
                                    <button class="btn btn-sm btn-outline-secondary" disabled>Không khả dụng</button>
                                <% } %>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    function locTrangThai(value) {
        const rows = document.querySelectorAll("tbody tr");
        rows.forEach(row => {
            const trangThai = row.getAttribute("data-trangthai");
            row.style.display = (value === "tat_ca" || trangThai === value) ? "" : "none";
        });
    }
</script>

</body>
</html>
