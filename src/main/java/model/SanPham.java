package model;

import java.math.BigDecimal;

public class SanPham {
    private int maSanPham;
    private String ten;
    private String moTa;
    private int maDanhMuc;
    private BigDecimal giaThue;
    private BigDecimal giaBan;
    private BigDecimal tienCoc;
    private int soLuongTon;
    private String urlAnh;
    private String trangThai;

    public SanPham() {}

    public SanPham(int maSanPham, String ten, String moTa, int maDanhMuc,
                   BigDecimal giaThue, BigDecimal giaBan, BigDecimal tienCoc,
                   int soLuongTon, String urlAnh, String trangThai) {
        this.maSanPham = maSanPham;
        this.ten = ten;
        this.moTa = moTa;
        this.maDanhMuc = maDanhMuc;
        this.giaThue = giaThue;
        this.giaBan = giaBan;
        this.tienCoc = tienCoc;
        this.soLuongTon = soLuongTon;
        this.urlAnh = urlAnh;
        this.trangThai = trangThai;
    }

    // Getter và Setter
    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(int maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public BigDecimal getGiaThue() {
        return giaThue;
    }

    public void setGiaThue(BigDecimal giaThue) {
        this.giaThue = giaThue;
    }

    public BigDecimal getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(BigDecimal giaBan) {
        this.giaBan = giaBan;
    }

    public BigDecimal getTienCoc() {
        return tienCoc;
    }

    public void setTienCoc(BigDecimal tienCoc) {
        this.tienCoc = tienCoc;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(int soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    public String getUrlAnh() {
        return urlAnh;
    }

    public void setUrlAnh(String urlAnh) {
        this.urlAnh = urlAnh;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}
