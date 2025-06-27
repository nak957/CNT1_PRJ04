package controller;

import dao.DanhMucDAO;
import model.DanhMuc;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/DanhMucServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class DanhMucServlet extends HttpServlet {
    private DanhMucDAO danhMucDAO;

    @Override
    public void init() {
        danhMucDAO = new DanhMucDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        // ✅ Đường dẫn chính xác tới thư mục webapp/uploads
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        if ("insert".equals(action)) {
            String ten = request.getParameter("ten");
            String moTa = request.getParameter("moTa");
            Part filePart = request.getPart("urlAnh");
            String fileName = new File(filePart.getSubmittedFileName()).getName();
            String filePath = "uploads/" + fileName;

            if (fileName != null && !fileName.isEmpty()) {
                filePart.write(uploadPath + File.separator + fileName);
            }

            DanhMuc dm = new DanhMuc();
            dm.setTen(ten);
            dm.setMoTa(moTa);
            dm.setUrlAnh(filePath);

            danhMucDAO.insert(dm);
            response.sendRedirect("admin/Qlydanhmuc.jsp");

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("maDanhMuc"));
            String ten = request.getParameter("ten");
            String moTa = request.getParameter("moTa");
            Part filePart = request.getPart("urlAnh");
            String fileName = new File(filePart.getSubmittedFileName()).getName();

            DanhMuc dm = new DanhMuc();
            dm.setMaDanhMuc(id);
            dm.setTen(ten);
            dm.setMoTa(moTa);

            if (fileName != null && !fileName.isEmpty()) {
                String filePath = "uploads/" + fileName;
                filePart.write(uploadPath + File.separator + fileName);
                dm.setUrlAnh(filePath);
            }

            danhMucDAO.update(dm);
            response.sendRedirect("admin/Qlydanhmuc.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            danhMucDAO.delete(id);
            response.sendRedirect("admin/Qlydanhmuc.jsp");
        }
    }
}
