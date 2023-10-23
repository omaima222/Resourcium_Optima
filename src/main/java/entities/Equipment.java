package entities;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Equipment {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private EquiType type;

    @Column(name = "state")
    private EquiState state;

    @Column(name = "buying_date")
    private Date buyingDate;

    @Column(name = "maint_date")
    private Date maintDate;

    @OneToOne( mappedBy = "equipement")
    private Reservation reservation;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public EquiType getType() {
        return type;
    }

    public void setType(EquiType type) {
        this.type = type;
    }

    public EquiState getState() {
        return state;
    }

    public void setState(EquiState state) {
        this.state = state;
    }

    public Date getBuyingDate() {
        return buyingDate;
    }

    public void setBuyingDate(Date buyingDate) {
        this.buyingDate = buyingDate;
    }

    public Date getMaintDate() {
        return maintDate;
    }

    public void setMaintDate(Date maintDate) {
        this.maintDate = maintDate;
    }

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }
}
