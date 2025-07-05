<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán đơn hàng</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Header -->
<jsp:include page="../header.jsp"/>

<div class="container mt-5">
    <h4 class="mb-4">Xác nhận đơn hàng</h4>

    <form id="paymentForm" action="${pageContext.request.contextPath}/XuLyThanhToanMuaServlet" method="post">
        <div class="row">
            <!-- Giỏ hàng -->
            <div class="col-md-8">
                <div class="card p-3 mb-3">
                    <h5>Sản phẩm</h5>
                    <c:forEach var="item" items="${sessionScope.gioHangMua}">
                        <div class="d-flex align-items-center mb-3 border-bottom pb-2">
                            <img src="${pageContext.request.contextPath}/${item.sanPham.urlAnh}" style="width: 60px; height: 60px; object-fit: cover;"
                                 class="me-3"
                                 onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/default.png';">
                            <div class="flex-grow-1">
                                <div><strong>${item.sanPham.ten}</strong></div>
                                <div>Giá: 
                                    <fmt:formatNumber value="${item.sanPham.giaBan}" type="currency" currencySymbol="đ"/>
                                </div>
                            </div>
                            <span class="badge bg-primary rounded-pill">${item.soLuong}</span>
                        </div>
                    </c:forEach>
                </div>

                <div class="card p-3 mb-3">
                    <h5>Thông tin giao hàng</h5>
                    <div class="form-group">
                        <label for="diaDiem">Địa điểm</label>
                        <input type="text" class="form-control" id="diaDiem" name="diaDiem" placeholder="Nhập địa điểm" required>
                    </div>
                    <div class="form-group">
                        <label>Thông tin địa chỉ</label>
                        <div class="row">
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="quocGia" name="quocGia" placeholder="Nhập quốc gia" required>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="thanhPho" name="thanhPho" placeholder="Nhập thành phố" required>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="maBuuDien" name="maBuuDien" placeholder="Nhập mã bưu điện">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ghiChu">Ghi chú</label>
                        <textarea class="form-control" id="ghiChu" name="ghiChu" rows="2" placeholder="Ghi chú thêm (nếu có)"></textarea>
                    </div>
                </div>

                <div class="card p-3 mb-3">
                    <h5>Vận chuyển</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="shipping" value="Nhanh" id="vcNhanh" checked>
                        <label class="form-check-label" for="vcNhanh">Giao trong ngày</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="shipping" value="Thuong" id="vcThuong">
                        <label class="form-check-label" for="vcThuong">Giao sau 2-3 ngày</label>
                    </div>
                </div>
            </div>

            <!-- Tổng hợp -->
            <div class="col-md-4">
                <div class="card p-3 mb-3">
                    <h5>Tổng kết</h5>

                    <c:set var="tongTien" value="0"/>
                    <c:forEach var="item" items="${sessionScope.gioHangMua}">
                        <c:set var="thanhTien" value="${item.soLuong * item.sanPham.giaBan}"/>
                        <c:set var="tongTien" value="${tongTien + thanhTien}"/>
                    </c:forEach>

                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Thành tiền</span>
                            <strong><fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="đ"/></strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Phí vận chuyển</span>
                            <strong><fmt:formatNumber value="150000" type="currency" currencySymbol="đ"/></strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between border-top pt-2">
                            <span>Tổng cộng</span>
                            <strong class="text-danger">
                                <fmt:formatNumber value="${tongTien + 150000}" type="currency" currencySymbol="đ"/>
                            </strong>
                        </li>
                    </ul>

                    <!-- Truyền tổng tiền vào servlet -->
                    <input type="hidden" name="tongTien" value="${tongTien + 150000}"/>
                </div>

                <div class="card p-3">
                    <h5>Phương thức thanh toán</h5>
                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="phuongThuc" id="ck" value="ChuyenKhoan" checked>
                        <label class="form-check-label" for="ck">Chuyển khoản</label>
                    </div>
                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="phuongThuc" id="cod" value="COD">
                        <label class="form-check-label" for="cod">Trả tiền mặt</label>
                    </div>

                    <button type="submit" class="btn btn-dark btn-block mt-3">Xác nhận mua</button>
                </div>
            </div>
        </div>
    </form>

    <!-- Modal thông báo -->
    <div class="modal fade" id="thanhToanModal" tabindex="-1" role="dialog" aria-labelledby="thanhToanModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="thanhToanModalLabel">Thông báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="modalMessage">Xác nhận thanh toán thành công!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Script -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        $('#paymentForm').on('submit', function(e) {
            e.preventDefault(); // Ngăn form submit làm tải lại trang

            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: $(this).serialize(),
                success: function(response) {
                    // Hiển thị modal khi thanh toán thành công
                    $('#modalMessage').text('Xác nhận thanh toán thành công!');
                    $('#thanhToanModal').modal('show');
                    // Có thể xóa giỏ hàng sau khi thanh toán thành công
                    // sessionStorage.removeItem('gioHangMua');
                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi nếu có
                    $('#modalMessage').text('Có lỗi xảy ra khi thanh toán. Vui lòng thử lại.');
                    $('#thanhToanModal').modal('show');
                }
            });
        });
    });
</script>
</body>
</html>