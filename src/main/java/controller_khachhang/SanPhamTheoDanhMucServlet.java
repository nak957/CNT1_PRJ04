package controller_khachhang;

import dao.SanPhamDAO;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/sanpham-theo-danh-muc")
public class SanPhamTheoDanhMucServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SanPhamDAO sanPhamDAO = new SanPhamDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String maDanhMucStr = request.getParameter("ma_danh_muc");

        if (maDanhMucStr != null) {
            try {
                int maDanhMuc = Integer.parseInt(maDanhMucStr);
                List<SanPham> dsSanPham = sanPhamDAO.getByDanhMuc(maDanhMuc);
                request.setAttribute("sanPhamTheoDanhMuc", dsSanPham);
                request.getRequestDispatcher("/chitietsanpham/sanphamtheodanhmuc.jsp").forward(request, response);
                return;
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // fallback nếu không có mã hợp lệ
        response.sendRedirect(request.getContextPath() + "/sanpham");
    }
}
