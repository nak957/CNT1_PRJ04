package dao;

import model.ThanhToanMua;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import config.DBConnection;

public class ThanhToanMuaDAO {

    // Thêm mới thanh toán
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

    // Lấy toàn bộ danh sách
    public List<ThanhToanMua> getAll() {
        List<ThanhToanMua> list = new ArrayList<>();
        String sql = "SELECT * FROM ThanhToanMua ORDER BY ngay_tao DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ThanhToanMua tt = new ThanhToanMua();
                tt.setMaThanhToanMua(rs.getInt("ma_thanh_toan_mua"));
                tt.setMaDonHang(rs.getInt("ma_don_hang"));
                tt.setMaNguoiDung(rs.getInt("ma_nguoi_dung"));
                tt.setSoTien(rs.getBigDecimal("so_tien"));
                tt.setPhuongThuc(rs.getString("phuong_thuc"));
                tt.setTrangThai(rs.getString("trang_thai"));
                tt.setNgayTao(rs.getTimestamp("ngay_tao"));
                tt.setMaGiaoDich(rs.getString("ma_giao_dich"));

                list.add(tt);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ Sửa thông tin thanh toán
    public void update(ThanhToanMua tt) {
        String sql = "UPDATE ThanhToanMua SET ma_don_hang = ?, ma_nguoi_dung = ?, so_tien = ?, phuong_thuc = ?, trang_thai = ?, ma_giao_dich = ? WHERE ma_thanh_toan_mua = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, tt.getMaDonHang());
            ps.setInt(2, tt.getMaNguoiDung());
            ps.setBigDecimal(3, tt.getSoTien());
            ps.setString(4, tt.getPhuongThuc());
            ps.setString(5, tt.getTrangThai());
            ps.setString(6, tt.getMaGiaoDich());
            ps.setInt(7, tt.getMaThanhToanMua());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Xóa bản ghi thanh toán
    public void delete(int maThanhToanMua) {
        String sql = "DELETE FROM ThanhToanMua WHERE ma_thanh_toan_mua = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, maThanhToanMua);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 // ✅ Lấy danh sách thanh toán mua theo người dùng
    public List<ThanhToanMua> findByNguoiDung(int maNguoiDung) {
        List<ThanhToanMua> list = new ArrayList<>();
        String sql = "SELECT * FROM ThanhToanMua WHERE ma_nguoi_dung = ? ORDER BY ngay_tao DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maNguoiDung);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ThanhToanMua tt = new ThanhToanMua();
                tt.setMaThanhToanMua(rs.getInt("ma_thanh_toan_mua"));
                tt.setMaDonHang(rs.getInt("ma_don_hang"));
                tt.setMaNguoiDung(rs.getInt("ma_nguoi_dung"));
                tt.setSoTien(rs.getBigDecimal("so_tien"));
                tt.setPhuongThuc(rs.getString("phuong_thuc"));
                tt.setTrangThai(rs.getString("trang_thai"));
                tt.setNgayTao(rs.getTimestamp("ngay_tao"));
                tt.setMaGiaoDich(rs.getString("ma_giao_dich"));

                list.add(tt);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
