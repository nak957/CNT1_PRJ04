package dao;

import model.DonHang;
import config.DBConnection;

import java.sql.*;

public class DonHangDAO {
    public int insert(DonHang dh) {
        int generatedId = -1;
        String sql = "INSERT INTO DonHang (ma_nguoi_dung, tong_tien) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, dh.getMaNguoiDung());
            ps.setBigDecimal(2, dh.getTongTien());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
    }
}
