package entities;


import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Reservation {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "start_date")
    private Date start_date;

    @Column(name = "return_date")
    private Date return_date;

    @ManyToOne
    @JoinColumn(name = "employee")
    private Employee employee;

    @OneToOne
    @JoinColumn(name = "equipement")
    private  Equipment equipement;

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public Date getStart_date() {
        return start_date;
    }
    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }
    public Date getReturn_date() {return return_date;}
    public void setReturn_date(Date return_date) {
        this.return_date = return_date;
    }
    public Employee getEmployee() {
        return employee;
    }
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    public Equipment getEquipement() {
        return equipement;
    }
    public void setEquipement(Equipment equipment) {
        this.equipement = equipment;
    }
    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", start_date=" + start_date +
                ", return_date=" + return_date +
                ", employee=" + employee +
                ", equipement=" + equipement +
                '}';
    }
}
