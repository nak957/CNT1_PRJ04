<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bàn - Thuê Nội Thất</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

    <!-- Include Header -->
    <jsp:include page="../header.jsp" />

    <!-- Breadcrumb -->
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

    <!-- Danh sách sản phẩm -->
    <div class="container py-1">
        <div class="row text-center">
            <!-- Hàng 1 -->
            <div class="col-6 col-md-4 col-lg-3 mb-4">
                <a href="${pageContext.request.contextPath}/chitietsanpham/BanAn.jsp" class="text-decoration-none text-dark">
                    <div class="border bg-white rounded p-3 shadow">
                        <img src="../assets/img/banan.webp" class="img-fluid w-50 mx-auto d-block mb-2" alt="Bàn ăn">
                        <div>Bàn ăn</div>
                       
                        <div>126.000đ/tháng</div>
                        <div>Hoặc 3.360.000đ </div>
                         <button class="btn btn-outline-dark btn-sm mt-2 w-100">
    <i class="fas fa-cart-plus mr-1"></i> Thêm vào giỏ hàng
</button>

                    </div>
                </a>
            </div>
            
        </div>
    </div>

    <!-- Include Footer -->
    <div class="w-100">
        <jsp:include page="../footer.jsp" />
    </div>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>