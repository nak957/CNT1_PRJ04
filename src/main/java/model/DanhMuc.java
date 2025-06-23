package model;

import java.sql.Timestamp;

public class DanhMuc {
    private int maDanhMuc;
    private String ten;
    private String moTa;
    private String urlAnh;       
    private Timestamp ngayTao;

    // Constructors
    public DanhMuc() {
    }

    public DanhMuc(String ten, String moTa, String urlAnh) {
        this.ten = ten;
        this.moTa = moTa;
        this.urlAnh = urlAnh;
    }

    public DanhMuc(int maDanhMuc, String ten, String moTa, String urlAnh, Timestamp ngayTao) {
        this.maDanhMuc = maDanhMuc;
        this.ten = ten;
        this.moTa = moTa;
        this.urlAnh = urlAnh;
        this.ngayTao = ngayTao;
    }

    // Getters & Setters
    public int getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(int maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
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

    public String getUrlAnh() {
        return urlAnh;
    }

    public void setUrlAnh(String urlAnh) {
        this.urlAnh = urlAnh;
    }

    public Timestamp getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Timestamp ngayTao) {
        this.ngayTao = ngayTao;
    }
}
