<jsp:include page="/khachhang/header_khachhang.jsp" />
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Nội dung trang chủ -->
<div class="container py-5">
    <div class="row align-items-center">
        <div class="col-md-6">
            <h1 class="display-4 font-weight-bold mb-0" style="color: #000;">Đừng mua nội thất,</h1>
            <h1 class="display-4 font-weight-bold mb-4" style="color: #007bff;"> hãy thuê nó.</h1>
            <p class="text-muted mb-4">Trang trí cho căn phòng theo cách mà bạn muốn. Thuê nội thất cho không gian của bạn ngay bây giờ và làm mới chúng trong mỗi sự kiện của cuộc sống.</p>
            <a href="#" class="btn btn-primary mr-3">Khám phá</a>
            <a href="#" class="btn btn-outline-primary">Liên hệ</a>
        </div>
        <div class="col-md-6 text-center">
            <img src="${pageContext.request.contextPath}/assets/img/anhghe1.png" alt="Nội thất" class="img-fluid">
            <div class="position-absolute" style="top: 10%; left: 70%; opacity: 0.5; font-size: 30px;">⚪</div>
            <div class="position-absolute" style="top: 30%; right: 20%; opacity: 0.5; font-size: 25px;">🔺</div>
            <div class="position-absolute" style="bottom: 20%; left: 65%; opacity: 0.5; font-size: 20px;">🔶</div>
            <div class="position-absolute" style="bottom: 10%; right: 15%; opacity: 0.5; font-size: 20px;">⬜</div>
        </div>
    </div>
</div>

<div class="container my-5">
    <div class="row align-items-center">
        <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/assets/img/room_ai_home_sofaa.png" alt="Nội thất mới" class="img-fluid rounded">
        </div>
        <div class="col-md-6 text-center text-md-left">
            <h2 class="font-weight-bold">Làm mới không gian sống</h2>
            <p class="text-muted">Khám phá bộ sưu tập nội thất đa dạng, từ hiện đại đến cổ điển, để làm mới không gian sống của bạn chỉ trong vài bước đơn giản.</p>
            <a href="#" class="btn btn-primary">Xem thêm</a>
        </div>
    </div>
</div>

<!-- Combo bàn làm việc -->
<div class="container py-5">
    <h2 class="font-weight-bold mb-4 text-center">Combo bàn làm việc</h2>
    <div class="row justify-content-center">
        <div class="row justify-content-center">
            <!-- Card 1: Gaming Combo -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/lamviec1.png" class="card-img-top" alt="Gaming Combo" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Gaming Combo</h5>
                        <p class="card-text font-weight-bold">368.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 9.799.000 đ</p>
                    </div>
                </div>
            </div>
            <!-- Card 2: IKEA Lover Double Combo -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/lamviec2.png" class="card-img-top" alt="IKEA Lover Double Combo" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">IKEA Lover Double Combo</h5>
                        <p class="card-text font-weight-bold">680.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 18.120.000 đ</p>
                    </div>
                </div>
            </div>
            <!-- Card 3: Minimalism Combo -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/lamviec3.png" class="card-img-top" alt="Minimalism Combo" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Minimalism Combo</h5>
                        <p class="card-text font-weight-bold">500.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 5.156.000 đ</p>
                    </div>
                </div>
            </div>
            <!-- Card 4: Scandinavian Combo -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/lamviec4.png" class="card-img-top" alt="Scandinavian Combo" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Scandinavian Combo</h5>
                        <p class="card-text font-weight-bold">706.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 18.816.000 đ</p>
                    </div>
                </div>
            </div>
    </div>
</div>

<!-- Chuẩn bị phòng -->
<div class="container py-5">
    <div class="row">
        <div class="col-md-6">
            <h2 class="font-weight-bold mb-4">Chuẩn bị phòng trong vài phút</h2>
            <p class="text-muted mb-4">Chọn và nhận phòng ngay hôm nay, không cần đặt cọc, không cần chờ đợi lâu, chỉ cần vài bước đơn giản.</p>
            <ul class="list-unstyled">
                <li class="mb-2"><span style="color: #ffc107; margin-right: 8px;">●</span> Nhiều lựa chọn thuê</li>
                <li class="mb-2"><span style="color: #ffc107; margin-right: 8px;">●</span> Không phí ẩn</li>
                <li class="mb-2"><span style="color: #ffc107; margin-right: 8px;">●</span> Không phí cam kết dài hạn</li>
                <li class="mb-2"><span style="color: #ffc107; margin-right: 8px;">●</span> Đặt phòng trong vài phút</li>
                <li class="mb-2"><span style="color: #ffc107; margin-right: 8px;">●</span> Bảo đảm vận chuyển & lắp đặt</li>
                <li><span style="color: #ffc107; margin-right: 8px;">●</span> Hủy bỏ dễ</li>
            </ul>
        </div>
        <div class="col-md-6">
            <div class="position-relative">
                <img src="${pageContext.request.contextPath}/assets/img/vaiphut.png" alt="Nội thất" class="img-fluid">
                <div class="position-absolute" style="top: 10%; left: 70%; opacity: 0.5; font-size: 30px;">⚪</div>
                <div class="position-absolute" style="top: 30%; right: 20%; opacity: 0.5; font-size: 25px;">🔺</div>
                <div class="position-absolute" style="bottom: 20%; left: 65%; opacity: 0.5; font-size: 20px;">🔶</div>
                <div class="position-absolute" style="bottom: 10%; right: 15%; opacity: 0.5; font-size: 20px;">⬜</div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
