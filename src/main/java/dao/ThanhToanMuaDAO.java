package dao;

import model.ThanhToanMua;
import java.sql.*;
import config.DBConnection;

public class ThanhToanMuaDAO {
    public void insert(ThanhToanMua tt) {
        String sql = "INSERT INTO ThanhToanMua (ma_don_hang, ma_nguoi_dung, so_tien, phuong_thuc, trang_thai, ma_giao_dich) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tt.getMaDonHang());
            ps.setInt(2, tt.getMaNguoiDung());
            ps.setBigDecimal(3, tt.getSoTien());
            ps.setString(4, tt.getPhuongThuc());
            ps.setString(5, tt.getTrangThai());
            ps.setString(6, tt.getMaGiaoDich());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
