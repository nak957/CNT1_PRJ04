<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý thanh toán mua</h2>

  <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#buyPaymentModal">
    <i class="bi bi-plus-circle"></i> Thêm thanh toán
  </button>

  <table class="table table-bordered table-hover text-center align-middle">
    <thead class="table-light">
      <tr>
        <th>Mã</th>
        <th>Đơn hàng</th>
        <th>Người dùng</th>
        <th>Số tiền</th>
        <th>Phương thức</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Dữ liệu mẫu - thay bằng JSTL/Servlet -->
      <tr>
        <td>1</td>
        <td>DH001</td>
        <td>Nguyễn Văn A</td>
        <td>5,000,000</td>
        <td>Ví Momo</td>
        <td><span class="badge bg-warning text-dark">Chờ xử lý</span></td>
        <td>2025-06-15</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#buyPaymentModal"
            onclick="editBuyPayment(1, 1, 1, 5000000, 'Ví Momo', 'cho_xu_ly')">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deleteBuyPayment(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal Thêm/Sửa -->
  <div class="modal fade" id="buyPaymentModal" tabindex="-1" aria-labelledby="buyPaymentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="buyPaymentModalLabel">Thêm thanh toán mua</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <form id="buyPaymentForm" action="${pageContext.request.contextPath}/admin/SaveThanhToanMua" method="post">
            <input type="hidden" id="ma_thanh_toan_mua" name="ma_thanh_toan_mua">

            <div class="row mb-3">
              <div class="col-md-6">
                <label class="form-label">Mã đơn hàng</label>
                <input type="number" class="form-control" id="ma_don_hang" name="ma_don_hang" required>
              </div>
              <div class="col-md-6">
                <label class="form-label">Mã người dùng</label>
                <input type="number" class="form-control" id="ma_nguoi_dung" name="ma_nguoi_dung" required>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-md-6">
                <label class="form-label">Số tiền</label>
                <input type="number" class="form-control" id="so_tien" name="so_tien" step="0.01" required>
              </div>
              <div class="col-md-6">
                <label class="form-label">Phương thức</label>
                <input type="text" class="form-control" id="phuong_thuc" name="phuong_thuc" required>
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

<!-- Script xử lý Bootstrap và form -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function editBuyPayment(id, maDonHang, maNguoiDung, soTien, phuongThuc, trangThai) {
    document.getElementById('buyPaymentModalLabel').textContent = 'Sửa thanh toán mua';
    document.getElementById('ma_thanh_toan_mua').value = id;
    document.getElementById('ma_don_hang').value = maDonHang;
    document.getElementById('ma_nguoi_dung').value = maNguoiDung;
    document.getElementById('so_tien').value = soTien;
    document.getElementById('phuong_thuc').value = phuongThuc;
    document.getElementById('trang_thai').value = trangThai;
  }

  function deleteBuyPayment(id) {
    if (confirm("Bạn có chắc chắn muốn xóa thanh toán mua này không?")) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeleteThanhToanMua?ma_thanh_toan_mua=' + id;
    }
  }

  // Reset form khi mở modal thêm mới
  document.getElementById('buyPaymentModal').addEventListener('show.bs.modal', function (event) {
    if (!event.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('buyPaymentForm').reset();
      document.getElementById('ma_thanh_toan_mua').value = '';
      document.getElementById('buyPaymentModalLabel').textContent = 'Thêm thanh toán mua';
    }
  });
</script>
