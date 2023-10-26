package controllers;

import entities.Task;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.xml.ws.Dispatch;
import org.hibernate.Session;
import repositories.TaskDao;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TaskServlet", value = "/Tasks")
public class TaskServlet extends HttpServlet {

    public TaskDao taskDao = new TaskDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Task> tasks = taskDao.getAllByEmployee((Long) session.getAttribute("userId"));
        request.setAttribute("tasks", tasks);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/dashboard.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
