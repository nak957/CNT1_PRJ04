package controller;

import dao.NhanVienDAO;
import model.NhanVien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/nhanvien")
public class NhanVienServlet extends HttpServlet {
    private NhanVienDAO nhanVienDAO;

    @Override
    public void init() {
        nhanVienDAO = new NhanVienDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                showFormAdd(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                deleteNhanVien(request, response);
                break;
            case "list":
            default:
                listNhanVien(request, response);
                break;
        }
    }

    private void listNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<NhanVien> danhSach = nhanVienDAO.getAllNhanVien();
        request.setAttribute("listNhanVien", danhSach);
        request.getRequestDispatcher("admin/Qlynhanvien.jsp").forward(request, response);
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị form thêm mới, có thể là trang riêng hoặc dùng chung Qlynhanvien.jsp
        request.setAttribute("nhanVien", null);
        request.setAttribute("formMode", "add");
        request.getRequestDispatcher("admin/Qlynhanvien.jsp").forward(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        NhanVien nv = nhanVienDAO.getNhanVienById(id);
        request.setAttribute("nhanVien", nv);
        request.setAttribute("formMode", "edit");
        request.getRequestDispatcher("admin/Qlynhanvien.jsp").forward(request, response);
    }

    private void deleteNhanVien(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        nhanVienDAO.deleteNhanVien(id);
        response.sendRedirect("nhanvien?action=list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int ma = Integer.parseInt(request.getParameter("ma_nhan_vien"));
            String hoTen = request.getParameter("ho_ten");
            String sdt = request.getParameter("so_dien_thoai");
            String email = request.getParameter("email");
            String diaChi = request.getParameter("dia_chi");
            String vaiTro = request.getParameter("vai_tro");
            String trangThai = request.getParameter("trang_thai");

            NhanVien nv = new NhanVien(ma, hoTen, sdt, email, diaChi, vaiTro, trangThai);

            // Nếu đã tồn tại nhân viên, cập nhật. Ngược lại, thêm mới.
            if (nhanVienDAO.getNhanVienById(ma) != null) {
                nhanVienDAO.updateNhanVien(nv);
            } else {
                nhanVienDAO.insertNhanVien(nv);
            }

            response.sendRedirect("nhanvien?action=list");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Dữ liệu không hợp lệ.");
            listNhanVien(request, response);
        }
    }
}
