package controller_khachhang;

import dao.ThanhToanMuaDAO;
import dao.ThanhToanThueDAO;
import model.ThanhToanMua;
import model.ThanhToanThue;
import model.DonHangView;
import model.NguoiDung;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/nguoidung/donhang") 
public class DonHangCuaToiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        NguoiDung nguoiDung = (NguoiDung) session.getAttribute("nguoiDung");

        if (nguoiDung == null) {
            response.sendRedirect(request.getContextPath() + "/dangnhap.jsp");
            return;
        }

        int maNguoiDung = nguoiDung.getMaNguoiDung();

        // Lấy danh sách thanh toán
        ThanhToanMuaDAO muaDAO = new ThanhToanMuaDAO();
        ThanhToanThueDAO thueDAO = new ThanhToanThueDAO();

        List<ThanhToanMua> dsMua = muaDAO.findByNguoiDung(maNguoiDung);
        List<ThanhToanThue> dsThue = thueDAO.findByNguoiDung(maNguoiDung);

        // Gộp thành DonHangView
        List<DonHangView> danhSachDonHang = new ArrayList<>();

        for (ThanhToanMua mua : dsMua) {
            DonHangView dh = new DonHangView(
                "mua",
                mua.getMaDonHang(),
                mua.getNgayTao(),
                mua.getSoTien().doubleValue(),
                mua.getTrangThai()
            );
            danhSachDonHang.add(dh);
        }

        for (ThanhToanThue thue : dsThue) {
            DonHangView dh = new DonHangView(
                "thue",
                thue.getMaHopDong(),
                thue.getNgayTao(),
                thue.getSoTien().doubleValue(),
                thue.getTrangThai()
            );
            danhSachDonHang.add(dh);
        }

        // Sắp xếp giảm dần theo ngày đặt
        danhSachDonHang.sort(Comparator.comparing(DonHangView::getNgayDat).reversed());

        // Gửi dữ liệu sang JSP
        request.setAttribute("danhSachDonHang", danhSachDonHang);
        request.getRequestDispatcher("/nguoidung/donhang.jsp").forward(request, response);
    }
}
