<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý thanh toán thuê</h2>

  <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#paymentModal">
    <i class="bi bi-plus-circle"></i> Thêm thanh toán
  </button>

  <table class="table table-bordered table-hover text-center align-middle">
    <thead class="table-light">
      <tr>
        <th>Mã</th>
        <th>Mã HĐ</th>
        <th>Người dùng</th>
        <th>Loại</th>
        <th>Số tiền</th>
        <th>Phương thức</th>
        <th>Kỳ</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Dữ liệu mẫu - thay bằng JSTL/Servlet -->
      <tr>
        <td>1</td>
        <td>101</td>
        <td>Nguyễn Văn A</td>
        <td>Tiền thuê</td>
        <td>3,000,000</td>
        <td>Chuyển khoản</td>
        <td>6/2025</td>
        <td><span class="badge bg-warning text-dark">Chờ xử lý</span></td>
        <td>2025-06-01</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#paymentModal"
            onclick="editPayment(1, 101, 1, 'Tiền thuê', 3000000, 'Chuyển khoản', 'cho_xu_ly', 6, 6, 2025)">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deletePayment(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal thêm/sửa -->
  <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="paymentModalLabel">Thêm thanh toán thuê</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <form id="paymentForm" action="${pageContext.request.contextPath}/admin/SaveThanhToanThue" method="post">
            <input type="hidden" id="ma_thanh_toan_thue" name="ma_thanh_toan_thue">

            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Mã hợp đồng</label>
                <input type="number" class="form-control" id="ma_hop_dong" name="ma_hop_dong" required>
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Mã người dùng</label>
                <input type="number" class="form-control" id="ma_nguoi_dung" name="ma_nguoi_dung" required>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Loại thanh toán</label>
                <input type="text" class="form-control" id="loai_thanh_toan" name="loai_thanh_toan" required>
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Phương thức</label>
                <input type="text" class="form-control" id="phuong_thuc" name="phuong_thuc" required>
              </div>
            </div>

            <div class="row">
              <div class="col-md-4 mb-3">
                <label class="form-label">Số tiền</label>
                <input type="number" class="form-control" id="so_tien" name="so_tien" step="0.01" required>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Tháng</label>
                <input type="number" class="form-control" id="thang_thanh_toan" name="thang_thanh_toan">
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Năm</label>
                <input type="number" class="form-control" id="nam_thanh_toan" name="nam_thanh_toan">
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Ngày bắt đầu kỳ</label>
                <input type="date" class="form-control" id="ngay_bat_dau_ky" name="ngay_bat_dau_ky">
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Ngày kết thúc kỳ</label>
                <input type="date" class="form-control" id="ngay_ket_thuc_ky" name="ngay_ket_thuc_ky">
              </div>
            </div>

            <div class="mb-3">
              <label class="form-label">Trạng thái</label>
              <select class="form-select" id="trang_thai" name="trang_thai">
                <option value="cho_xu_ly">Chờ xử lý</option>
                <option value="da_thanh_toan">Đã thanh toán</option>
                <option value="huy">Hủy</option>
              </select>
            </div>

            <button type="submit" class="btn btn-success w-100">Lưu thanh toán</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap & Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function editPayment(id, maHopDong, maNguoiDung, loai, soTien, phuongThuc, trangThai, ky, thang, nam) {
    document.getElementById('paymentModalLabel').textContent = 'Sửa thanh toán thuê';
    document.getElementById('ma_thanh_toan_thue').value = id;
    document.getElementById('ma_hop_dong').value = maHopDong;
    document.getElementById('ma_nguoi_dung').value = maNguoiDung;
    document.getElementById('loai_thanh_toan').value = loai;
    document.getElementById('so_tien').value = soTien;
    document.getElementById('phuong_thuc').value = phuongThuc;
    document.getElementById('trang_thai').value = trangThai;
    document.getElementById('thang_thanh_toan').value = thang;
    document.getElementById('nam_thanh_toan').value = nam;
  }

  function deletePayment(id) {
    if (confirm("Bạn có chắc chắn muốn xóa thanh toán này không?")) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeleteThanhToanThue?ma_thanh_toan_thue=' + id;
    }
  }

  // Reset form khi mở modal thêm mới
  document.getElementById('paymentModal').addEventListener('show.bs.modal', function (event) {
    if (!event.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('paymentForm').reset();
      document.getElementById('ma_thanh_toan_thue').value = '';
      document.getElementById('paymentModalLabel').textContent = 'Thêm thanh toán thuê';
    }
  });
</script>
