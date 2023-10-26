package repositories;

import entities.Employee;
import entities.EquiState;
import entities.Equipment;
import entities.Task;
import jakarta.persistence.*;

import java.util.List;

public class EquipmentDAO {
    public Equipment findById(Long id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        String q = "SELECT e FROM Equipment e where e.id = :id";
        TypedQuery<Equipment> query = em.createQuery(q, Equipment.class);
        query.setParameter("id", id);
        try{
            return query.getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }
    public List<Equipment> getAll() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        String q = "SELECT e from Equipment e ";
        TypedQuery<Equipment> query = em.createQuery(q, Equipment.class);
        List<Equipment> equipments = query.getResultList();
        try{
            return equipments;
        }catch (NoResultException e){
            return null;
        }
    }
}
