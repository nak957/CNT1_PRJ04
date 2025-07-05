package controller_khachhang;

import dao.GioHangDAO;
import dao.SanPhamDAO;
import model.GioHang;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/XuLyGioHangServlet")
public class XuLyGioHangServlet extends HttpServlet {
    private GioHangDAO gioHangDAO = new GioHangDAO();
    private SanPhamDAO sanPhamDAO = new SanPhamDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String[] selectedIds = request.getParameterValues("chonSanPham");
        HttpSession session = request.getSession();
        Integer maNguoiDung = (Integer) session.getAttribute("userId");

        if (maNguoiDung == null) {
            response.sendRedirect("GioHangServlet");
            return;
        }

        if (selectedIds == null || selectedIds.length == 0) {
            session.setAttribute("message", "Vui lòng chọn ít nhất một sản phẩm.");
            response.sendRedirect("GioHangServlet");
            return;
        }

        // Lấy toàn bộ giỏ hàng của người dùng
        List<GioHang> gioHangList = gioHangDAO.getByNguoiDung(maNguoiDung);
        List<GioHang> gioHangDaChon = new ArrayList<>();

        // Lọc ra những sản phẩm được chọn
        for (String idStr : selectedIds) {
            try {
                int maSP = Integer.parseInt(idStr);
                for (GioHang item : gioHangList) {
                    if (item.getMaSanPham() == maSP) {
                        SanPham sp = sanPhamDAO.getById(maSP);
                        item.setSanPham(sp); // Đính kèm thông tin sản phẩm
                        gioHangDaChon.add(item);
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        if ("mua".equals(action)) {
            session.setAttribute("gioHangMua", gioHangDaChon);
            response.sendRedirect("nguoidung/thanhtoanmua.jsp");
        } else if ("thue".equals(action)) {
            session.setAttribute("gioHangThue", gioHangDaChon);
            response.sendRedirect("nguoidung/thanhtoanthue.jsp");
        } else {
            // Nếu action không hợp lệ
            session.setAttribute("message", "Hành động không hợp lệ.");
            response.sendRedirect("GioHangServlet");
        }
    }
}
