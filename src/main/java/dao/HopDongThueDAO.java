package dao;

import model.HopDongThue;
import config.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HopDongThueDAO {

    /**
     * Chức năng: Thêm mới hợp đồng thuê vào CSDL
     * Trả về: mã hợp đồng (auto-increment) nếu thêm thành công, -1 nếu lỗi
     */
    public int insert(HopDongThue hopDong) {
        String sql = "INSERT INTO HopDongThue (ma_nguoi_dung, loai_hop_dong, ngay_bat_dau, ngay_ket_thuc, thoi_gian_thue, " +
                "tong_phi, tien_coc, trang_thai, ngay_tao, ngay_cap_nhat, ngay_tra_thuc_te, phi_phat, ghi_chu) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW(), ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, hopDong.getMaNguoiDung());
            stmt.setString(2, hopDong.getLoaiHopDong());
            stmt.setDate(3, new java.sql.Date(hopDong.getNgayBatDau().getTime()));
            stmt.setDate(4, new java.sql.Date(hopDong.getNgayKetThuc().getTime()));
            stmt.setInt(5, hopDong.getThoiGianThue());
            stmt.setBigDecimal(6, hopDong.getTongPhi());
            stmt.setBigDecimal(7, hopDong.getTienCoc());
            stmt.setString(8, hopDong.getTrangThai());
            stmt.setDate(9, hopDong.getNgayTraThucTe() != null ? new java.sql.Date(hopDong.getNgayTraThucTe().getTime()) : null);
            stmt.setBigDecimal(10, hopDong.getPhiPhat());
            stmt.setString(11, hopDong.getGhiChu());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Thêm hợp đồng thuê thất bại, không có dòng nào bị ảnh hưởng.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Thêm hợp đồng thuê thất bại, không lấy được ID.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * Chức năng: Lấy toàn bộ danh sách hợp đồng thuê từ CSDL
     */
    public List<HopDongThue> findAll() {
        List<HopDongThue> list = new ArrayList<>();
        String sql = "SELECT * FROM HopDongThue";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                HopDongThue hdt = extractFromResultSet(rs);
                list.add(hdt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Chức năng: Tìm hợp đồng thuê theo mã hợp đồng
     */
    public HopDongThue findById(int maHopDong) {
        String sql = "SELECT * FROM HopDongThue WHERE ma_hop_dong = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maHopDong);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Chức năng: Cập nhật thông tin hợp đồng thuê
     */
    public boolean update(HopDongThue hopDong) {
        String sql = "UPDATE HopDongThue SET loai_hop_dong=?, ngay_bat_dau=?, ngay_ket_thuc=?, thoi_gian_thue=?, " +
                "tong_phi=?, tien_coc=?, trang_thai=?, ngay_cap_nhat=NOW(), ngay_tra_thuc_te=?, phi_phat=?, ghi_chu=? " +
                "WHERE ma_hop_dong=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, hopDong.getLoaiHopDong());
            stmt.setDate(2, new java.sql.Date(hopDong.getNgayBatDau().getTime()));
            stmt.setDate(3, new java.sql.Date(hopDong.getNgayKetThuc().getTime()));
            stmt.setInt(4, hopDong.getThoiGianThue());
            stmt.setBigDecimal(5, hopDong.getTongPhi());
            stmt.setBigDecimal(6, hopDong.getTienCoc());
            stmt.setString(7, hopDong.getTrangThai());
            stmt.setDate(8, hopDong.getNgayTraThucTe() != null ? new java.sql.Date(hopDong.getNgayTraThucTe().getTime()) : null);
            stmt.setBigDecimal(9, hopDong.getPhiPhat());
            stmt.setString(10, hopDong.getGhiChu());
            stmt.setInt(11, hopDong.getMaHopDong());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Chức năng: Xóa hợp đồng thuê theo mã
     */
    public boolean delete(int maHopDong) {
        String sql = "DELETE FROM HopDongThue WHERE ma_hop_dong = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maHopDong);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Hàm hỗ trợ: Trích xuất dữ liệu từ ResultSet thành đối tượng HopDongThue
     */
    private HopDongThue extractFromResultSet(ResultSet rs) throws SQLException {
        HopDongThue hdt = new HopDongThue();
        hdt.setMaHopDong(rs.getInt("ma_hop_dong"));
        hdt.setMaNguoiDung(rs.getInt("ma_nguoi_dung"));
        hdt.setLoaiHopDong(rs.getString("loai_hop_dong"));
        hdt.setNgayBatDau(rs.getDate("ngay_bat_dau"));
        hdt.setNgayKetThuc(rs.getDate("ngay_ket_thuc"));
        hdt.setThoiGianThue(rs.getInt("thoi_gian_thue"));
        hdt.setTongPhi(rs.getBigDecimal("tong_phi"));
        hdt.setTienCoc(rs.getBigDecimal("tien_coc"));
        hdt.setTrangThai(rs.getString("trang_thai"));
        hdt.setNgayTao(rs.getTimestamp("ngay_tao"));
        hdt.setNgayCapNhat(rs.getTimestamp("ngay_cap_nhat"));
        hdt.setNgayTraThucTe(rs.getDate("ngay_tra_thuc_te"));
        hdt.setPhiPhat(rs.getBigDecimal("phi_phat"));
        hdt.setGhiChu(rs.getString("ghi_chu"));
        return hdt;
    }
}
