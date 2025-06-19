package model;

import java.sql.Timestamp;

public class DanhMuc {
    private int maDanhMuc;
    private String ten;
    private String moTa;
    private Timestamp ngayTao;

    public DanhMuc() {
    }

    public DanhMuc(String ten, String moTa) {
        this.ten = ten;
        this.moTa = moTa;
    }

    public DanhMuc(int maDanhMuc, String ten, String moTa, Timestamp ngayTao) {
        this.maDanhMuc = maDanhMuc;
        this.ten = ten;
        this.moTa = moTa;
        this.ngayTao = ngayTao;
    }

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

    public Timestamp getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Timestamp ngayTao) {
        this.ngayTao = ngayTao;
    }
}
