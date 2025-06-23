package dao;

import model.DanhMuc;
import config.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DanhMucDAO {

    public List<DanhMuc> getAll() {
        List<DanhMuc> list = new ArrayList<>();
        String sql = "SELECT * FROM DanhMuc ORDER BY ma_danh_muc DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DanhMuc dm = new DanhMuc(
                    rs.getInt("ma_danh_muc"),
                    rs.getString("ten"),
                    rs.getString("mo_ta"),
                    rs.getString("url_anh"),
                    rs.getTimestamp("ngay_tao")
                );
                list.add(dm);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(DanhMuc dm) {
        String sql = "INSERT INTO DanhMuc (ten, mo_ta, url_anh) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dm.getTen());
            ps.setString(2, dm.getMoTa());
            ps.setString(3, dm.getUrlAnh());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(DanhMuc dm) {
        String sql = "UPDATE DanhMuc SET ten = ?, mo_ta = ?, url_anh = ? WHERE ma_danh_muc = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dm.getTen());
            ps.setString(2, dm.getMoTa());
            ps.setString(3, dm.getUrlAnh());
            ps.setInt(4, dm.getMaDanhMuc());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM DanhMuc WHERE ma_danh_muc = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
