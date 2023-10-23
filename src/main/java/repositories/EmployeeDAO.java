package repositories;

import entities.Employee;
import jakarta.persistence.*;

public class EmployeeDAO {
    public void create(Employee employee) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(employee);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    public Employee findByEmail(String email){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        String q = "SELECT e FROM Employee e where e.email = :email";
        TypedQuery<Employee> query = em.createQuery(q, Employee.class);
        query.setParameter("email", email);
        try{
            return query.getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    public Employee findById(Integer id){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        String q = "SELECT e FROM Employee e where e.id = :id";
        TypedQuery<Employee> query = em.createQuery(q, Employee.class);
        query.setParameter("id", id);
        try{
            return query.getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }
}
