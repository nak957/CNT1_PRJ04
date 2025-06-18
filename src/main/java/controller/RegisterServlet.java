package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.NguoiDungDAO;
import model.NguoiDung;

@WebServlet("/login_register/nguoidung")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String hoTen = request.getParameter("hoTen");
        String soDienThoai = request.getParameter("soDienThoai");  // Lấy số điện thoại

        NguoiDung user = new NguoiDung();
        user.setEmail(email);
        user.setMatKhau(matKhau);
        user.setHoTen(hoTen);
        user.setSoDienThoai(soDienThoai);  // Gán số điện thoại
        user.setVaiTro("khachhang");       // Thiết lập vai trò mặc định

        NguoiDungDAO dao = new NguoiDungDAO();

        // Kiểm tra email đã tồn tại chưa
        if (dao.getByEmail(email) != null) {
            request.setAttribute("message", "Email đã tồn tại!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        dao.insertUser(user); // Thêm người dùng mới

        response.sendRedirect(request.getContextPath() + "/login_register/login.jsp");
    }
}
