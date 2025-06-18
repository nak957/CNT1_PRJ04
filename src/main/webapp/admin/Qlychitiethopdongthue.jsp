<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý Chi tiết Hợp đồng Thuê</h2>

  <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#ctHopDongModal">
    <i class="bi bi-plus-circle"></i> Thêm chi tiết thuê
  </button>

  <table class="table table-bordered table-hover text-center align-middle">
    <thead class="table-light">
      <tr>
        <th>Mã CT</th>
        <th>Đơn hàng</th>
        <th>Hợp đồng</th>
        <th>Sản phẩm</th>
        <th>Số lượng</th>
        <th>Đơn giá thuê</th>
        <th>Thành tiền</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Dữ liệu mẫu, thay bằng JSTL -->
      <tr>
        <td>1</td>
        <td>DH001</td>
        <td>HD001</td>
        <td>Bàn Làm Việc</td>
        <td>2</td>
        <td>500.000</td>
        <td>1.000.000</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#ctHopDongModal"
            onclick="editCTThue(1, 1, 1, 1, 2, 500000)">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deleteCTThue(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal Thêm/Sửa -->
  <div class="modal fade" id="ctHopDongModal" tabindex="-1" aria-labelledby="ctHopDongModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <form id="ctThueForm" action="${pageContext.request.contextPath}/admin/SaveChiTietHopDongThue" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="ctHopDongModalLabel">Thêm chi tiết thuê</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" name="ma_ct_thue" id="ma_ct_thue">

            <div class="row mb-3">
              <div class="col-md-4">
                <label class="form-label">Mã đơn hàng</label>
                <input type="number" class="form-control" id="ma_don_hang" name="ma_don_hang" required>
              </div>
              <div class="col-md-4">
                <label class="form-label">Mã hợp đồng</label>
                <input type="number" class="form-control" id="ma_hop_dong" name="ma_hop_dong" required>
              </div>
              <div class="col-md-4">
                <label class="form-label">Mã sản phẩm</label>
                <input type="number" class="form-control" id="ma_san_pham" name="ma_san_pham" required>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-md-6">
                <label class="form-label">Số lượng</label>
                <input type="number" class="form-control" id="so_luong" name="so_luong" required onchange="updateThanhTien()">
              </div>
              <div class="col-md-6">
                <label class="form-label">Đơn giá thuê</label>
                <input type="number" class="form-control" id="don_gia_thue" name="don_gia_thue" step="0.01" required onchange="updateThanhTien()">
              </div>
            </div>

            <div class="mb-3">
              <label class="form-label">Thành tiền</label>
              <input type="text" class="form-control" id="thanh_tien" readonly>
            </div>

            <button type="submit" class="btn btn-success w-100">Lưu chi tiết</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Script Bootstrap + xử lý -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function editCTThue(maCT, maDonHang, maHopDong, maSanPham, soLuong, donGia) {
    document.getElementById('ctHopDongModalLabel').innerText = 'Sửa chi tiết thuê';
    document.getElementById('ma_ct_thue').value = maCT;
    document.getElementById('ma_don_hang').value = maDonHang;
    document.getElementById('ma_hop_dong').value = maHopDong;
    document.getElementById('ma_san_pham').value = maSanPham;
    document.getElementById('so_luong').value = soLuong;
    document.getElementById('don_gia_thue').value = donGia;
    updateThanhTien();
  }

  function deleteCTThue(maCT) {
    if (confirm("Bạn chắc chắn muốn xóa chi tiết này?")) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeleteChiTietHopDongThue?ma_ct_thue=' + maCT;
    }
  }

  function updateThanhTien() {
    const sl = parseFloat(document.getElementById('so_luong').value || 0);
    const dg = parseFloat(document.getElementById('don_gia_thue').value || 0);
    const tt = sl * dg;
    document.getElementById('thanh_tien').value = tt.toLocaleString('vi-VN') + ' ₫';
  }

  // Reset form khi mở modal
  document.getElementById('ctHopDongModal').addEventListener('show.bs.modal', function (e) {
    if (!e.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('ctThueForm').reset();
      document.getElementById('ma_ct_thue').value = '';
      document.getElementById('ctHopDongModalLabel').innerText = 'Thêm chi tiết thuê';
      document.getElementById('thanh_tien').value = '';
    }
  });
</script>
