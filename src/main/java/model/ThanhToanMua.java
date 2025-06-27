package model;

import java.math.BigDecimal;
import java.util.Date;

public class ThanhToanMua {
    private int maThanhToanMua;
    private int maDonHang;
    private int maNguoiDung;
    private BigDecimal soTien;
    private String phuongThuc;
    private String trangThai;
    private String maGiaoDich;
    private Date ngayTao;

    // Getters and Setters
    public int getMaThanhToanMua() {
        return maThanhToanMua;
    }

    public void setMaThanhToanMua(int maThanhToanMua) {
        this.maThanhToanMua = maThanhToanMua;
    }

    public int getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(int maDonHang) {
        this.maDonHang = maDonHang;
    }

    public int getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(int maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public BigDecimal getSoTien() {
        return soTien;
    }

    public void setSoTien(BigDecimal soTien) {
        this.soTien = soTien;
    }

    public String getPhuongThuc() {
        return phuongThuc;
    }

    public void setPhuongThuc(String phuongThuc) {
        this.phuongThuc = phuongThuc;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getMaGiaoDich() {
        return maGiaoDich;
    }

    public void setMaGiaoDich(String maGiaoDich) {
        this.maGiaoDich = maGiaoDich;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }
}
