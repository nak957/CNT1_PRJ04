package dao;

import model.SanPham;
import config.DBConnection;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class SanPhamDAO {

    public List<SanPham> getAll() {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSanPham(rs.getInt("ma_san_pham"));
                sp.setTen(rs.getString("ten"));
                sp.setMoTa(rs.getString("mo_ta"));
                sp.setMaDanhMuc(rs.getInt("ma_danh_muc"));
                sp.setGiaThue(rs.getBigDecimal("gia_thue"));
                sp.setGiaBan(rs.getBigDecimal("gia_ban"));
                sp.setTienCoc(rs.getBigDecimal("tien_coc"));
                sp.setSoLuongTon(rs.getInt("so_luong_ton"));
                sp.setUrlAnh(rs.getString("url_anh"));
                sp.setTrangThai(rs.getString("trang_thai"));
                list.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(SanPham sp) {
        String sql = "INSERT INTO SanPham (ten, mo_ta, ma_danh_muc, gia_thue, gia_ban, tien_coc, so_luong_ton, url_anh, trang_thai) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sp.getTen());
            ps.setString(2, sp.getMoTa());
            ps.setInt(3, sp.getMaDanhMuc());
            ps.setBigDecimal(4, sp.getGiaThue());
            ps.setBigDecimal(5, sp.getGiaBan());
            ps.setBigDecimal(6, sp.getTienCoc());
            ps.setInt(7, sp.getSoLuongTon());
            ps.setString(8, sp.getUrlAnh());
            ps.setString(9, sp.getTrangThai());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(SanPham sp) {
        String sql = "UPDATE SanPham SET ten=?, mo_ta=?, ma_danh_muc=?, gia_thue=?, gia_ban=?, tien_coc=?, so_luong_ton=?, url_anh=?, trang_thai=? WHERE ma_san_pham=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sp.getTen());
            ps.setString(2, sp.getMoTa());
            ps.setInt(3, sp.getMaDanhMuc());
            ps.setBigDecimal(4, sp.getGiaThue());
            ps.setBigDecimal(5, sp.getGiaBan());
            ps.setBigDecimal(6, sp.getTienCoc());
            ps.setInt(7, sp.getSoLuongTon());
            ps.setString(8, sp.getUrlAnh());
            ps.setString(9, sp.getTrangThai());
            ps.setInt(10, sp.getMaSanPham());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM SanPham WHERE ma_san_pham=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public SanPham getById(int id) {
        String sql = "SELECT * FROM SanPham WHERE ma_san_pham=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new SanPham(
                        rs.getInt("ma_san_pham"),
                        rs.getString("ten"),
                        rs.getString("mo_ta"),
                        rs.getInt("ma_danh_muc"),
                        rs.getBigDecimal("gia_thue"),
                        rs.getBigDecimal("gia_ban"),
                        rs.getBigDecimal("tien_coc"),
                        rs.getInt("so_luong_ton"),
                        rs.getString("url_anh"),
                        rs.getString("trang_thai")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //hàm để hiển thị sản phẩm theo danh mục
    public List<SanPham> getByDanhMuc(int maDanhMuc) {
        List<SanPham> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE ma_danh_muc = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, maDanhMuc);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSanPham(rs.getInt("ma_san_pham"));
                sp.setTen(rs.getString("ten"));
                sp.setMoTa(rs.getString("mo_ta"));
                sp.setMaDanhMuc(rs.getInt("ma_danh_muc"));
                sp.setGiaThue(rs.getBigDecimal("gia_thue"));
                sp.setGiaBan(rs.getBigDecimal("gia_ban"));
                sp.setTienCoc(rs.getBigDecimal("tien_coc"));
                sp.setSoLuongTon(rs.getInt("so_luong_ton"));
                sp.setUrlAnh(rs.getString("url_anh"));
                sp.setTrangThai(rs.getString("trang_thai"));
                list.add(sp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	
}
