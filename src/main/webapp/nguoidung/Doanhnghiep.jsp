<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doanh Nghiệp - Thuê Nội Thất</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

    <!-- Include Header -->
    <jsp:include page="../header.jsp" />

    <!-- Thêm mt-5 để tránh bị che bởi header -->
    <div class="container py-5 mt-5">
        <div class="row align-items-center">
            <!-- Chữ bên trái -->
            <div class="col-md-6">
                <h1 class="display-4 font-weight-bold mb-0" style="color: #000;">Bắt đầu doanh nghiệp của bạn một cách linh hoạt,</h1>
                <h1 class="display-4 font-weight-bold mb-4" style="color: #007bff;"> và tiết kiệm.</h1>
                <p class="text-muted mb-4">Đối với chúng tôi, điều đó thật đơn giản - không sở hữu. Bạn thuê văn phòng của bạn. Máy in của bạn. Hay thậm chí là cây cảnh trong công ty. Vậy tại sao bạn phải sở hữu nội thất văn phòng của bạn? Hãy giải phóng dòng tiền cho những nguồn đầu tư hợp lý hơn.</p>
                <a href="#" class="btn btn-primary mr-3">Khám phá</a>
                <a href="#" class="btn btn-outline-primary">Liên hệ</a>
            </div>
            <!-- Ảnh bên phải -->
            <div class="col-md-6 text-center">
                <img src="../assets/img/chodoanhnghiep.png" alt="Nội thất" class="img-fluid">
                <!-- Hình trang trí -->
                <div class="position-absolute" style="top: 10%; left: 70%; opacity: 0.5; font-size: 30px;">⚪</div>
                <div class="position-absolute" style="top: 30%; right: 20%; opacity: 0.5; font-size: 25px;">🔺</div>
                <div class="position-absolute" style="bottom: 20%; left: 65%; opacity: 0.5; font-size: 20px;">🔶</div>
                <div class="position-absolute" style="bottom: 10%; right: 15%; opacity: 0.5; font-size: 20px;">⬜</div>
            </div>
        </div>
    </div>

    <!-- Section mới: Ảnh và Chữ -->
    <div class="container my-5">
        <div class="row align-items-center">
            <!-- Ảnh bên trái -->
            <div class="col-md-6">
                <img src="../assets/img/room_ai_home_sofaa.png" alt="Nội thất mới" class="img-fluid rounded">
            </div>
            <!-- Chữ bên phải -->
            <div class="col-md-6 text-center text-md-left">
                <h2 class="font-weight-bold">Chưa có ý tưởng cho văn phòng của bạn?</h2>
                <p class="text-muted">Trải nghiệm công cụ thiết kế AI của Remospace. Chụp ảnh căn phòng của bạn, lựa chọn phong cách và xem điều kỳ diệu sau 2 giây.</p>
                <a href="#" class="btn btn-primary">Xem thêm</a>
            </div>
        </div>
    </div>

    <div class="container-lg py-5 mt-5">
        <div class="row align-items-stretch">
            <!-- Chữ bên trái -->
            <div class="col-md-6 p-4 bg-dark text-white rounded h-100 d-flex flex-column justify-content-center">
                <h1 class="display-4 font-weight-bold mb-3">
                    Mở rộng hoặc thu hẹp doanh nghiệp của bạn - hoặc tái cấu trúc.
                </h1>
                <p class="lead">
                    Chúng tôi biết rằng các điều kiện kinh doanh đang thay đổi nhanh hơn bao giờ hết. Và việc tạo ra một cách tiếp cận mới và sáng tạo cho doanh nghiệp của bạn là tất cả những gì chúng tôi hướng tới. Remospace giúp bạn tự do thay đổi gói thuê tại bất kỳ thời điểm nào, miễn phí và không bị ràng buộc. Bất kể những thay đổi này là nhỏ, chẳng hạn như thay mới một vài loại nội thất, tăng giảm nội thất theo quy mô.
                </p>
            </div>

            <!-- Ảnh bên phải -->
            <div class="col-md-6 position-relative h-100 d-flex align-items-center">
                <div class="w-100 h-100 d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/assets/img/chodoanhnghiep2.jpg"
                         alt="Nội thất"
                         class="img-fluid rounded w-100"
                         style="object-fit: cover; max-height: 100%;">
                </div>
            </div>
        </div>
    </div>
    
    
        <!-- Section Combo bàn làm việc -->
    <div class="container py-5">
        <h2 class="font-weight-bold mb-4 text-center">Combo bàn làm việc</h2>
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

    <!-- Section Combo Khách và Phòng Ngủ -->
    <div class="container py-5">
        <h2 class="font-weight-bold mb-4 text-center">Combo Khách và Phòng Ngủ</h2>
        <div class="row justify-content-center">
            <!-- Card 1: Set phòng khách 01 -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/ngu1.png" class="card-img-top" alt="Set phòng khách 01" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Set phòng khách 01</h5>
                        <p class="card-text font-weight-bold">368.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 9.799.000 đ</p>
                    </div>
                </div>
            </div>
            <!-- Card 2: Set phòng khách 02 -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/ngu2.png" class="card-img-top" alt="Set phòng khách 02" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Set phòng khách 02</h5>
                        <p class="card-text font-weight-bold">680.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 18.120.000 đ</p>
                    </div>
                </div>
            </div>
            <!-- Card 3: Set phòng ngủ 01 -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/ngu3.png" class="card-img-top" alt="Set phòng ngủ 01" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Set phòng ngủ 01</h5>
                        <p class="card-text font-weight-bold">500.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 5.156.000 đ</p>
                    </div>
                </div>
            </div>
            <!-- Card 4: Set phòng ngủ 02 -->
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card h-100 shadow-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/ngu4.png" class="card-img-top" alt="Set phòng ngủ 02" style="height: 200px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">Set phòng ngủ 02</h5>
                        <p class="card-text font-weight-bold">706.000 đ/tháng</p>
                        <p class="card-text text-muted">Hoặc mua từ 18.816.000 đ</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="container my-5">
    <h2 class="text-center font-weight-bold mb-5">Câu hỏi thường gặp</h2>
    <div class="row">
        <!-- Câu hỏi 1 -->
        <div class="col-md-4 mb-4">
            <h5 class="font-weight-bold">Thanh toán phí thuê như thế nào?</h5>
            <p>Phí thuê là khoản phí thanh toán một lần cho toàn bộ quá trình thuê để đảm bảo sự cam kết của bạn với gói thuê. Ví dụ bạn thuê một ghế sofa trong 3 tháng với giá 1.000.000đ/tháng. Bạn cần thanh toán 3.000.000đ để bắt đầu thuê.</p>
        </div>

        <!-- Câu hỏi 2 -->
        <div class="col-md-4 mb-4">
            <h5 class="font-weight-bold">Có cần đặt cọc không?</h5>
            <p>Có, đặt cọc là một phần đảm bảo trách nhiệm của bạn trong quá trình sử dụng, tuy nhiên trong một vài trường hợp và tuỳ từng thời điểm, chúng tôi sẽ có chính sách miễn đặt cọc. Hãy liên hệ để biết thêm nhé.</p>
        </div>

        <!-- Câu hỏi 3 -->
        <div class="col-md-4 mb-4">
            <h5 class="font-weight-bold">Nếu đang thuê mà tôi mua đứt thì sao?</h5>
            <p>Chúng tôi không khuyến khích điều này vì nó làm tăng tác lượng rác thải ra trái đất khi sản phẩm không được tái sử dụng. Tuy nhiên nếu bạn thực sự yêu thích sản phẩm đang thuê, chỉ cần thanh toán phần chênh lệch so với giá bán lẻ để có thể sở hữu nhé.</p>
        </div>

        <!-- Câu hỏi 4 -->
        <div class="col-md-4 mb-4">
            <h5 class="font-weight-bold">Tôi có phải đền bù nếu làm hỏng sản phẩm?</h5>
            <p>Chúng tôi có quy định cụ thể về hao mòn tự nhiên trong quá trình sử dụng. Tuy nhiên nếu bạn làm hỏng, gãy sản phẩm một cách nghiêm trọng, hãy sử dụng dịch vụ sửa chữa của chúng tôi.</p>
        </div>

        <!-- Câu hỏi 5 -->
        <div class="col-md-4 mb-4">
            <h5 class="font-weight-bold">Tôi có thể thuê thêm hoặc giảm bớt sản phẩm?</h5>
            <p>Hoàn toàn có thể, chúng tôi cung cấp dịch vụ linh hoạt giúp bạn mở rộng hay thu hẹp văn phòng một cách dễ dàng.</p>
        </div>

        <!-- Câu hỏi 6 -->
        <div class="col-md-4 mb-4">
            <h5 class="font-weight-bold">Bạn sẽ giúp tôi lắp đặt và thu hồi chứ?</h5>
            <p>Tất nhiên rồi, dịch vụ của Remospace là trọn gói. Chúng tôi cung cấp bao gồm cả vận chuyển, lắp đặt, bảo dưỡng và thu hồi. Bạn chỉ cần đặt và tận hưởng.</p>
        </div>
    </div>
</div>

    <!-- Include Footer -->
    <jsp:include page="../footer.jsp" />

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
