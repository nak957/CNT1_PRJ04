<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%@ page import="model.GioHang, model.SanPham" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thuê Nội Thất - Doanh Nghiệp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

<%
    List<GioHang> gioHangThue = (List<GioHang>) session.getAttribute("gioHangThue");
    DecimalFormat df = new DecimalFormat("#,###");

    int tongTien = 0;
    int tienCoc = 0;
    int phiVanChuyen = 150000;
    int thoiGianThueMacDinh = 1;

    if (gioHangThue != null) {
        for (GioHang item : gioHangThue) {
            SanPham sp = item.getSanPham();
            tongTien += sp.getGiaThue().intValue() * item.getSoLuong() * thoiGianThueMacDinh;
            tienCoc += sp.getTienCoc().intValue();
        }
    }

    int tongDonHang = tongTien + phiVanChuyen;
%>

<div class="container mt-5">
    <form action="${pageContext.request.contextPath}/XuLyThanhToanThueServlet" method="post">
        <div class="row">
            <!-- Cột trái -->
            <div class="col-md-8">
                <div class="card p-4 mb-3">
                    <h5>Thông tin thuê</h5>
                    <% if (gioHangThue != null && !gioHangThue.isEmpty()) {
                        for (GioHang item : gioHangThue) {
                            SanPham sp = item.getSanPham();
                    %>
                    <div class="border-bottom pb-3 mb-4">
                        <div class="d-flex align-items-center">
                            <img src="<%= request.getContextPath() + "/" + sp.getUrlAnh() %>" alt="<%= sp.getTen() %>" class="img-thumbnail mr-3" style="width: 80px;" onerror="this.onerror=null;this.src='<%= request.getContextPath() %>/assets/img/default.png';">
                            <div>
                                <h6 class="mb-1"><%= sp.getTen() %></h6>
                                <small>Giá thuê/tháng: <%= df.format(sp.getGiaThue()) %> đ</small><br>
                                <small>Số lượng: <%= item.getSoLuong() %></small>
                                <input type="hidden" class="giaSanPham" value="<%= sp.getGiaThue().intValue() %>">
                                <input type="hidden" class="soLuongSanPham" value="<%= item.getSoLuong() %>">
                            </div>
                        </div>
                    </div>
                    <% }} else { %>
                        <div class="alert alert-warning">Không có sản phẩm nào trong giỏ hàng thuê.</div>
                    <% } %>

                    <!-- Chọn thời gian thuê -->
                    <div class="card bg-light p-3 mb-4">
                        <h5 class="mb-3">Chọn thời gian thuê</h5>
                        <input type="hidden" name="thoiGianThue" id="thoiGianThueInput" value="1">

                        <div class="btn-group btn-group-toggle d-flex justify-content-between" role="group">
                            <% for (int thang : new int[]{1, 3, 6, 9, 12}) { %>
                                <input type="radio" class="btn-check" name="chonThang" id="thang<%=thang%>" value="<%=thang%>" autocomplete="off" <%= thang == 1 ? "checked" : "" %>>
                                <label class="btn btn-outline-secondary flex-fill mx-1" for="thang<%=thang%>"><%=thang%> tháng</label>
                            <% } %>
                        </div>
                    </div>
                </div>

                <!-- Vận chuyển -->
                <div class="card p-3 mb-3">
                    <h5>Vận chuyển và lắp đặt</h5>
                    <div class="form-group">
                        <label>Địa điểm</label>
                        <input type="text" class="form-control" value="Home" readonly>
                    </div>
                    <div class="form-group">
                        <label>Quốc gia</label>
                        <div class="row">
                            <div class="col-md-4"><input type="text" class="form-control" value="Vietnam" readonly></div>
                            <div class="col-md-4"><input type="text" class="form-control" value="Hồ Chí Minh" readonly></div>
                            <div class="col-md-4"><input type="text" class="form-control" value="-" readonly></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Ghi chú</label>
                        <input type="text" class="form-control" name="ghiChu" placeholder="Chú ý đến số lượng và lắp đặt tại địa chỉ này">
                    </div>
                </div>
            </div>

            <!-- Cột phải -->
            <div class="col-md-4">
                <div class="card p-4 mb-3">
                    <h5>Tổng hợp</h5>
                    <ul class="list-unstyled mb-3">
                        <li class="d-flex justify-content-between">
                            <span>Thành tiền:</span>
                            <strong id="tongTienText"><%= df.format(tongTien) %> đ</strong>
                        </li>
                        <li class="d-flex justify-content-between">
                            <span>Thời gian thuê:</span>
                            <strong id="tongHopThoiGian"><%= thoiGianThueMacDinh %> tháng</strong>
                        </li>
                        <li class="d-flex justify-content-between">
                            <span>Tiền đặt cọc:</span>
                            <strong id="tienCocText"><%= df.format(tienCoc) %> đ</strong>
                        </li>
                        <li class="d-flex justify-content-between">
                            <span>Phí vận chuyển:</span>
                            <strong id="phiVanChuyenText"><%= df.format(phiVanChuyen) %> đ</strong>
                        </li>
                        <li class="d-flex justify-content-between border-top pt-2 mt-2">
                            <span><strong>Tổng đơn hàng:</strong></span>
                            <strong id="tongDonHangText" class="text-danger"><%= df.format(tongDonHang) %> đ</strong>
                        </li>
                    </ul>
                </div>

                <div class="card bg-light text-dark p-4">
                    <h5>Phương Thức Thanh Toán</h5>
                    <div class="btn-group btn-group-toggle d-flex flex-column" data-toggle="buttons">
                        <label class="btn btn-outline-dark text-center flex-fill mb-2 active">
                            <input type="radio" name="phuongThuc" value="ChuyenKhoan" checked> Chuyển khoản
                        </label>
                        <label class="btn btn-light btn-lg btn-block border border-dark">
                            <input type="radio" name="phuongThuc" value="ThanhToanKhiNhanHang"> Thanh toán khi nhận hàng
                        </label>
                    </div>
                    <button type="submit" class="btn btn-dark btn-lg btn-block mt-4">Xác nhận thuê</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Script AJAX cập nhật giá thuê -->
<script>
    console.log("✅ Script loaded!");

    const radios = document.querySelectorAll('input[name="chonThang"]');
    console.log("✅ Radios found:", radios.length);

    radios.forEach(radio => {
        radio.addEventListener("change", function () {
            console.log("✅ Đã chọn số tháng: ", this.value);

            const thang = parseInt(this.value);
            document.getElementById("thoiGianThueInput").value = thang;
            document.getElementById("tongHopThoiGian").textContent = thang + " tháng";

            fetch(`<%=request.getContextPath()%>/TinhTienThueServlet?thoiGian=` + thang)
                .then(response => response.json())
                .then(data => {
                    console.log("✅ Dữ liệu từ servlet:", data);
                    document.getElementById("tongTienText").textContent = data.tongTien;
                    document.getElementById("tienCocText").textContent = data.tienCoc;
                    document.getElementById("tongDonHangText").textContent = data.tongDonHang;
                })
                .catch(error => {
                    console.error("❌ Lỗi khi gọi TinhTienThueServlet:", error);
                });
        });
    });
</script>

</body>
</html>
