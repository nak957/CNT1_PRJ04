package dao;

import config.DBConnection;
import model.GioHang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class GioHangDAO {
    public void insert(GioHang gioHang) {
        String sql = "INSERT INTO GioHang (ma_nguoi_dung, ma_san_pham, so_luong, ngay_them) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, gioHang.getMaNguoiDung());
            stmt.setInt(2, gioHang.getMaSanPham());
            stmt.setInt(3, gioHang.getSoLuong());
            stmt.setTimestamp(4, java.sql.Timestamp.valueOf(gioHang.getNgayThem()));
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<GioHang> getByNguoiDung(int maNguoiDung) {
        List<GioHang> gioHangList = new ArrayList<>();
        String sql = "SELECT * FROM GioHang WHERE ma_nguoi_dung = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, maNguoiDung);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                GioHang gioHang = new GioHang();
                gioHang.setMaGioHang(rs.getInt("ma_gio_hang"));
                gioHang.setMaNguoiDung(rs.getInt("ma_nguoi_dung"));
                gioHang.setMaSanPham(rs.getInt("ma_san_pham"));
                gioHang.setSoLuong(rs.getInt("so_luong"));
                gioHang.setNgayThem(rs.getTimestamp("ngay_them").toLocalDateTime());
                gioHangList.add(gioHang);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gioHangList;
    }

    public void updateSoLuong(int maNguoiDung, int maSanPham, int soLuong) {
        String sql = "UPDATE GioHang SET so_luong = ? WHERE ma_nguoi_dung = ? AND ma_san_pham = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, soLuong);
            stmt.setInt(2, maNguoiDung);
            stmt.setInt(3, maSanPham);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int maNguoiDung, int maSanPham) {
        String sql = "DELETE FROM GioHang WHERE ma_nguoi_dung = ? AND ma_san_pham = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, maNguoiDung);
            stmt.setInt(2, maSanPham);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteByNguoiDung(int maNguoiDung) {
        String sql = "DELETE FROM GioHang WHERE ma_nguoi_dung = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maNguoiDung);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
