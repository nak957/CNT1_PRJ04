package dao;

import config.DBConnection;
import model.ChiTietHopDongThue;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO xử lý các thao tác liên quan đến bảng ChiTietHopDongThue
 */
public class ChiTietHopDongThueDAO {

    /**
     * Thêm mới một chi tiết thuê vào CSDL
     */
    public boolean insert(ChiTietHopDongThue ct) {
        String sql = "INSERT INTO ChiTietHopDongThue ( ma_hop_dong, ma_san_pham, so_luong, don_gia_thue, thanh_tien) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

         
            stmt.setInt(1, ct.getMaHopDong());
            stmt.setInt(2, ct.getMaSanPham());
            stmt.setInt(3, ct.getSoLuong());
            stmt.setBigDecimal(4, ct.getDonGiaThue());
            stmt.setBigDecimal(5, ct.getThanhTien());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Lấy tất cả chi tiết thuê theo mã hợp đồng
     */
    public List<ChiTietHopDongThue> findByMaHopDong(int maHopDong) {
        List<ChiTietHopDongThue> list = new ArrayList<>();
        String sql = "SELECT * FROM ChiTietHopDongThue WHERE ma_hop_dong = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maHopDong);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Hàm hỗ trợ: Tạo đối tượng ChiTietHopDongThue từ ResultSet
     */
    private ChiTietHopDongThue mapRow(ResultSet rs) throws SQLException {
        ChiTietHopDongThue ct = new ChiTietHopDongThue();
        ct.setMaCtThue(rs.getInt("ma_ct_thue"));
        
        ct.setMaHopDong(rs.getInt("ma_hop_dong"));
        ct.setMaSanPham(rs.getInt("ma_san_pham"));
        ct.setSoLuong(rs.getInt("so_luong"));
        ct.setDonGiaThue(rs.getBigDecimal("don_gia_thue"));
        ct.setThanhTien(rs.getBigDecimal("thanh_tien"));
        return ct;
    }
}
