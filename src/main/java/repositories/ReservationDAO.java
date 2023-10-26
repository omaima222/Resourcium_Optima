package repositories;

import entities.Employee;
import entities.EquiType;
import entities.Equipment;
import entities.Reservation;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class ReservationDAO {
    public List<Reservation> getAllByEmployee(Long id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        String q = "SELECT e from Reservation e where e.employee.id = :id";
        TypedQuery<Reservation> query = em.createQuery(q, Reservation.class);
        query.setParameter("id", id);
        List<Reservation> reservations = query.getResultList();
        try{
            return reservations;
        }catch (NoResultException e){
            return null;
        }
    }
}
