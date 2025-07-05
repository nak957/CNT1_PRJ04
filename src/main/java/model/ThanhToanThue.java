package model;

import java.math.BigDecimal;
import java.util.Date;

public class ThanhToanThue {
    private int maThanhToanThue;
    private int maHopDong;
    private int maNguoiDung;
    private String loaiThanhToan;
    private BigDecimal soTien;
    private String phuongThuc;
    private String trangThai;
    private String maGiaoDich;
    private Date ngayTao;
    private int kyThanhToan;
    private int thangThanhToan;
    private int namThanhToan;
    private Date ngayBatDauKy;
    private Date ngayKetThucKy;

    // Constructor không tham số
    public ThanhToanThue() {
    }

    // Constructor đầy đủ
    public ThanhToanThue(int maThanhToanThue, int maHopDong, int maNguoiDung, String loaiThanhToan,
                         BigDecimal soTien, String phuongThuc, String trangThai, String maGiaoDich,
                         Date ngayTao, int kyThanhToan, int thangThanhToan, int namThanhToan,
                         Date ngayBatDauKy, Date ngayKetThucKy) {
        this.maThanhToanThue = maThanhToanThue;
        this.maHopDong = maHopDong;
        this.maNguoiDung = maNguoiDung;
        this.loaiThanhToan = loaiThanhToan;
        this.soTien = soTien;
        this.phuongThuc = phuongThuc;
        this.trangThai = trangThai;
        this.maGiaoDich = maGiaoDich;
        this.ngayTao = ngayTao;
        this.kyThanhToan = kyThanhToan;
        this.thangThanhToan = thangThanhToan;
        this.namThanhToan = namThanhToan;
        this.ngayBatDauKy = ngayBatDauKy;
        this.ngayKetThucKy = ngayKetThucKy;
    }

    // Getter & Setter

    public int getMaThanhToanThue() {
        return maThanhToanThue;
    }

    public void setMaThanhToanThue(int maThanhToanThue) {
        this.maThanhToanThue = maThanhToanThue;
    }

    public int getMaHopDong() {
        return maHopDong;
    }

    public void setMaHopDong(int maHopDong) {
        this.maHopDong = maHopDong;
    }

    public int getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(int maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public String getLoaiThanhToan() {
        return loaiThanhToan;
    }

    public void setLoaiThanhToan(String loaiThanhToan) {
        this.loaiThanhToan = loaiThanhToan;
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

    public int getKyThanhToan() {
        return kyThanhToan;
    }

    public void setKyThanhToan(int kyThanhToan) {
        this.kyThanhToan = kyThanhToan;
    }

    public int getThangThanhToan() {
        return thangThanhToan;
    }

    public void setThangThanhToan(int thangThanhToan) {
        this.thangThanhToan = thangThanhToan;
    }

    public int getNamThanhToan() {
        return namThanhToan;
    }

    public void setNamThanhToan(int namThanhToan) {
        this.namThanhToan = namThanhToan;
    }

    public Date getNgayBatDauKy() {
        return ngayBatDauKy;
    }

    public void setNgayBatDauKy(Date ngayBatDauKy) {
        this.ngayBatDauKy = ngayBatDauKy;
    }

    public Date getNgayKetThucKy() {
        return ngayKetThucKy;
    }

    public void setNgayKetThucKy(Date ngayKetThucKy) {
        this.ngayKetThucKy = ngayKetThucKy;
    }
}
