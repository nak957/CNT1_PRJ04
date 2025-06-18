package controller;

import dao.NguoiDungDAO;
import model.NguoiDung;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/NguoiDungServlet")
public class NguoiDungServlet extends HttpServlet {
    private NguoiDungDAO nguoiDungDAO;

    @Override
    public void init() {
        nguoiDungDAO = new NguoiDungDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if ("insert".equals(action)) {
            insertUser(request, response);
        } else if ("update".equals(action)) {
            updateUser(request, response);
        } else if ("update_profile".equals(action)) {
            updateUserProfile(request, response); // ✅ thêm mới
        } else {
            response.sendRedirect("NguoiDungServlet");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            deleteUser(request, response);
        } else {
            listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NguoiDung> listNguoiDung = nguoiDungDAO.getAllUsers("khachhang");
        request.setAttribute("listNguoiDung", listNguoiDung);
        request.getRequestDispatcher("admin/Qlynguoidung.jsp").forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String hoTen = request.getParameter("hoTen");
        String soDienThoai = request.getParameter("soDienThoai");
        String diaChi = request.getParameter("diaChi");

        NguoiDung user = new NguoiDung();
        user.setEmail(email);
        user.setMatKhau(matKhau);
        user.setHoTen(hoTen);
        user.setSoDienThoai(soDienThoai);
        user.setDiaChi(diaChi);
        user.setVaiTro("khachhang");

        nguoiDungDAO.insertUser(user);
        response.sendRedirect(request.getContextPath() + "/NguoiDungServlet");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("maNguoiDung"));
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String hoTen = request.getParameter("hoTen");
        String soDienThoai = request.getParameter("soDienThoai");
        String diaChi = request.getParameter("diaChi");

        NguoiDung user = new NguoiDung();
        user.setMaNguoiDung(id);
        user.setEmail(email);
        user.setMatKhau(matKhau);
        user.setHoTen(hoTen);
        user.setSoDienThoai(soDienThoai);
        user.setDiaChi(diaChi);
        user.setVaiTro("khachhang");

        nguoiDungDAO.updateUser(user);
        response.sendRedirect(request.getContextPath() + "/NguoiDungServlet");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        nguoiDungDAO.deleteUser(id);
        response.sendRedirect(request.getContextPath() + "/NguoiDungServlet");
    }

    // ✅ Thêm mới: xử lý cập nhật thông tin cá nhân của người dùng
    private void updateUserProfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("maNguoiDung"));
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String hoTen = request.getParameter("hoTen");
        String soDienThoai = request.getParameter("soDienThoai");
        String diaChi = request.getParameter("diaChi");

        NguoiDung current = nguoiDungDAO.getById(id); // Lấy dữ liệu cũ

        NguoiDung user = new NguoiDung();
        user.setMaNguoiDung(id);
        user.setEmail(email);
        user.setMatKhau((matKhau != null && !matKhau.trim().isEmpty()) ? matKhau : current.getMatKhau());
        user.setHoTen(hoTen);
        user.setSoDienThoai(soDienThoai);
        user.setDiaChi(diaChi);
        user.setVaiTro(current.getVaiTro()); // Giữ nguyên vai trò

        nguoiDungDAO.updateUser(user);

        // Cập nhật lại session nếu đang dùng thông tin user trong phiên
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        request.setAttribute("message", "Cập nhật thông tin thành công!");
        request.getRequestDispatcher("/khachhang/index_khachhang.jsp").forward(request, response);
    }
}
