<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm - Thuê Nội Thất</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-white">

    <!-- Include Header -->
    <jsp:include page="../header.jsp" />

    <!-- Breadcrumb -->
    <div class="bg-light py-2 mt-5">
        <div class="container-fluid px-5">
           <div class="bg-light py-2 mt-5">
    <div class="container-fluid px-5">
        <nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-transparent p-0 m-0">
  <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
  <li class="breadcrumb-item"><a href="#">Bộ sưu tập</a></li>
</ol>

</nav>

    </div>
</div>

</div>

    </div>

    
        <div class="row text-center">	
            <!-- Mỗi sản phẩm là một cột -->
            <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/ban.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/ban.png" class="img-fluid w-50 mx-auto d-block mb-2" alt="Bàn">
                    <div>Bàn</div>
                </a>
            </div>
            <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/ghe.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/ghe.png" class="img-fluid w-50 mx-auto d-block mb-2" alt="Bàn">
                    <div>Ghế</div>
                </a>
            </div>

           
            <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/tuvake.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/ke.png" class="img-fluid w-50 mx-auto d-block mb-2" alt="Tủ và Kệ">
                    <div>Tủ và Kệ</div>
                </a>
            </div>
            <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/den.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/den.png" class="img-fluid w-50 mx-auto d-block mb-2" alt="den">
                    <div>den</div>
                </a>
            </div>
            <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/giuong.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/giuong.png" class="img-fluid w-50 mx-auto d-block mb-2" alt="Giường">
                    <div>Giường</div>
                </a>
            </div>
           <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/phukien.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/phukien.webp" class="img-fluid w-50 mx-auto d-block mb-2" alt="Phụ kiện">
                    <div>Phụ kiện</div>
                </a>
            </div>
            <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/khuvuc.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/khuvuc.webp" class="img-fluid w-50 mx-auto d-block mb-2" alt="khu vực">
                    <div>khu vực</div>
                </a>
            </div>
           <div class="col-6 col-md-4 col-lg-3 mb-4">

                <a href="${pageContext.request.contextPath}/chitietsanpham/combo.jsp" class="text-decoration-none text-dark">
                    <img src="../assets/img/combo.png" class="img-fluid w-50 mx-auto d-block mb-2" alt="Combo">
                    <div>Combo</div>
                </a>
            </div>
        </div>
    </div>

    <!-- FAQ -->
    <div class="container my-5">
        <h2 class="text-center font-weight-bold mb-5">Câu hỏi thường gặp</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5 class="font-weight-bold">Thanh toán phí thuê như thế nào?</h5>
                <p>Bạn cần thanh toán toàn bộ chi phí thuê một lần trước khi bắt đầu hợp đồng.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="font-weight-bold">Có cần đặt cọc không?</h5>
                <p>Tuỳ từng sản phẩm và chương trình, có thể được miễn cọc.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="font-weight-bold">Tôi muốn mua luôn sản phẩm đang thuê?</h5>
                <p>Bạn có thể thanh toán thêm phần chênh lệch giá bán lẻ để sở hữu sản phẩm.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="font-weight-bold">Lỡi hỏi có phải đánh giá?</h5>
                <p>Nếu sản phẩm bị hỏng nghiêm trọng, chúng tôi sẽ đánh giá mức độ hư hỏng để xử lý.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="font-weight-bold">Tôi muốn bổ sung hoặc giảm thiết bị?</h5>
                <p>Dịch vụ linh hoạt cho phép thêm bớt bất kỳ lúc nào.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5 class="font-weight-bold">Dịch vụ lắp đặt và thu hồi?</h5>
                <p>Remospace cung cấp trọn gói từ lắp đặt, bảo trì cho tới thu hồi khi kết thúc hợp đồng.</p>
            </div>
        </div>
    </div>

    <!-- Include Footer -->
    <jsp:include page="../footer.jsp" />

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
