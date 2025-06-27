package dao;

import model.ChiTietDonHang;
import config.DBConnection;
import java.sql.*;

public class ChiTietDonHangDAO {
    public void insert(ChiTietDonHang ct) {
        String sql = "INSERT INTO ChiTietDonHang (ma_don_hang, ma_san_pham, so_luong, don_gia) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, ct.getMaDonHang());
            ps.setInt(2, ct.getMaSanPham());
            ps.setInt(3, ct.getSoLuong());
            ps.setBigDecimal(4, ct.getDonGia());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
