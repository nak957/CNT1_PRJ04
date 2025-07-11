package dao;

import model.HopDongThue;
import config.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HopDongThueDAO {

    // Thêm hợp đồng thuê
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
            if (affectedRows == 0) throw new SQLException("Thêm hợp đồng thất bại.");

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) return rs.getInt(1);
                else throw new SQLException("Không lấy được ID hợp đồng.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Lấy tất cả hợp đồng thuê
    public List<HopDongThue> findAll() {
        List<HopDongThue> list = new ArrayList<>();
        String sql = "SELECT * FROM HopDongThue";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) list.add(extractFromResultSet(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Tìm theo ID
    public HopDongThue findById(int maHopDong) {
        String sql = "SELECT * FROM HopDongThue WHERE ma_hop_dong = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maHopDong);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return extractFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Cập nhật hợp đồng thuê
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

    public boolean delete(int maHopDong) {
        String deleteThanhToan = "DELETE FROM ThanhToanThue WHERE ma_hop_dong = ?";
        String deleteChiTiet = "DELETE FROM ChiTietHopDongThue WHERE ma_hop_dong = ?";
        String deleteHopDong = "DELETE FROM HopDongThue WHERE ma_hop_dong = ?";

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu transaction

            try (
                PreparedStatement stmt1 = conn.prepareStatement(deleteThanhToan);
                PreparedStatement stmt2 = conn.prepareStatement(deleteChiTiet);
                PreparedStatement stmt3 = conn.prepareStatement(deleteHopDong)
            ) {
                // 1. Xóa bảng ThanhToanThue
                stmt1.setInt(1, maHopDong);
                stmt1.executeUpdate();

                // 2. Xóa bảng ChiTietHopDongThue
                stmt2.setInt(1, maHopDong);
                stmt2.executeUpdate();

                // 3. Cuối cùng mới xóa HopDongThue
                stmt3.setInt(1, maHopDong);
                int rows = stmt3.executeUpdate();

                conn.commit(); // Thành công
                return rows > 0;

            } catch (SQLException e) {
                conn.rollback(); // Thất bại thì rollback
                e.printStackTrace();
            } finally {
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Trích xuất từ ResultSet
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

    // Tìm kiếm theo tên người dùng và trạng thái
    public List<HopDongThue> findByTenNguoiDungVaTrangThai(String tenNguoiDung, String trangThai) {
        List<HopDongThue> list = new ArrayList<>();
        String sql = "SELECT h.* FROM hopdongthue h " +
                     "JOIN nguoidung n ON h.ma_nguoi_dung = n.ma_nguoi_dung " +
                     "WHERE n.ho_ten LIKE ? AND h.trang_thai = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + tenNguoiDung + "%");
            stmt.setString(2, trangThai);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(extractFromResultSet(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
