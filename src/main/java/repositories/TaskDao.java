package repositories;

import entities.Employee;
import entities.Task;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

public class TaskDao {
    public List<Task> getAllByEmployee(Long id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        String q = "SELECT e FROM Task e where e.assigned_employee.id = :id";
        TypedQuery<Task> query = em.createQuery(q, Task.class);
        query.setParameter("id", id);
        List<Task> tasks = query.getResultList();
        tasks.stream().forEach(x-> System.out.println(x));
        try{
            return tasks;
        }catch (NoResultException e){
            return null;
        }
    }

}
