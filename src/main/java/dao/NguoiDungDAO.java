package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import config.DBConnection;
import model.NguoiDung;

public class NguoiDungDAO {

    // Kiểm tra đăng nhập
    public NguoiDung checkLogin(String email, String matKhau) {
        NguoiDung user = null;
        String sql = "SELECT * FROM nguoidung WHERE email=? AND mat_khau=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, matKhau);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Lấy thông tin theo email
    public NguoiDung getByEmail(String email) {
        NguoiDung user = null;
        String sql = "SELECT * FROM nguoidung WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Lấy người dùng theo ID
    public NguoiDung getById(int maNguoiDung) {
        NguoiDung user = null;
        String sql = "SELECT * FROM nguoidung WHERE ma_nguoi_dung = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maNguoiDung);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Lấy danh sách tất cả người dùng có vai trò khách hàng
    public List<NguoiDung> getAllUsers(String string) {
        List<NguoiDung> list = new ArrayList<>();
        String sql = "SELECT * FROM nguoidung WHERE vai_tro = 'khachhang'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(extractUserFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm người dùng
    public void insertUser(NguoiDung user) {
        String sql = "INSERT INTO nguoidung (email, mat_khau, vai_tro, ho_ten, so_dien_thoai, dia_chi, ngay_tao, ngay_cap_nhat) " +
                     "VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getMatKhau());
            stmt.setString(3, user.getVaiTro());
            stmt.setString(4, user.getHoTen());
            stmt.setString(5, user.getSoDienThoai());
            stmt.setString(6, user.getDiaChi());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật người dùng
    public void updateUser(NguoiDung user) {
        String sql = "UPDATE nguoidung SET mat_khau = ?, ho_ten = ?, so_dien_thoai = ?, dia_chi = ?, ngay_cap_nhat = CURRENT_TIMESTAMP WHERE ma_nguoi_dung = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getMatKhau());
            stmt.setString(2, user.getHoTen());
            stmt.setString(3, user.getSoDienThoai());
            stmt.setString(4, user.getDiaChi());
            stmt.setInt(5, user.getMaNguoiDung());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa người dùng
    public void deleteUser(int maNguoiDung) {
        String sql = "DELETE FROM nguoidung WHERE ma_nguoi_dung = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maNguoiDung);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Hàm hỗ trợ lấy user từ ResultSet
    private NguoiDung extractUserFromResultSet(ResultSet rs) throws SQLException {
        NguoiDung user = new NguoiDung();
        user.setMaNguoiDung(rs.getInt("ma_nguoi_dung"));
        user.setEmail(rs.getString("email"));
        user.setMatKhau(rs.getString("mat_khau"));
        user.setVaiTro(rs.getString("vai_tro"));
        user.setHoTen(rs.getString("ho_ten"));
        user.setSoDienThoai(rs.getString("so_dien_thoai"));
        user.setDiaChi(rs.getString("dia_chi"));
        user.setNgayTao(rs.getTimestamp("ngay_tao"));
        user.setNgayCapNhat(rs.getTimestamp("ngay_cap_nhat"));
        return user;
    }
}
