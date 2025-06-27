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
            // Nếu chưa đăng nhập thì chuyển về trang giỏ hàng
            response.sendRedirect("GioHangServlet");
            return;
        }

        if ("mua".equals(action)) {
            if (selectedIds == null || selectedIds.length == 0) {
                session.setAttribute("message", "Vui lòng chọn ít nhất một sản phẩm để mua.");
                response.sendRedirect("GioHangServlet");
                return;
            }

            List<GioHang> gioHangList = gioHangDAO.getByNguoiDung(maNguoiDung);
            List<GioHang> gioHangMua = new ArrayList<>();

            for (String idStr : selectedIds) {
                try {
                    int maSP = Integer.parseInt(idStr);
                    for (GioHang item : gioHangList) {
                        if (item.getMaSanPham() == maSP) {
                            SanPham sp = sanPhamDAO.getById(maSP);
                            item.setSanPham(sp);
                            gioHangMua.add(item);
                            break;
                        }
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace(); // Tránh dừng cả Servlet nếu 1 id lỗi
                }
            }

            session.setAttribute("gioHangMua", gioHangMua);
            response.sendRedirect("nguoidung/thanhtoanmua.jsp");
        } else {
            // Hành động khác không hỗ trợ
            response.sendRedirect("GioHangServlet");
        }
    }
}
