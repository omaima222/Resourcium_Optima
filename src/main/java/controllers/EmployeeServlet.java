package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import services.EmployeeService;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", value = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

    public EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(employeeService.checkIfLogged(request.getSession())) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
            dispatcher.forward(request, response);
        }
        else{
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/dashboard.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        if(username == null) {
            if(employeeService.login(email, password, request.getSession())){
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/dashboard.jsp");
                dispatcher.forward(request, response);
            }else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
                dispatcher.forward(request, response);
            }
        }
        else employeeService.signup(username, email, password);
    }
}
