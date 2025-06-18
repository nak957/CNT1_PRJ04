<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý hợp đồng thuê</h2>
 
  <table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-light">
      <tr>
        <th>Mã hợp đồng</th>
        <th>Mã người dùng</th>
        <th>Mã sản phẩm</th>
        <th>Loại hợp đồng</th>
        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th>Thời gian thuê</th>
        <th>Tổng phí</th>
        <th>Tiền cọc</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Ngày cập nhật</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Sample data (replace with dynamic data using JSTL or servlet) -->
      <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>Thuê ngắn hạn</td>
        <td>2025-05-20</td>
        <td>2025-05-25</td>
        <td>5</td>
        <td>2,500,000</td>
        <td>1,000,000</td>
        <td>Hoạt động</td>
        <td>2025-05-20 12:45:00</td>
        <td>2025-05-20 12:45:00</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#contractModal" 
                  onclick="editContract(1, 1, 1, 'Thue ngan han', '2025-05-20', '2025-05-25', 5, 2500000, 1000000, 'hoat_dong')">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deleteContract(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal for Add/Edit Contract -->
  <div class="modal fade" id="contractModal" tabindex="-1" aria-labelledby="contractModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="contractModalLabel">Thêm hợp đồng</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="contractForm" action="${pageContext.request.contextPath}/admin/SaveContract" method="post">
            <input type="hidden" id="ma_hop_dong" name="ma_hop_dong">
            <div class="mb-3">
              <label for="ma_nguoi_dung" class="form-label fw-medium">Mã người dùng</label>
              <input type="number" class="form-control" id="ma_nguoi_dung" name="ma_nguoi_dung" required>
            </div>
            <div class="mb-3">
              <label for="ma_san_pham" class="form-label fw-medium">Mã sản phẩm</label>
              <input type="number" class="form-control" id="ma_san_pham" name="ma_san_pham" required>
            </div>
            <div class="mb-3">
              <label for="loai_hop_dong" class="form-label fw-medium">Loại hợp đồng</label>
              <select class="form-select" id="loai_hop_dong" name="loai_hop_dong" required>
                <option value="Thue ngan han">Thuê ngắn hạn</option>
                <option value="Thue dai han">Thuê dài hạn</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="ngay_bat_dau" class="form-label fw-medium">Ngày bắt đầu</label>
              <input type="date" class="form-control" id="ngay_bat_dau" name="ngay_bat_dau" required>
            </div>
            <div class="mb-3">
              <label for="ngay_ket_thuc" class="form-label fw-medium">Ngày kết thúc</label>
              <input type="date" class="form-control" id="ngay_ket_thuc" name="ngay_ket_thuc" required>
            </div>
            <div class="mb-3">
              <label for="thoi_gian_thue" class="form-label fw-medium">Thời gian thuê (ngày)</label>
              <input type="number" class="form-control" id="thoi_gian_thue" name="thoi_gian_thue" required>
            </div>
            <div class="mb-3">
              <label for="tong_phi" class="form-label fw-medium">Tổng phí</label>
              <input type="number" class="form-control" id="tong_phi" name="tong_phi" step="0.01" required>
            </div>
            <div class="mb-3">
              <label for="tien_coc" class="form-label fw-medium">Tiền cọc</label>
              <input type="number" class="form-control" id="tien_coc" name="tien_coc" step="0.01">
            </div>
            <div class="mb-3">
              <label for="trang_thai" class="form-label fw-medium">Trạng thái</label>
              <select class="form-select" id="trang_thai" name="trang_thai">
                <option value="hoat_dong">Hoạt động</option>
                <option value="da_huy">Đã hủy</option>
                <option value="hoan_thanh">Hoàn thành</option>
              </select>
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
  function editContract(ma_hop_dong, ma_nguoi_dung, ma_san_pham, loai_hop_dong, ngay_bat_dau, ngay_ket_thuc, thoi_gian_thue, tong_phi, tien_coc, trang_thai) {
    document.getElementById('contractModalLabel').textContent = 'Sửa hợp đồng';
    document.getElementById('ma_hop_dong').value = ma_hop_dong;
    document.getElementById('ma_nguoi_dung').value = ma_nguoi_dung;
    document.getElementById('ma_san_pham').value = ma_san_pham;
    document.getElementById('loai_hop_dong').value = loai_hop_dong;
    document.getElementById('ngay_bat_dau').value = ngay_bat_dau;
    document.getElementById('ngay_ket_thuc').value = ngay_ket_thuc;
    document.getElementById('thoi_gian_thue').value = thoi_gian_thue;
    document.getElementById('tong_phi').value = tong_phi;
    document.getElementById('tien_coc').value = tien_coc || '';
    document.getElementById('trang_thai').value = trang_thai;
  }

  function deleteContract(ma_hop_dong) {
    if (confirm('Bạn có chắc muốn xóa hợp đồng này?')) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeleteContract?ma_hop_dong=' + ma_hop_dong;
    }
  }

  document.getElementById('contractModal').addEventListener('show.bs.modal', function (event) {
    if (!event.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('contractModalLabel').textContent = 'Thêm hợp đồng';
      document.getElementById('contractForm').reset();
      document.getElementById('ma_hop_dong').value = '';
    }
  });
</script>