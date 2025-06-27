package model;

import java.time.LocalDateTime;

public class GioHang {
    private int maGioHang;
    private int maNguoiDung;
    private int maSanPham;
    private int soLuong;
    private LocalDateTime ngayThem;
    private SanPham sanPham; // Thêm thuộc tính SanPham

    // Constructor mặc định
    public GioHang() {
    }

    // Constructor đầy đủ
    public GioHang(int maGioHang, int maNguoiDung, int maSanPham, int soLuong, LocalDateTime ngayThem) {
        this.maGioHang = maGioHang;
        this.maNguoiDung = maNguoiDung;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.ngayThem = ngayThem;
    }

    // Getters và Setters
    public int getMaGioHang() {
        return maGioHang;
    }

    public void setMaGioHang(int maGioHang) {
        this.maGioHang = maGioHang;
    }

    public int getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(int maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public LocalDateTime getNgayThem() {
        return ngayThem;
    }

    public void setNgayThem(LocalDateTime ngayThem) {
        this.ngayThem = ngayThem;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }
}