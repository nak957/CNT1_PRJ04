<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4">
  <h2 class="mb-4">Quản lý danh mục</h2>
  <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#categoryModal">Thêm danh mục</button>
  <table class="table table-bordered table-hover align-middle text-center">
    <thead class="table-light">
      <tr>
        <th>Mã</th>
        <th>Tên</th>
        <th>Mô tả</th>
        <th>Ngày tạo</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <!-- Sample data (replace with dynamic data using JSTL or servlet) -->
      <tr>
        <td>1</td>
        <td>Bàn</td>
        <td>Danh mục bàn gỗ cao cấp</td>
        <td>2025-05-20</td>
        <td>
          <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal" data-bs-target="#categoryModal" 
                  onclick="editCategory(1, 'Bàn', 'Danh mục bàn gỗ cao cấp')">
            <i class="bi bi-pencil"></i> Sửa
          </button>
          <button class="btn btn-danger btn-sm" onclick="deleteCategory(1)">
            <i class="bi bi-trash"></i> Xóa
          </button>
        </td>
      </tr>
    </tbody>
  </table>

  <!-- Modal for Add/Edit Category -->
  <div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="categoryModalLabel">Thêm danh mục</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="categoryForm" action="${pageContext.request.contextPath}/admin/SaveCategory" method="post">
            <input type="hidden" id="ma_danh_muc" name="ma_danh_muc">
            <div class="mb-3">
              <label for="ten" class="form-label fw-medium">Tên danh mục</label>
              <input type="text" class="form-control" id="ten" name="ten" required>
            </div>
            <div class="mb-3">
              <label for="mo_ta" class="form-label fw-medium">Mô tả</label>
              <textarea class="form-control" id="mo_ta" name="mo_ta" rows="3"></textarea>
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