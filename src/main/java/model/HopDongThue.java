package model;

import java.math.BigDecimal;
import java.util.Date;

public class HopDongThue {
    private int maHopDong;
    private int maNguoiDung;
    private String loaiHopDong;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private int thoiGianThue;
    private BigDecimal tongPhi;
    private BigDecimal tienCoc;
    private String trangThai;
    private Date ngayTao;
    private Date ngayCapNhat;
    private Date ngayTraThucTe;
    private BigDecimal phiPhat;
    private String ghiChu;

    // Constructor không tham số
    public HopDongThue() {
    }

    // Constructor đầy đủ tham số
    public HopDongThue(int maHopDong, int maNguoiDung, String loaiHopDong, Date ngayBatDau, Date ngayKetThuc,
                       int thoiGianThue, BigDecimal tongPhi, BigDecimal tienCoc, String trangThai,
                       Date ngayTao, Date ngayCapNhat, Date ngayTraThucTe, BigDecimal phiPhat, String ghiChu) {
        this.maHopDong = maHopDong;
        this.maNguoiDung = maNguoiDung;
        this.loaiHopDong = loaiHopDong;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
        this.thoiGianThue = thoiGianThue;
        this.tongPhi = tongPhi;
        this.tienCoc = tienCoc;
        this.trangThai = trangThai;
        this.ngayTao = ngayTao;
        this.ngayCapNhat = ngayCapNhat;
        this.ngayTraThucTe = ngayTraThucTe;
        this.phiPhat = phiPhat;
        this.ghiChu = ghiChu;
    }

    // Getter và Setter

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

    public String getLoaiHopDong() {
        return loaiHopDong;
    }

    public void setLoaiHopDong(String loaiHopDong) {
        this.loaiHopDong = loaiHopDong;
    }

    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public int getThoiGianThue() {
        return thoiGianThue;
    }

    public void setThoiGianThue(int thoiGianThue) {
        this.thoiGianThue = thoiGianThue;
    }

    public BigDecimal getTongPhi() {
        return tongPhi;
    }

    public void setTongPhi(BigDecimal tongPhi) {
        this.tongPhi = tongPhi;
    }

    public BigDecimal getTienCoc() {
        return tienCoc;
    }

    public void setTienCoc(BigDecimal tienCoc) {
        this.tienCoc = tienCoc;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Date getNgayCapNhat() {
        return ngayCapNhat;
    }

    public void setNgayCapNhat(Date ngayCapNhat) {
        this.ngayCapNhat = ngayCapNhat;
    }

    public Date getNgayTraThucTe() {
        return ngayTraThucTe;
    }

    public void setNgayTraThucTe(Date ngayTraThucTe) {
        this.ngayTraThucTe = ngayTraThucTe;
    }

    public BigDecimal getPhiPhat() {
        return phiPhat;
    }

    public void setPhiPhat(BigDecimal phiPhat) {
        this.phiPhat = phiPhat;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
}
