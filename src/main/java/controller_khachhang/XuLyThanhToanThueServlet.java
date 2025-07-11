package controller_khachhang;

import dao.*;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@WebServlet("/XuLyThanhToanThueServlet")
public class XuLyThanhToanThueServlet extends HttpServlet {
    private HopDongThueDAO hopDongThueDAO = new HopDongThueDAO();
    private ChiTietHopDongThueDAO chiTietDAO = new ChiTietHopDongThueDAO();
    private ThanhToanThueDAO thanhToanDAO = new ThanhToanThueDAO();
    private GioHangDAO gioHangDAO = new GioHangDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Kiểm tra đăng nhập
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login_register/login.jsp");
            return;
        }

        // Lấy giỏ hàng thuê từ session
        List<GioHang> gioHangThue = (List<GioHang>) session.getAttribute("gioHangThue");
        if (gioHangThue == null || gioHangThue.isEmpty()) {
            response.sendRedirect("GioHangServlet");
            return;
        }

        // Lấy dữ liệu từ form
        String phuongThuc = request.getParameter("phuongThuc");
        String thoiGianStr = request.getParameter("thoiGianThue");
        int thoiGianThue = (thoiGianStr != null) ? Integer.parseInt(thoiGianStr) : 1;

        Date ngayBatDau = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(ngayBatDau);
        cal.add(Calendar.MONTH, thoiGianThue);
        Date ngayKetThuc = cal.getTime();

        // Tính tổng phí thuê và tiền đặt cọc
        BigDecimal tongTien = BigDecimal.ZERO;
        BigDecimal tongTienCoc = BigDecimal.ZERO;

        for (GioHang item : gioHangThue) {
            SanPham sp = item.getSanPham();
            BigDecimal tienThue = sp.getGiaThue().multiply(BigDecimal.valueOf(thoiGianThue)).multiply(BigDecimal.valueOf(item.getSoLuong()));
            BigDecimal tienCoc = sp.getTienCoc().multiply(BigDecimal.valueOf(item.getSoLuong()));

            tongTien = tongTien.add(tienThue);
            tongTienCoc = tongTienCoc.add(tienCoc);
        }

        BigDecimal phiVanChuyen = new BigDecimal("150000");
        BigDecimal tongPhi = tongTien.add(phiVanChuyen);

        // Tạo hợp đồng thuê
        HopDongThue hopDong = new HopDongThue();
        hopDong.setMaNguoiDung(userId);
        hopDong.setLoaiHopDong("doanh_nghiep");
        hopDong.setNgayBatDau(ngayBatDau);
        hopDong.setNgayKetThuc(ngayKetThuc);
        hopDong.setThoiGianThue(thoiGianThue);
        hopDong.setTongPhi(tongPhi);
        hopDong.setTienCoc(tongTienCoc);
        hopDong.setTrangThai("cho_xu_ly");
        hopDong.setNgayTraThucTe(null);
        hopDong.setPhiPhat(BigDecimal.ZERO);
        hopDong.setGhiChu("");

        int maHopDong = hopDongThueDAO.insert(hopDong);

        // Tạo chi tiết hợp đồng thuê
        for (GioHang item : gioHangThue) {
            ChiTietHopDongThue ct = new ChiTietHopDongThue();
            ct.setMaHopDong(maHopDong);
            ct.setMaSanPham(item.getSanPham().getMaSanPham());
            ct.setSoLuong(item.getSoLuong());
            ct.setDonGiaThue(item.getSanPham().getGiaThue());
            chiTietDAO.insert(ct);
        }

        // Tạo thanh toán đặt cọc
        Date ngayTao = new Date();
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(ngayTao);
        int thang = cal1.get(Calendar.MONTH) + 1;
        int nam = cal1.get(Calendar.YEAR);

        ThanhToanThue thanhToan = new ThanhToanThue();
        thanhToan.setMaHopDong(maHopDong);
        thanhToan.setMaNguoiDung(userId);
        thanhToan.setLoaiThanhToan("dat_coc");
        thanhToan.setSoTien(tongTienCoc);
        thanhToan.setPhuongThuc(phuongThuc);
        thanhToan.setTrangThai("cho_xu_ly");
        thanhToan.setMaGiaoDich("");
        thanhToan.setNgayTao(ngayTao);
        thanhToan.setKyThanhToan(1);
        thanhToan.setThangThanhToan(thang);
        thanhToan.setNamThanhToan(nam);
        thanhToan.setNgayBatDauKy(ngayBatDau);
        thanhToan.setNgayKetThucKy(ngayKetThuc);

        thanhToanDAO.insert(thanhToan);

        // Xoá giỏ hàng thuê
        gioHangDAO.deleteByNguoiDung(userId);
        session.removeAttribute("gioHangThue");

        // Quay về trang khách hàng
        response.sendRedirect("khachhang/index_khachhang.jsp");
    }
}
