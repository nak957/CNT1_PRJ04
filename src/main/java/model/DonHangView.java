package model;

import java.util.Date;

public class DonHangView {
    private String loai; // "mua" hoặc "thue"
    private int maGiaoDich; // mã đơn hàng hoặc mã hợp đồng
    private Date ngayDat;
    private double tongTien;
    private String trangThai;

    public DonHangView() {}

    public DonHangView(String loai, int maGiaoDich, Date ngayDat, double tongTien, String trangThai) {
        this.loai = loai;
        this.maGiaoDich = maGiaoDich;
        this.ngayDat = ngayDat;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public int getMaGiaoDich() {
        return maGiaoDich;
    }

    public void setMaGiaoDich(int maGiaoDich) {
        this.maGiaoDich = maGiaoDich;
    }

    public Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}
