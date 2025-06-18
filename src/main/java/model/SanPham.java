package model;

import java.sql.Timestamp;

public class SanPham {
    private int maSanPham;
    private String ten;
    private String moTa;
    private int maDanhMuc;
    private double giaThue;
    private double giaBan;
    private double tienCoc;
    private int soLuongTon;
    private String urlAnh;
    private String trangThai;
    private Timestamp ngayTao;

    // ✅ Constructor không tham số (bắt buộc cho JDBC)
    public SanPham() {}

    // ✅ Constructor có tham số (dùng trong Servlet)
    public SanPham(String ten, String moTa, int maDanhMuc, double giaThue, double giaBan,
                   double tienCoc, int soLuongTon, String urlAnh, String trangThai) {
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

    // ✅ Getter và Setter
    public int getMaSanPham() { return maSanPham; }
    public void setMaSanPham(int maSanPham) { this.maSanPham = maSanPham; }

    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }

    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }

    public int getMaDanhMuc() { return maDanhMuc; }
    public void setMaDanhMuc(int maDanhMuc) { this.maDanhMuc = maDanhMuc; }

    public double getGiaThue() { return giaThue; }
    public void setGiaThue(double giaThue) { this.giaThue = giaThue; }

    public double getGiaBan() { return giaBan; }
    public void setGiaBan(double giaBan) { this.giaBan = giaBan; }

    public double getTienCoc() { return tienCoc; }
    public void setTienCoc(double tienCoc) { this.tienCoc = tienCoc; }

    public int getSoLuongTon() { return soLuongTon; }
    public void setSoLuongTon(int soLuongTon) { this.soLuongTon = soLuongTon; }

    public String getUrlAnh() { return urlAnh; }
    public void setUrlAnh(String urlAnh) { this.urlAnh = urlAnh; }

    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }

    public Timestamp getNgayTao() { return ngayTao; }
    public void setNgayTao(Timestamp ngayTao) { this.ngayTao = ngayTao; }
}
