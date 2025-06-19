package controller;

import dao.DanhMucDAO;
import model.DanhMuc;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DanhMucServlet")
public class DanhMucServlet extends HttpServlet {
    private DanhMucDAO danhMucDAO;

    @Override
    public void init() {
        danhMucDAO = new DanhMucDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            String ten = request.getParameter("ten");
            String moTa = request.getParameter("moTa");
            DanhMuc dm = new DanhMuc(ten, moTa);
            danhMucDAO.insert(dm);
            response.sendRedirect("admin/index_admin.jsp");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("maDanhMuc"));
            String ten = request.getParameter("ten");
            String moTa = request.getParameter("moTa");
            DanhMuc dm = new DanhMuc();
            dm.setMaDanhMuc(id);
            dm.setTen(ten);
            dm.setMoTa(moTa);
            danhMucDAO.update(dm);
            response.sendRedirect("admin/index_admin.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            danhMucDAO.delete(id);
            response.sendRedirect("admin/index_admin.jsp");
        }
    }
}
