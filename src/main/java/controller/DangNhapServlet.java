package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.NguoiDungDAO;
import model.NguoiDung;

@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String matKhau = request.getParameter("password");

        NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
        NguoiDung nguoiDung = nguoiDungDAO.checkLogin(email, matKhau);

        if (nguoiDung != null) {
            HttpSession session = request.getSession();
            session.setAttribute("nguoiDung", nguoiDung);

            // Điều hướng theo vai trò
            if ("admin".equalsIgnoreCase(nguoiDung.getVaiTro())) {
                response.sendRedirect("admin/index_admin.jsp");
            } else {
                response.sendRedirect("khachhang/index_khachhang.jsp");
            }
        } else {
        	String message = "Sai email hoặc mật khẩu!";
        	response.sendRedirect("login_register/login.jsp?error=true&message=" + java.net.URLEncoder.encode(message, "UTF-8"));
        }
    }
}
