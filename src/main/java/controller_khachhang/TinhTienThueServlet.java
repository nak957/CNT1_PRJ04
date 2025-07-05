package controller_khachhang;

import com.google.gson.Gson;
import model.GioHang;
import model.SanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@WebServlet("/TinhTienThueServlet")
public class TinhTienThueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<GioHang> gioHangThue = (List<GioHang>) session.getAttribute("gioHangThue");

        String thoiGianStr = request.getParameter("thoiGian");
        int thoiGianThue = 1;
        try {
            thoiGianThue = Integer.parseInt(thoiGianStr);
        } catch (Exception e) {
            thoiGianThue = 1; // fallback nếu lỗi
        }

        BigDecimal tongTien = BigDecimal.ZERO;
        BigDecimal tienCoc = BigDecimal.ZERO;
        BigDecimal phiVanChuyen = new BigDecimal("150000");

        if (gioHangThue != null) {
            for (GioHang item : gioHangThue) {
                SanPham sp = item.getSanPham();
                int soLuong = item.getSoLuong();
                BigDecimal gia = sp.getGiaThue().multiply(BigDecimal.valueOf(thoiGianThue));
                tongTien = tongTien.add(gia.multiply(BigDecimal.valueOf(soLuong)));

                tienCoc = tienCoc.add(sp.getTienCoc().multiply(BigDecimal.valueOf(soLuong)));
            }
        }

        BigDecimal tongDonHang = tongTien.add(phiVanChuyen);

        Map<String, String> ketQua = new HashMap<>();
        ketQua.put("tongTien", formatTien(tongTien));
        ketQua.put("tienCoc", formatTien(tienCoc));
        ketQua.put("tongDonHang", formatTien(tongDonHang));

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson(ketQua);
        response.getWriter().write(json);
    }

    private String formatTien(BigDecimal amount) {
        return String.format("%,d", amount.longValue()) + " đ";
    }
}
