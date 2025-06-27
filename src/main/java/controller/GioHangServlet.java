package controller;

import dao.GioHangDAO;
import dao.SanPhamDAO;
import model.GioHang;
import model.SanPham;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GioHangServlet")
public class GioHangServlet extends HttpServlet {
    private GioHangDAO gioHangDAO = new GioHangDAO();
    private SanPhamDAO sanPhamDAO = new SanPhamDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer maNguoiDung = (Integer) request.getSession().getAttribute("userId");
        List<GioHang> gioHangList;

        if (maNguoiDung != null) {
            // Người dùng đã đăng nhập: Lấy từ cơ sở dữ liệu
            gioHangList = gioHangDAO.getByNguoiDung(maNguoiDung);
        } else {
            // Người dùng chưa đăng nhập: Lấy từ session
            gioHangList = (List<GioHang>) request.getSession().getAttribute("gioHangList");
            if (gioHangList == null) {
                gioHangList = new ArrayList<>();
                request.getSession().setAttribute("gioHangList", gioHangList);
            }
        }

        // Gắn thông tin SanPham vào mỗi GioHang
        for (GioHang item : gioHangList) {
            SanPham sanPham = sanPhamDAO.getById(item.getMaSanPham());
            item.setSanPham(sanPham);
        }

        request.setAttribute("gioHangList", gioHangList);
        request.getRequestDispatcher("/nguoidung/Giohang.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Integer maNguoiDung = (Integer) request.getSession().getAttribute("userId");

        if ("add".equals(action)) {
            int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
            int soLuong = Integer.parseInt(request.getParameter("soLuong"));
            SanPham sanPham = sanPhamDAO.getById(maSanPham);
            if (sanPham == null || soLuong > sanPham.getSoLuongTon()) {
                request.setAttribute("error", "Sản phẩm không tồn tại hoặc số lượng vượt quá tồn kho!");
                doGet(request, response);
                return;
            }

            GioHang item = new GioHang();
            item.setMaSanPham(maSanPham);
            item.setSoLuong(soLuong);
            item.setNgayThem(LocalDateTime.now());

            if (maNguoiDung != null) {
                item.setMaNguoiDung(maNguoiDung);
                gioHangDAO.insert(item);
            } else {
                List<GioHang> gioHangList = (List<GioHang>) request.getSession().getAttribute("gioHangList");
                if (gioHangList == null) {
                    gioHangList = new ArrayList<>();
                    request.getSession().setAttribute("gioHangList", gioHangList);
                }
                // Kiểm tra sản phẩm đã có trong giỏ chưa
                boolean found = false;
                for (GioHang existingItem : gioHangList) {
                    if (existingItem.getMaSanPham() == maSanPham) {
                        existingItem.setSoLuong(existingItem.getSoLuong() + soLuong);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    gioHangList.add(item);
                }
                item.setSanPham(sanPham); // Gắn SanPham để hiển thị
            }
        } else if ("update".equals(action)) {
            int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
            int soLuong = Integer.parseInt(request.getParameter("soLuong"));
            SanPham sanPham = sanPhamDAO.getById(maSanPham);
            if (sanPham == null || soLuong > sanPham.getSoLuongTon()) {
                request.setAttribute("error", "Số lượng vượt quá tồn kho!");
                doGet(request, response);
                return;
            }

            if (maNguoiDung != null) {
                gioHangDAO.updateSoLuong(maNguoiDung, maSanPham, soLuong);
            } else {
                List<GioHang> gioHangList = (List<GioHang>) request.getSession().getAttribute("gioHangList");
                for (GioHang item : gioHangList) {
                    if (item.getMaSanPham() == maSanPham) {
                        item.setSoLuong(soLuong);
                        item.setSanPham(sanPham);
                        break;
                    }
                }
            }
        } else if ("delete".equals(action)) {
            int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
            if (maNguoiDung != null) {
                gioHangDAO.delete(maNguoiDung, maSanPham);
            } else {
                List<GioHang> gioHangList = (List<GioHang>) request.getSession().getAttribute("gioHangList");
                gioHangList.removeIf(item -> item.getMaSanPham() == maSanPham);
            }
        }

        response.sendRedirect("GioHangServlet");
    }
}