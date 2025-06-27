package controller_khachhang;

import dao.*;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/XuLyThanhToanMuaServlet")
public class XuLyThanhToanMuaServlet extends HttpServlet {
    private DonHangDAO donHangDAO = new DonHangDAO();
    private ChiTietDonHangDAO chiTietDonHangDAO = new ChiTietDonHangDAO();
    private ThanhToanMuaDAO thanhToanMuaDAO = new ThanhToanMuaDAO();
    private GioHangDAO gioHangDAO = new GioHangDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login_register/login.jsp");
            return;
        }

        String phuongThuc = request.getParameter("phuongThuc");
        List<GioHang> gioHangMua = (List<GioHang>) session.getAttribute("gioHangMua");

        if (gioHangMua == null || gioHangMua.isEmpty()) {
            response.sendRedirect("GioHangServlet");
            return;
        }

        // Tính tổng tiền
        BigDecimal tongTien = BigDecimal.ZERO;
        for (GioHang item : gioHangMua) {
            BigDecimal donGia = item.getSanPham().getGiaBan();
            BigDecimal soLuong = new BigDecimal(item.getSoLuong());
            tongTien = tongTien.add(donGia.multiply(soLuong));
        }

        // Thêm phí vận chuyển
        BigDecimal phiVanChuyen = new BigDecimal(150000);
        BigDecimal tongThanhToan = tongTien.add(phiVanChuyen);

        // Tạo đơn hàng
        DonHang donHang = new DonHang();
        donHang.setMaNguoiDung(userId);
        donHang.setTongTien(tongThanhToan);
        int maDonHang = donHangDAO.insert(donHang);

        // Tạo chi tiết đơn hàng
        for (GioHang item : gioHangMua) {
            ChiTietDonHang chiTiet = new ChiTietDonHang();
            chiTiet.setMaDonHang(maDonHang);
            chiTiet.setMaSanPham(item.getMaSanPham());
            chiTiet.setSoLuong(item.getSoLuong());
            chiTiet.setDonGia(item.getSanPham().getGiaBan());
            chiTietDonHangDAO.insert(chiTiet);
        }

        // Tạo bản ghi thanh toán
        ThanhToanMua thanhToan = new ThanhToanMua();
        thanhToan.setMaDonHang(maDonHang);
        thanhToan.setMaNguoiDung(userId);
        thanhToan.setSoTien(tongThanhToan);
        thanhToan.setPhuongThuc(phuongThuc);
        thanhToan.setTrangThai("cho_xu_ly");
        thanhToanMuaDAO.insert(thanhToan);

        // Xóa sản phẩm trong giỏ hàng
        gioHangDAO.deleteByNguoiDung(userId);

        // Xóa session tạm thời
        session.removeAttribute("gioHangMua");

        // Chuyển hướng về index
        response.sendRedirect("khachhang/index_khachhang.jsp");
    }
}
