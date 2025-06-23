<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.NguoiDung" %>
<%
    NguoiDung nguoiDung = (NguoiDung) session.getAttribute("nguoiDung");
%>

<div>
    <h2 class="mb-4">Thông Tin Người Dùng</h2>
    <form>
        <div class="mb-3">
            <label class="form-label">Họ tên</label>
            <input type="text" class="form-control" value="<%= nguoiDung != null ? nguoiDung.getHoTen() : "" %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" value="<%= nguoiDung != null ? nguoiDung.getEmail() : "" %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input type="text" class="form-control" value="<%= nguoiDung != null ? nguoiDung.getSoDienThoai() : "" %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Địa chỉ</label>
            <textarea class="form-control" rows="2" readonly><%= nguoiDung != null ? nguoiDung.getDiaChi() : "" %></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày tạo</label>
            <input type="text" class="form-control" value="<%= nguoiDung != null ? nguoiDung.getNgayTao() : "" %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày cập nhật</label>
            <input type="text" class="form-control" value="<%= nguoiDung != null ? nguoiDung.getNgayCapNhat() : "" %>" readonly>
        </div>
    </form>
</div>
