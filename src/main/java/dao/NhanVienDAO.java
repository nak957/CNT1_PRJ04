package dao;

import config.DBConnection;
import model.NhanVien;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NhanVienDAO {

    public List<NhanVien> getAllNhanVien() {
        List<NhanVien> list = new ArrayList<>();
        String sql = "SELECT * FROM nhanvien";
        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                NhanVien nv = new NhanVien(
                        rs.getInt("ma_nhan_vien"),
                        rs.getString("ho_ten"),
                        rs.getString("so_dien_thoai"),
                        rs.getString("email"),
                        rs.getString("dia_chi"),
                        rs.getString("vai_tro"),
                        rs.getString("trang_thai")
                );
                list.add(nv);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
        return list;
    }

    public void insertNhanVien(NhanVien nv) {
        String sql = "INSERT INTO nhanvien (ma_nhan_vien, ho_ten, so_dien_thoai, email, dia_chi, vai_tro, trang_thai) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, nv.getMaNhanVien());
            stmt.setString(2, nv.getHoTen());
            stmt.setString(3, nv.getSoDienThoai());
            stmt.setString(4, nv.getEmail());
            stmt.setString(5, nv.getDiaChi());
            stmt.setString(6, nv.getVaiTro());
            stmt.setString(7, nv.getTrangThai());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    public void updateNhanVien(NhanVien nv) {
        String sql = "UPDATE nhanvien SET ho_ten=?, so_dien_thoai=?, email=?, dia_chi=?, vai_tro=?, trang_thai=? WHERE ma_nhan_vien=?";
        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nv.getHoTen());
            stmt.setString(2, nv.getSoDienThoai());
            stmt.setString(3, nv.getEmail());
            stmt.setString(4, nv.getDiaChi());
            stmt.setString(5, nv.getVaiTro());
            stmt.setString(6, nv.getTrangThai());
            stmt.setInt(7, nv.getMaNhanVien());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    public void deleteNhanVien(int maNhanVien) {
        String sql = "DELETE FROM nhanvien WHERE ma_nhan_vien=?";
        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, maNhanVien);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
    }

    public NhanVien getNhanVienById(int id) {
        String sql = "SELECT * FROM nhanvien WHERE ma_nhan_vien=?";
        Connection conn = null;

        try {
            conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                NhanVien nv = new NhanVien(
                        rs.getInt("ma_nhan_vien"),
                        rs.getString("ho_ten"),
                        rs.getString("so_dien_thoai"),
                        rs.getString("email"),
                        rs.getString("dia_chi"),
                        rs.getString("vai_tro"),
                        rs.getString("trang_thai")
                );
                rs.close();
                stmt.close();
                return nv;
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
        return null;
    }
}
