package controller_khachhang;

import dao.SanPhamDAO;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/sanpham-vanglai")
public class SanPhamVangLaiServlet extends HttpServlet {
    private SanPhamDAO sanPhamDAO = new SanPhamDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maDanhMucStr = request.getParameter("ma_danh_muc");
        List<SanPham> danhSachSanPham;

        if (maDanhMucStr != null) {
            try {
                int maDanhMuc = Integer.parseInt(maDanhMucStr);
                danhSachSanPham = sanPhamDAO.getByDanhMuc(maDanhMuc);
            } catch (NumberFormatException e) {
                danhSachSanPham = sanPhamDAO.getAll(); // fallback nếu lỗi
            }
        } else {
            danhSachSanPham = sanPhamDAO.getAll();
        }

        request.setAttribute("danhSachSanPham", danhSachSanPham);
        request.getRequestDispatcher("/chitietsanpham/sanphamvanglai.jsp").forward(request, response);
    }
}
