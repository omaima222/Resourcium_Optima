package services;

import entities.Employee;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import repositories.EmployeeDAO;

public class EmployeeService {

    public EmployeeDAO  employeeDAO = new EmployeeDAO();
    public void signup(String username, String email, String password ){
        Employee employee = new Employee();
        employee.setUserName(username);
        employee.setEmail(email);
        employee.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
        employeeDAO.create(employee);
    }

    public Boolean login(String email, String password, HttpSession session){
        Employee employee = employeeDAO.findByEmail(email);
        if(employee==null){
            session.setAttribute("error","⚠ incorrect email !");
        }
        else{
            if (BCrypt.checkpw(password, employee.getPassword())) {
                session.setAttribute("userId", employee.getId());
                System.out.println(session.getAttribute("userId"));
                return true;
            } else {
                session.setAttribute("error", "⚠ incorrect password !");
                session.setAttribute("email", email);
            };
        }
        return false;
    }

    public Boolean checkIfLogged(HttpSession session){
        return session.getAttribute("userId")==null?false:true;
    }

}
