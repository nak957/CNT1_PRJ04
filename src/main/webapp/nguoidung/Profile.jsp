<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Của Tôi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100">

<div class="container-fluid">
    <div class="row vh-100">
        <!-- Sidebar -->
        <div class="col-12 col-md-3 bg-light border-end d-flex flex-column align-items-center py-4">
            <!-- Avatar -->
            <label for="avatarInput" class="mb-3">
                <img id="avatarPreview"
                     src="https://via.placeholder.com/120"
                     class="rounded-circle img-thumbnail"
                     alt="Avatar"
                     width="120" height="120">
            </label>
            <input type="file" id="avatarInput" accept="image/*" class="d-none">

            <!-- Tên đăng nhập -->
            <div class="fw-bold mb-4">oanhkimmm04052004</div>

            <!-- Menu -->
            <ul class="list-unstyled w-100 px-3">
                <li class="mb-3">
                    <a href="#" class="load-content text-decoration-none text-dark d-flex align-items-center"
                       data-content="${pageContext.request.contextPath}/nguoidung/hosonguoidung.jsp">
                        <i class="fas fa-user me-2"></i> Tài Khoản Của Tôi
                    </a>
                </li>
                <li class="mb-3">
                    <a href="#" class="load-content text-decoration-none text-dark d-flex align-items-center"
                       data-content="${pageContext.request.contextPath}/nguoidung/donhang.jsp">
                        <i class="fas fa-user me-2"></i> Đơn hàng 
                    </a>
                </li>
                <li class="mb-3 d-flex align-items-center">
                    <i class="fas fa-sign-out-alt me-2"></i> Đăng Xuất
                </li>
            </ul>
        </div>

        <!-- Nội dung chính -->
        <div class="col-12 col-md-9 p-4" id="mainContent">
            <h1 class="mb-4">Xin chào, Oanh!</h1>
            <p>Đây là khu vực nội dung chính. Bạn có thể thêm thông tin cá nhân, chỉnh sửa hồ sơ, v.v...</p>
        </div>
    </div>
</div>

<!-- Script đổi ảnh và load nội dung -->
<script>
    // Xử lý đổi ảnh avatar
    const input = document.getElementById('avatarInput');
    const preview = document.getElementById('avatarPreview');

    input.addEventListener('change', function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                preview.src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });

    // Load nội dung động từ JSP khác
    document.querySelectorAll('.load-content').forEach(function (el) {
        el.addEventListener('click', function (e) {
            e.preventDefault();
            const url = this.getAttribute('data-content');

            fetch(url)
                .then(res => res.text())
                .then(html => {
                    document.getElementById('mainContent').innerHTML = html;
                })
                .catch(err => {
                    console.error('Lỗi khi tải nội dung:', err);
                    document.getElementById('mainContent').innerHTML =
                        '<div class="alert alert-danger">Không thể tải nội dung. Vui lòng thử lại sau.</div>';
                });
        });
    });
</script>

</body>
</html>
