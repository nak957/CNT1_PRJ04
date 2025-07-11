package controller;

import dao.HopDongThueDAO;
import model.HopDongThue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/hopdongthue")
public class QuanLyHopDongThueServlet extends HttpServlet {

    private HopDongThueDAO hopDongThueDAO;

    @Override
    public void init() throws ServletException {
        hopDongThueDAO = new HopDongThueDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "delete":
                    deleteHopDong(request, response);
                    break;
                case "search":
                    searchHopDong(request, response);
                    break;
                case "edit":
                    showEditHopDong(request, response);
                    break;
                default:
                    listHopDong(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Lỗi trong quá trình xử lý: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        updateHopDong(request, response);
    }

    /**
     * Hiển thị danh sách tất cả hợp đồng thuê
     */
    private void listHopDong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<HopDongThue> list = hopDongThueDAO.findAll();
        request.setAttribute("danhSachHopDong", list);
        request.getRequestDispatcher("/admin/Qlyhopdongthue.jsp").forward(request, response);
    }

    /**
     * Truyền hợp đồng cần sửa vào form (cũng nằm trong Qlyhopdongthue.jsp)
     */
    private void showEditHopDong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int maHopDong = Integer.parseInt(request.getParameter("id"));
        HopDongThue hopDong = hopDongThueDAO.findById(maHopDong);
        List<HopDongThue> list = hopDongThueDAO.findAll();

        request.setAttribute("hopDong", hopDong); // để hiển thị lên modal
        request.setAttribute("danhSachHopDong", list);
        request.getRequestDispatcher("/admin/Qlyhopdongthue.jsp").forward(request, response);
    }

    /**
     * Xóa hợp đồng thuê
     */
    private void deleteHopDong(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int maHopDong = Integer.parseInt(request.getParameter("id"));
        hopDongThueDAO.delete(maHopDong);
        response.sendRedirect("hopdongthue");
    }

    /**
     * Tìm kiếm theo tên người dùng và trạng thái
     */
    private void searchHopDong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tenNguoiDung = request.getParameter("tenNguoiDung");
        String trangThai = request.getParameter("trangThai");

        List<HopDongThue> list = hopDongThueDAO.findByTenNguoiDungVaTrangThai(tenNguoiDung, trangThai);
        request.setAttribute("danhSachHopDong", list);
        request.setAttribute("timTenNguoiDung", tenNguoiDung);
        request.setAttribute("timTrangThai", trangThai);
        request.getRequestDispatcher("/admin/Qlyhopdongthue.jsp").forward(request, response);
    }

    /**
     * Cập nhật thông tin hợp đồng
     */
    private void updateHopDong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int maHopDong = Integer.parseInt(request.getParameter("maHopDong"));
            String loaiHopDong = request.getParameter("loaiHopDong");
            int thoiGianThue = Integer.parseInt(request.getParameter("thoiGianThue"));
            BigDecimal tongPhi = new BigDecimal(request.getParameter("tongPhi"));
            BigDecimal tienCoc = new BigDecimal(request.getParameter("tienCoc"));
            String trangThai = request.getParameter("trangThai");
            String ghiChu = request.getParameter("ghiChu");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date ngayBatDau = sdf.parse(request.getParameter("ngayBatDau"));
            Date ngayKetThuc = sdf.parse(request.getParameter("ngayKetThuc"));

            Date ngayTraThucTe = null;
            if (request.getParameter("ngayTraThucTe") != null && !request.getParameter("ngayTraThucTe").isEmpty()) {
                ngayTraThucTe = sdf.parse(request.getParameter("ngayTraThucTe"));
            }

            BigDecimal phiPhat = new BigDecimal(request.getParameter("phiPhat"));

            HopDongThue hopDong = hopDongThueDAO.findById(maHopDong);
            if (hopDong == null) {
                response.sendError(404, "Không tìm thấy hợp đồng.");
                return;
            }

            // cập nhật lại
            hopDong.setLoaiHopDong(loaiHopDong);
            hopDong.setNgayBatDau(ngayBatDau);
            hopDong.setNgayKetThuc(ngayKetThuc);
            hopDong.setThoiGianThue(thoiGianThue);
            hopDong.setTongPhi(tongPhi);
            hopDong.setTienCoc(tienCoc);
            hopDong.setTrangThai(trangThai);
            hopDong.setNgayTraThucTe(ngayTraThucTe);
            hopDong.setPhiPhat(phiPhat);
            hopDong.setGhiChu(ghiChu);

            hopDongThueDAO.update(hopDong);

            response.sendRedirect("hopdongthue");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi cập nhật: " + e.getMessage());
            listHopDong(request, response);
        }
    }
}
