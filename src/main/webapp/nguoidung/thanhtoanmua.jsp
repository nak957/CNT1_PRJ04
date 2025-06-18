<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, java.text.DecimalFormat" %>
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

    List<CartItem> cartItems = new ArrayList<>();
    cartItems.add(new CartItem("Bộ Phòng Khách 03", "https://via.placeholder.com/100", 13474000, 1, "2025-06-16 11:56"));
    DecimalFormat df = new DecimalFormat("#,### đ");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doanh Nghiệp - Thuê Nội Thất - Thanh Toán</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

<jsp:include page="../header.jsp" />

<div class="container mt-5">
    <div class="row mb-3">
        <div class="col-12">
            <h4 class="mb-0">Thanh Toán</h4>
            <div class="text-danger font-weight-bold mt-2">TẶNG QUÀ 699,000đ | GIẢM 40%</div>
        </div>
    </div>

    <div class="row">
        <!-- Cột trái -->
        <div class="col-md-8">
            <div class="card p-3 mb-3">
                <h5>Giỏ hàng</h5>
                <div class="list-group">
                    <% for (CartItem item : cartItems) { %>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <img src="<%= item.getImageUrl() %>" class="mr-3" style="width: 60px; height: 60px;">
                                <div>
                                    <div><%= item.getName() %></div>
                                    <small class="text-muted">Giá: <%= df.format(item.getPrice()) %></small>
                                </div>
                            </div>
                            <span class="badge badge-primary badge-pill"><%= item.getQuantity() %></span>
                        </div>
                    <% } %>
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

        <!-- Cột phải -->
        <div class="col-md-4">
            <div class="card p-3 mb-3">
                <h5>Tổng hợp</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Thành tiền</span>
                        <strong>6.183.000 đ</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Khuyến mãi</span>
                        <strong>0 đ</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Phí vận chuyển</span>
                        <strong>150.000 đ</strong>
                    </li>
                    <li class="list-group-item d-flex justify-content-between border-top pt-2">
                        <span>Tổng cộng</span>
                        <strong class="text-danger">6.343.000 đ</strong>
                    </li>
                </ul>
            </div>

            <div class="card p-3">
                <h5>Phương thức thanh toán</h5>
                <div class="form-check mb-2">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="ck" value="ChuyenKhoan" checked>
                    <label class="form-check-label" for="ck">Chuyển khoản</label>
                </div>
                <div class="form-check mb-2">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="COD">
                    <label class="form-check-label" for="cod">Thanh toán khi nhận hàng</label>
                </div>
                <button class="btn btn-dark btn-block mt-3">Xác nhận mua </button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
