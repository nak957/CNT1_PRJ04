package dao;

import config.DBConnection;
import model.ThanhToanThue;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO xử lý các thao tác với bảng ThanhToanThue
 */
public class ThanhToanThueDAO {

    /**
     * Chức năng: Thêm bản ghi thanh toán thuê vào cơ sở dữ liệu
     */
    public boolean insert(ThanhToanThue thanhToan) {
        String sql = "INSERT INTO ThanhToanThue (ma_hop_dong, ma_nguoi_dung, loai_thanh_toan, so_tien, phuong_thuc, " +
                     "trang_thai, ma_giao_dich, ngay_tao, ky_thanh_toan, thang_thanh_toan, nam_thanh_toan, " +
                     "ngay_bat_dau_ky, ngay_ket_thuc_ky) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, thanhToan.getMaHopDong());
            stmt.setInt(2, thanhToan.getMaNguoiDung());
            stmt.setString(3, thanhToan.getLoaiThanhToan());
            stmt.setBigDecimal(4, thanhToan.getSoTien());
            stmt.setString(5, thanhToan.getPhuongThuc());
            stmt.setString(6, thanhToan.getTrangThai());
            stmt.setString(7, thanhToan.getMaGiaoDich());
            stmt.setTimestamp(8, new Timestamp(thanhToan.getNgayTao().getTime()));
            stmt.setInt(9, thanhToan.getKyThanhToan());
            stmt.setInt(10, thanhToan.getThangThanhToan());
            stmt.setInt(11, thanhToan.getNamThanhToan());
            stmt.setDate(12, new java.sql.Date(thanhToan.getNgayBatDauKy().getTime()));
            stmt.setDate(13, new java.sql.Date(thanhToan.getNgayKetThucKy().getTime()));

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Chức năng: Lấy tất cả thanh toán theo mã người dùng
     */
    public List<ThanhToanThue> findByNguoiDung(int maNguoiDung) {
        List<ThanhToanThue> list = new ArrayList<>();
        String sql = "SELECT * FROM ThanhToanThue WHERE ma_nguoi_dung = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maNguoiDung);
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
     * Hàm hỗ trợ: Mapping ResultSet sang đối tượng ThanhToanThue
     */
    private ThanhToanThue mapRow(ResultSet rs) throws SQLException {
        ThanhToanThue ttt = new ThanhToanThue();
        ttt.setMaThanhToanThue(rs.getInt("ma_thanh_toan_thue"));
        ttt.setMaHopDong(rs.getInt("ma_hop_dong"));
        ttt.setMaNguoiDung(rs.getInt("ma_nguoi_dung"));
        ttt.setLoaiThanhToan(rs.getString("loai_thanh_toan"));
        ttt.setSoTien(rs.getBigDecimal("so_tien"));
        ttt.setPhuongThuc(rs.getString("phuong_thuc"));
        ttt.setTrangThai(rs.getString("trang_thai"));
        ttt.setMaGiaoDich(rs.getString("ma_giao_dich"));
        ttt.setNgayTao(rs.getTimestamp("ngay_tao"));
        ttt.setKyThanhToan(rs.getInt("ky_thanh_toan"));
        ttt.setThangThanhToan(rs.getInt("thang_thanh_toan"));
        ttt.setNamThanhToan(rs.getInt("nam_thanh_toan"));
        ttt.setNgayBatDauKy(rs.getDate("ngay_bat_dau_ky"));
        ttt.setNgayKetThucKy(rs.getDate("ngay_ket_thuc_ky"));
        return ttt;
    }
}
