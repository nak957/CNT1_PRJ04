<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thuê Nội Thất - Doanh Nghiệp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap + FontAwesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <script>
        function formatVND(amount) {
            return amount.toLocaleString('vi-VN') + " đ";
        }

        function capNhatChiPhi(index) {
            const giaSanPham = parseFloat(document.getElementById("giaSanPham_" + index).value);
            const thangThue = parseInt(document.getElementById("thoiGianThue_" + index).value);

            const datCoc = giaSanPham * 0.3;
            const tienThueThang = giaSanPham * 0.1;
            const tongTienThue = tienThueThang * thangThue;

            document.getElementById("tienDatCoc_" + index).innerText = formatVND(datCoc);
            document.getElementById("tienThueThang_" + index).innerText = formatVND(tienThueThang);
            document.getElementById("tongTienThue_" + index).innerText = formatVND(tongTienThue);

            // Cập nhật sang bảng Tổng hợp
            document.getElementById("tongHopThoiGian").innerText = thangThue + " tháng";
            document.getElementById("tongHopDatCoc").innerText = formatVND(datCoc);
        }
    </script>
</head>
<body class="bg-light">

<jsp:include page="../header.jsp" />

<div class="container mt-5">
    <div class="row">
        <div class="col-12 mb-4">
            <h4>Thuê Nội Thất</h4>
            <p class="text-danger font-weight-bold">Ưu đãi đặc biệt cho doanh nghiệp</p>
        </div>
    </div>

    <%
        class CartItem {
            private String name;
            private String imageUrl;
            private double price;
            private int quantity;
            private String dateAdded;

            public CartItem(String name, String imageUrl, double price, int quantity, String dateAdded) {
                this.name = name;
                this.imageUrl = imageUrl;
                this.price = price;
                this.quantity = quantity;
                this.dateAdded = dateAdded;
            }
            public String getName() { return name; }
            public String getImageUrl() { return imageUrl; }
            public double getPrice() { return price; }
            public int getQuantity() { return quantity; }
            public String getDateAdded() { return dateAdded; }
        }

        ArrayList<CartItem> cartItems = new ArrayList<>();
        cartItems.add(new CartItem("Bộ Phòng Khách 03", "https://via.placeholder.com/100", 13474000, 1, "2025-06-16"));
        DecimalFormat df = new DecimalFormat("#,###");
        int index = 0;
    %>

    <div class="row">
        <!-- Thông tin thuê -->
        <div class="col-md-8">
            <div class="card p-4 mb-3">
                <h5>Thông tin thuê</h5>
                <% for (CartItem item : cartItems) { %>
                    <div class="border-bottom pb-3 mb-4">
                        <div class="d-flex align-items-center">
                            <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>" class="img-thumbnail mr-3" style="width: 80px;">
                            <div>
                                <h6 class="mb-1"><%= item.getName() %></h6>
                                <small>Giá gốc: <%= df.format(item.getPrice()) %> đ</small>
                                <input type="hidden" id="giaSanPham_<%= index %>" value="<%= item.getPrice() %>">
                            </div>
                        </div>

                        <div class="card bg-light p-3 mb-4">
    <h5 class="mb-3">Chọn thời gian thuê</h5>
    <div class="btn-group btn-group-toggle d-flex justify-content-between" data-toggle="buttons">
        <label class="btn btn-outline-secondary text-center flex-fill mx-1 active">
            <input type="radio" name="thoiGianThue" value="1" checked>
            <div>1 <br>tháng</div>
           
        </label>
        <label class="btn btn-outline-secondary text-center flex-fill mx-1">
            <input type="radio" name="thoiGianThue" value="3">
            <div>3 <br> tháng</div>
           
        </label>
        <label class="btn btn-outline-secondary text-center flex-fill mx-1">
            <input type="radio" name="thoiGianThue" value="6">
            <div>6 <br>tháng</div>
           
        </label>
        <label class="btn btn-outline-secondary text-center flex-fill mx-1">
            <input type="radio" name="thoiGianThue" value="9">
            <div>9 <br> tháng</div>
           
        </label>
        <label class="btn btn-outline-secondary text-center flex-fill mx-1">
            <input type="radio" name="thoiGianThue" value="12">
            <div>12 <br> tháng</div>
           
        </label>
    </div>
</div>

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
                    <input type="text" class="form-control" placeholder="Chú ý đến số lượng và lắp đặt tại địa chỉ này">
                </div>
            </div>

            <div class="card p-3 mb-3">
                <h5>Đơn hàng Doanh nghiệp</h5>
                <div class="form-group">
                    <label>Mã đơn hàng</label>
                    <input type="text" class="form-control" value="1" readonly>
                </div>
            </div>

            <div class="card p-3">
                <h5>Thời gian vận chuyển</h5>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="vanChuyen" id="vcNhanh" value="Nhanh" checked>
                    <label class="form-check-label" for="vcNhanh">Vận chuyển nhanh trong ngày</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="vanChuyen" id="vcThuong" value="Thuong">
                    <label class="form-check-label" for="vcThuong">Nhận sau 2-3 ngày</label>
                </div>
            </div>
                    </div>
                    <% index++; %>
                <% } %>
            </div>
        </div>

        <!-- Tổng hợp + thanh toán -->
        <div class="col-md-4">
            <div class="card p-4 mb-3">
                <h5>Tổng hợp</h5>
                <ul class="list-unstyled mb-3">
                    <li class="d-flex justify-content-between">
                        <span>Thành tiền:</span>
                        <strong>6.183.000 đ</strong>
                    </li>
                    <li class="d-flex justify-content-between">
                        <span></i> Thời gian thuê:</span>
                        <strong id="tongHopThoiGian">1 tháng</strong>
                    </li>
                    <li class="d-flex justify-content-between">
                        <span></i> Tiền đặt cọc:</span>
                        <strong id="tongHopDatCoc">1.800.000 đ</strong>
                    </li>
                    <li class="d-flex justify-content-between">
                        <span>Phí vận chuyển:</span>
                        <strong>150.000 đ</strong>
                    </li>
                    <li class="d-flex justify-content-between">
                        <span>Tổng trước thuế:</span>
                        <strong>6.333.000 đ</strong>
                    </li>
                    <li class="d-flex justify-content-between">
                        <span>Thuế GTGT:</span>
                        <strong>0 đ</strong>
                    </li>
                    <li class="d-flex justify-content-between border-top pt-2 mt-2">
                        <span><strong>Tổng đơn hàng:</strong></span>
                        <strong class="text-danger">6.343.000 đ</strong>
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

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
