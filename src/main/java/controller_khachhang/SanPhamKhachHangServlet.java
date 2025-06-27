package controller_khachhang;

import dao.DanhMucDAO;
import model.DanhMuc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/sanpham")
public class SanPhamKhachHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        DanhMucDAO danhMucDAO = new DanhMucDAO();
        List<DanhMuc> danhMucList = danhMucDAO.getAll();

        request.setAttribute("danhMucList", danhMucList);
        request.getRequestDispatcher("khachhang/Sanpham_khachhang.jsp").forward(request, response);
    }
}
