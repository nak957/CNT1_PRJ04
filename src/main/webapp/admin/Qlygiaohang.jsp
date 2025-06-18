<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý giao hàng</h2>
  
  <table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-light">
      <tr>
        <th>Mã giao hàng</th>
        <th>Mã hợp đồng</th>
        <th>Mã người dùng</th>
        <th>Mã NV giao hàng</th>
        <th>Mã NV lắp ráp</th>
        <th>Địa chỉ giao</th>
        <th>Ngày giao</th>
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
        <td>1</td>
        <td>2</td>
        <td>123 Đường Láng, Hà Nội</td>
        <td>2025-05-22</td>
        <td>Chờ giao</td>
        <td>2025-05-21 00:52:00</td>
        <td>2025-05-21 00:52:00</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#deliveryModal" 
                  onclick="editDelivery(1, 1, 1, 1, 2, '123 Đường Láng, Hà Nội', '2025-05-22', 'cho_giao')">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deleteDelivery(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal for Add/Edit Delivery -->
  <div class="modal fade" id="deliveryModal" tabindex="-1" aria-labelledby="deliveryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deliveryModalLabel">Thêm giao hàng</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="deliveryForm" action="${pageContext.request.contextPath}/admin/SaveDelivery" method="post">
            <input type="hidden" id="ma_giao_hang" name="ma_giao_hang">
            <div class="mb-3">
              <label for="ma_hop_dong" class="form-label fw-medium">Mã hợp đồng</label>
              <input type="number" class="form-control" id="ma_hop_dong" name="ma_hop_dong" required>
            </div>
            <div class="mb-3">
              <label for="ma_nguoi_dung" class="form-label fw-medium">Mã người dùng</label>
              <input type="number" class="form-control" id="ma_nguoi_dung" name="ma_nguoi_dung" required>
            </div>
            <div class="mb-3">
              <label for="ma_nv_giao_hang" class="form-label fw-medium">Mã NV giao hàng</label>
              <input type="number" class="form-control" id="ma_nv_giao_hang" name="ma_nv_giao_hang" required>
            </div>
            <div class="mb-3">
              <label for="ma_nv_lap_rap" class="form-label fw-medium">Mã NV lắp ráp</label>
              <input type="number" class="form-control" id="ma_nv_lap_rap" name="ma_nv_lap_rap">
            </div>
            <div class="mb-3">
              <label for="dia_chi_giao" class="form-label fw-medium">Địa chỉ giao</label>
              <textarea class="form-control" id="dia_chi_giao" name="dia_chi_giao" rows="3" required></textarea>
            </div>
            <div class="mb-3">
              <label for="ngay_giao" class="form-label fw-medium">Ngày giao</label>
              <input type="date" class="form-control" id="ngay_giao" name="ngay_giao" required>
            </div>
            <div class="mb-3">
              <label for="trang_thai" class="form-label fw-medium">Trạng thái</label>
              <select class="form-select" id="trang_thai" name="trang_thai">
                <option value="cho_giao">Chờ giao</option>
                <option value="dang_giao">Đang giao</option>
                <option value="hoan_thanh">Hoàn thành</option>
                <option value="da_huy">Đã hủy</option>
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
  function editDelivery(ma_giao_hang, ma_hop_dong, ma_nguoi_dung, ma_nv_giao_hang, ma_nv_lap_rap, dia_chi_giao, ngay_giao, trang_thai) {
    document.getElementById('deliveryModalLabel').textContent = 'Sửa giao hàng';
    document.getElementById('ma_giao_hang').value = ma_giao_hang;
    document.getElementById('ma_hop_dong').value = ma_hop_dong;
    document.getElementById('ma_nguoi_dung').value = ma_nguoi_dung;
    document.getElementById('ma_nv_giao_hang').value = ma_nv_giao_hang;
    document.getElementById('ma_nv_lap_rap').value = ma_nv_lap_rap || '';
    document.getElementById('dia_chi_giao').value = dia_chi_giao;
    document.getElementById('ngay_giao').value = ngay_giao;
    document.getElementById('trang_thai').value = trang_thai;
  }

  function deleteDelivery(ma_giao_hang) {
    if (confirm('Bạn có chắc muốn xóa giao hàng này?')) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeleteDelivery?ma_giao_hang=' + ma_giao_hang;
    }
  }

  document.getElementById('deliveryModal').addEventListener('show.bs.modal', function (event) {
    if (!event.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('deliveryModalLabel').textContent = 'Thêm giao hàng';
      document.getElementById('deliveryForm').reset();
      document.getElementById('ma_giao_hang').value = '';
    }
  });
</script>