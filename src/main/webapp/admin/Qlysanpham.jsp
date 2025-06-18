<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý sản phẩm</h2>

  <div class="d-flex justify-content-end mb-3">
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productModal">
      <i class="bi bi-plus-circle"></i> Thêm sản phẩm
    </button>
  </div>

  <table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-light">
      <tr>
        <th>Mã</th>
        <th>Tên</th>
        <th>Danh mục</th>
        <th>Giá thuê</th>
        <th>Giá bán</th>
        <th>Tiền cọc</th>
        <th>Số lượng</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Thay bằng dữ liệu động từ JSTL hoặc Servlet -->
      <tr>
        <td>1</td>
        <td>Bàn làm việc</td>
        <td>Bàn</td>
        <td>500.000đ</td>
        <td>2.000.000đ</td>
        <td>300.000đ</td>
        <td>10</td>
        <td>Có sẵn</td>
        <td>2025-06-18</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#productModal">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal thêm/sửa sản phẩm -->
  <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="productModalLabel">Thêm sản phẩm</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="${pageContext.request.contextPath}/admin/SaveSanPham" method="post">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" name="ten" required>
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Danh mục</label>
                <select class="form-select" name="ma_danh_muc" required>
                  <!-- Replace bằng dữ liệu danh mục từ servlet -->
                  <option value="1">Bàn</option>
                </select>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">Mô tả</label>
              <textarea class="form-control" name="mo_ta" rows="3"></textarea>
            </div>
            <div class="row">
              <div class="col-md-4 mb-3">
                <label class="form-label">Giá thuê</label>
                <input type="number" step="0.01" class="form-control" name="gia_thue" required>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Giá bán</label>
                <input type="number" step="0.01" class="form-control" name="gia_ban">
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Tiền cọc</label>
                <input type="number" step="0.01" class="form-control" name="tien_coc">
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Số lượng tồn</label>
                <input type="number" class="form-control" name="so_luong_ton" required>
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Trạng thái</label>
                <select class="form-select" name="trang_thai">
                  <option value="co_san">Có sẵn</option>
                  <option value="da_thue">Đã thuê</option>
                  <option value="het_hang">Hết hàng</option>
                </select>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label">URL ảnh</label>
              <input type="text" class="form-control" name="url_anh">
            </div>
            <button type="submit" class="btn btn-primary w-100">Lưu</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
