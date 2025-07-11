package model;

import java.math.BigDecimal;

public class ChiTietHopDongThue {
    private int maCtThue;
    
    private int maHopDong;
    private int maSanPham;
    private int soLuong;
    private BigDecimal donGiaThue;
    private BigDecimal thanhTien;

    // Constructor không tham số
    public ChiTietHopDongThue() {
    }

    // Constructor đầy đủ tham số
    public ChiTietHopDongThue(int maCtThue,  int maHopDong, int maSanPham,
                               int soLuong, BigDecimal donGiaThue, BigDecimal thanhTien) {
        this.maCtThue = maCtThue;
       
        this.maHopDong = maHopDong;
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
        this.donGiaThue = donGiaThue;
        this.thanhTien = thanhTien;
    }

    // Getter & Setter

    public int getMaCtThue() {
        return maCtThue;
    }

    public void setMaCtThue(int maCtThue) {
        this.maCtThue = maCtThue;
    }

    

    public int getMaHopDong() {
        return maHopDong;
    }

    public void setMaHopDong(int maHopDong) {
        this.maHopDong = maHopDong;
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

    public BigDecimal getDonGiaThue() {
        return donGiaThue;
    }

    public void setDonGiaThue(BigDecimal donGiaThue) {
        this.donGiaThue = donGiaThue;
    }

    public BigDecimal getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(BigDecimal thanhTien) {
        this.thanhTien = thanhTien;
    }

	

	
}
