<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container py-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="mb-0">📂 Quản lý danh mục</h2>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#categoryModal">
      <i class="bi bi-plus-circle me-1"></i> Thêm danh mục
    </button>
  </div>

  <div class="table-responsive rounded shadow-sm">
    <table class="table table-hover table-bordered align-middle text-center mb-0">
      <thead class="table-light">
        <tr class="align-middle">
          <th scope="col">#</th>
          <th scope="col">Tên</th>
          <th scope="col">Mô tả</th>
          <th scope="col">Ngày tạo</th>
          <th scope="col">Hành động</th>
        </tr>
      </thead>
      <tbody>
        <!-- TODO: Replace this with dynamic JSTL/Servlet -->
        <tr>
          <td>1</td>
          <td>Bàn</td>
          <td>Danh mục bàn gỗ cao cấp</td>
          <td>2025-05-20</td>
          <td>
            <div class="d-flex justify-content-center gap-2">
              <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#categoryModal"
                      onclick="editCategory(1, 'Bàn', 'Danh mục bàn gỗ cao cấp')">
                <i class="bi bi-pencil-square"></i> Sửa
              </button>
              <button class="btn btn-danger btn-sm" onclick="deleteCategory(1)">
                <i class="bi bi-trash3"></i> Xóa
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Modal: Add/Edit Category -->
  <div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content shadow-lg border-0">
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title" id="categoryModalLabel">Thêm danh mục</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="categoryForm" action="${pageContext.request.contextPath}/admin/SaveCategory" method="post">
            <input type="hidden" id="ma_danh_muc" name="ma_danh_muc">
            <div class="mb-3">
              <label for="ten" class="form-label">Tên danh mục</label>
              <input type="text" class="form-control" id="ten" name="ten" required>
            </div>
            <div class="mb-3">
              <label for="mo_ta" class="form-label">Mô tả</label>
              <textarea class="form-control" id="mo_ta" name="mo_ta" rows="3"></textarea>
            </div>
            <div class="d-grid">
              <button type="submit" class="btn btn-primary">
                <i class="bi bi-save"></i> Lưu
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
  function editCategory(ma_danh_muc, ten, mo_ta) {
    document.getElementById('categoryModalLabel').textContent = 'Sửa danh mục';
    document.getElementById('ma_danh_muc').value = ma_danh_muc;
    document.getElementById('ten').value = ten;
    document.getElementById('mo_ta').value = mo_ta || '';
  }

  function deleteCategory(ma_danh_muc) {
    if (confirm('Bạn có chắc muốn xóa danh mục này?')) {
      window.location.href = '${pageContext.request.contextPath}/admin/DeleteCategory?ma_danh_muc=' + ma_danh_muc;
    }
  }

  document.getElementById('categoryModal').addEventListener('show.bs.modal', function (event) {
    if (!event.relatedTarget.classList.contains('btn-warning')) {
      document.getElementById('categoryModalLabel').textContent = 'Thêm danh mục';
      document.getElementById('categoryForm').reset();
      document.getElementById('ma_danh_muc').value = '';
    }
  });
</script>
