<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%!
class CartItem {
    private String name;
    private String imageUrl;
    private double price;
    private int quantity;

    public CartItem(String name, String imageUrl, double price, int quantity) {
        this.name = name;
        this.imageUrl = imageUrl;
        this.price = price;
        this.quantity = quantity;
    }

    public String getName() { return name; }
    public String getImageUrl() { return imageUrl; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }
}
%>
<%
    List<CartItem> cartItems = new ArrayList<>();
    cartItems.add(new CartItem("Sofa Đen Sang Trọng", "https://via.placeholder.com/80", 6000000, 1));
    cartItems.add(new CartItem("Bàn Cafe Gỗ", "https://via.placeholder.com/80", 2500000, 2));
    DecimalFormat df = new DecimalFormat("#,### VNĐ");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">
<!-- Include Header -->
    <jsp:include page="../header.jsp" />

    <!-- Breadcrumb -->
    <div class="bg-light py-2 mt-5">
        <div class="container-fluid px-5">
           <div class="bg-light py-2 mt-5">
    <div class="container-fluid px-5">

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header d-flex justify-content-between align-items-center bg-white">
            <h4 class="mb-0 text-dark">🛒 Giỏ Hàng</h4>
            <span class="badge badge-secondary">Ưu đãi 40% + Quà tặng 699K</span>
        </div>

        <% if (cartItems.isEmpty()) { %>
            <div class="card-body text-center py-5">
                <img src="https://cdn-icons-png.flaticon.com/512/102/102661.png" class="img-fluid" style="width: 100px;" alt="Empty">
                <h5 class="mt-3 text-muted">Giỏ hàng trống. Hãy thêm sản phẩm nhé!</h5>
            </div>
        <% } else { %>
            <div class="card-body bg-light">
                <div class="table-responsive">
                    <table class="table table-bordered bg-white">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col"><input type="checkbox" id="selectAll" class="form-check-input"></th>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col" class="text-center">Đơn giá</th>
                                <th scope="col" class="text-center">Số lượng</th>
                                <th scope="col" class="text-center">Tạm tính</th>
                                <th scope="col" class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% double total = 0; %>
                        <% for (CartItem item : cartItems) {
                            double itemTotal = item.getPrice() * item.getQuantity();
                            total += itemTotal;
                        %>
                            <tr>
                                <td><input type="checkbox" class="form-check-input item-checkbox" data-price="<%= itemTotal %>"></td>
                                <td>
                                    <div class="media">
                                        <img src="<%= item.getImageUrl() %>" class="mr-3 border rounded" width="60" height="60" alt="SP">
                                        <div class="media-body align-self-center">
                                            <strong class="text-dark"><%= item.getName() %></strong>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center text-dark"><%= df.format(item.getPrice()) %></td>
                                <td class="text-center">
                                    <div class="input-group input-group-sm justify-content-center">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-secondary" type="button">-</button>
                                        </div>
                                        <input type="text" class="form-control text-center" style="max-width: 50px;" value="<%= item.getQuantity() %>" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button">+</button>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center text-primary font-weight-bold"><%= df.format(itemTotal) %></td>
                                <td class="text-center">
                                    <button class="btn btn-sm btn-outline-danger">Xóa</button>
                                </td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <h5 class="mb-0">Tổng cộng: <span id="totalAmount" class="text-primary"><%= df.format(total) %></span></h5>
                    <div>
                        <a href="thanhtoanmua.jsp" class="btn btn-outline-primary btn-lg mr-2">Mua</a>
                        <a href="thanhtoanthue.jsp" class="btn btn-outline-success btn-lg">Thuê</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    document.querySelectorAll('.item-checkbox').forEach(cb => {
        cb.addEventListener('change', () => {
            let total = 0;
            document.querySelectorAll('.item-checkbox:checked').forEach(item => {
                total += parseFloat(item.dataset.price);
            });
            document.getElementById('totalAmount').textContent = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(total);
        });
    });

    document.getElementById('selectAll')?.addEventListener('change', function () {
        let checked = this.checked;
        document.querySelectorAll('.item-checkbox').forEach(cb => cb.checked = checked);
        document.querySelectorAll('.item-checkbox')[0].dispatchEvent(new Event('change'));
    });
</script>

</body>
</html>
