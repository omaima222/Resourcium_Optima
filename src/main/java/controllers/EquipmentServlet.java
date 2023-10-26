package controllers;

import entities.Equipment;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import repositories.EquipmentDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "EquipmentServlet", value = "/Equipments")
public class EquipmentServlet extends HttpServlet {
    EquipmentDAO equipmentDAO = new EquipmentDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         List<Equipment> equipments = equipmentDAO.getAll();
         request.setAttribute("equipments", equipments);
         RequestDispatcher dispatcher = request.getRequestDispatcher("views/dashboard.jsp");
         dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
