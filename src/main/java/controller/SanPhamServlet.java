package controller;

import dao.SanPhamDAO;
import dao.DanhMucDAO;
import model.SanPham;
import model.DanhMuc;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/SanPhamServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
public class SanPhamServlet extends HttpServlet {
    private SanPhamDAO sanPhamDAO;
    private DanhMucDAO danhMucDAO;

    @Override
    public void init() {
        sanPhamDAO = new SanPhamDAO();
        danhMucDAO = new DanhMucDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            listSanPham(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            SanPham sanPham = sanPhamDAO.getById(id);
            request.setAttribute("sanPhamChinhSua", sanPham);
            listSanPham(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            sanPhamDAO.delete(id);
            response.sendRedirect(request.getContextPath() + "/admin/Qlysanpham.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        Part filePart = request.getPart("fileAnh");
        String fileName = getFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + "uploads";
        java.io.File uploadDir = new java.io.File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String urlAnh = null;
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = uploadPath + java.io.File.separator + fileName;
            filePart.write(filePath);
            urlAnh = "uploads/" + fileName;
        }

        if ("insert".equals(action)) {
            SanPham sp = extractSanPhamFromRequest(request, urlAnh);
            sanPhamDAO.insert(sp);
            response.sendRedirect(request.getContextPath() + "/admin/index_admin.jsp");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("maSanPham"));
            SanPham existing = sanPhamDAO.getById(id);
            if (urlAnh == null) urlAnh = existing.getUrlAnh();
            SanPham sp = extractSanPhamFromRequest(request, urlAnh);
            sp.setMaSanPham(id);
            sanPhamDAO.update(sp);
            response.sendRedirect(request.getContextPath() + "/admin/index_admin.jsp");
        }
    }

    private void listSanPham(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<SanPham> danhSachSanPham = sanPhamDAO.getAll();
        List<DanhMuc> danhSachDanhMuc = danhMucDAO.getAll();
        request.setAttribute("danhSachSanPham", danhSachSanPham);
        request.setAttribute("danhSachDanhMuc", danhSachDanhMuc);
        request.getRequestDispatcher("admin/Qlysanpham.jsp").forward(request, response);
    }

    private SanPham extractSanPhamFromRequest(HttpServletRequest request, String urlAnh) {
        String ten = request.getParameter("ten");
        String moTa = request.getParameter("moTa");
        int maDanhMuc = Integer.parseInt(request.getParameter("maDanhMuc"));
        BigDecimal giaThue = new BigDecimal(request.getParameter("giaThue"));
        BigDecimal giaBan = new BigDecimal(request.getParameter("giaBan"));
        BigDecimal tienCoc = new BigDecimal(request.getParameter("tienCoc"));
        int soLuongTon = Integer.parseInt(request.getParameter("soLuongTon"));
        String trangThai = "co_san";

        return new SanPham(0, ten, moTa, maDanhMuc, giaThue, giaBan, tienCoc, soLuongTon, urlAnh, trangThai);
    }

    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
