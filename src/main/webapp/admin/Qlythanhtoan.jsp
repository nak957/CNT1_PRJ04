<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý thanh toán</h2>
  
  <table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-light">
      <tr>
        <th>Mã thanh toán</th>
        <th>Mã hợp đồng</th>
        <th>Mã người dùng</th>
        <th>Loại thanh toán</th>
        <th>Số tiền</th>
        <th>Phương thức</th>
        <th>Trạng thái</th>
        <th>Mã giao dịch</th>
        <th>Ngày tạo</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Sample data (replace with dynamic data using JSTL or servlet) -->
      <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>Thanh toán tiền thuê</td>
        <td>2,500,000</td>
        <td>Chuyển khoản</td>
        <td>Cho xử lý</td>
        <td>GD123456</td>
        <td>2025-05-20 12:47:00</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#paymentModal" 
                  onclick="editPayment(1, 1, 1, 'Thanh toan tien thue', 2500000, 'Chuyen khoan', 'cho_xu_ly', 'GD123456')">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deletePayment(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal for Add/Edit Payment -->
  <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="paymentModalLabel">Thêm thanh toán</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="paymentForm" action="${pageContext.request.contextPath}/admin/SavePayment" method="post">
            <input type="hidden" id="ma_thanh_toan" name="ma_thanh_toan">
            <div class="mb-3">
              <label for="ma_hop_dong" class="form-label fw-medium">Mã hợp đồng</label>
              <input type="number" class="form-control" id="ma_hop_dong" name="ma_hop_dong" required>
            </div>
            <div class="mb-3">
              <label for="ma_nguoi_dung" class="form-label fw-medium">Mã người dùng</label>
              <input type="number" class="form-control" id="ma_nguoi_dung" name="ma_nguoi_dung" required>
            </div>
            <div class="mb-3">
              <label for="loai_thanh_toan" class="form-label fw-medium">Loại thanh toán</label>
              <select class="form-select" id="loai_thanh_toan" name="loai_thanh_toan" required>
                <option value="Thanh toan tien thue">Thanh toán tiền thuê</option>
                <option value="Thanh toan tien coc">Thanh toán tiền cọc</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="so_tien" class="form-label fw-medium">Số tiền</label>
              <input type="number" class="form-control" id="so_tien" name="so_tien" step="0.01" required>
            </div>
            <div class="mb-3">
              <label for="phuong_thuc" class="form-label fw-medium">Phương thức</label>
              <select class="form-select" id="phuong_thuc" name="phuong_thuc" required>
                <option value="Chuyen khoan">Chuyển khoản</option>
                <option value="Tien mat">Tiền mặt</option>
                <option value="The tin dung">Thẻ tín dụng</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="trang_thai" class="form-label fw-medium">Trạng thái</label>
              <select class="form-select" id="trang_thai" name="trang_thai">
                <option value="cho_xu_ly">Cho xử lý</option>
                <option value="hoan_thanh">Hoàn thành</option>
                <option value="that_bai">Thất bại</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="ma_giao_dich" class="form-label fw-medium">Mã giao dịch</label>
              <input type="text" class="form-control" id="ma_giao_dich" name="ma_giao_dich">
            </div>
            <button type="submit" class="btn btn-primary w-100">Lưu</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
  function editPayment(ma_thanh_toan, ma_hop_dong, ma_nguoi_dung, loai_thanh_toan, so_tien, phuong_thuc, trang_thai, ma_giao_dich) {
    document.getElementById('paymentModalLabel').textContent = 'Sửa thanh toán';
    document.getElementById('ma_thanh_toan').value = ma_thanh_toan;
    document.getElementById('ma_hop_dong').value = ma_hop_dong;
    document.getElementById('ma_nguoi_dung').value = ma_nguoi_dung;
    document.getElementById('loai_thanh_toan').value = loai_thanh_toan;
    document.getElementById('so_tien').value = so_tien;
    document.getElementById('phuong_thuc').value = phuong_thuc;
    document.getElementById('trang_thai').value = trang_thai;
    document.getElementById('ma_giao_dich').value = ma_giao_dich || '';
  }

  function deletePayment(ma_thanh_toan) {
    if (confirm('Bạn có chắc muốn xóa thanh toán này?')) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeletePayment?ma_thanh_toan=' + ma_thanh_toan;
    }
  }

  document.getElementById('paymentModal').addEventListener('show.bs.modal', function (event) {
    if (!event.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('paymentModalLabel').textContent = 'Thêm thanh toán';
      document.getElementById('paymentForm').reset();
      document.getElementById('ma_thanh_toan').value = '';
    }
  });
</script>