package controller;

import dao.ThanhToanMuaDAO;
import model.ThanhToanMua;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/thanhtoanmua")
public class AdminThanhToanMuaServlet extends HttpServlet {
    private ThanhToanMuaDAO thanhToanMuaDAO = new ThanhToanMuaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String idRaw = request.getParameter("id");

        if (action != null && idRaw != null) {
            int id = Integer.parseInt(idRaw);

            if (action.equals("delete")) {
                thanhToanMuaDAO.delete(id);
                response.sendRedirect("thanhtoanmua");
                return;
            }

            if (action.equals("edit")) {
                List<ThanhToanMua> list = thanhToanMuaDAO.getAll();
                ThanhToanMua sua = null;
                for (ThanhToanMua tt : list) {
                    if (tt.getMaThanhToanMua() == id) {
                        sua = tt;
                        break;
                    }
                }
                request.setAttribute("thanhToanSua", sua);
            }
        }

        List<ThanhToanMua> list = thanhToanMuaDAO.getAll();
        request.setAttribute("listThanhToanMua", list);
        request.getRequestDispatcher("/admin/Qlythanhtoanmua.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String maRaw = request.getParameter("maThanhToanMua"); // Chắc chắn không null vì chỉ sửa
        String maDonHangRaw = request.getParameter("maDonHang");
        String maNguoiDungRaw = request.getParameter("maNguoiDung");
        String soTienRaw = request.getParameter("soTien");
        String phuongThuc = request.getParameter("phuongThuc");
        String trangThai = request.getParameter("trangThai");
        String maGiaoDich = request.getParameter("maGiaoDich");

        try {
            int maThanhToanMua = Integer.parseInt(maRaw);
            int maDonHang = Integer.parseInt(maDonHangRaw);
            int maNguoiDung = Integer.parseInt(maNguoiDungRaw);
            BigDecimal soTien = new BigDecimal(soTienRaw);

            ThanhToanMua tt = new ThanhToanMua();
            tt.setMaThanhToanMua(maThanhToanMua);
            tt.setMaDonHang(maDonHang);
            tt.setMaNguoiDung(maNguoiDung);
            tt.setSoTien(soTien);
            tt.setPhuongThuc(phuongThuc);
            tt.setTrangThai(trangThai);
            tt.setMaGiaoDich(maGiaoDich);
            tt.setNgayTao(new Date()); // giữ lại nếu bạn cần cập nhật ngày sửa, nếu không có thể bỏ

            thanhToanMuaDAO.update(tt);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("thanhtoanmua");
    }
}
