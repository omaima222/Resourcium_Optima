package entities;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Task{
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "limit_date")
    private Date limitDate;

    @Column(name = "priority")
    private String priority;

    @Column(name = "status")
    private String status;

    @ManyToOne
    @JoinColumn(name = "assigned_employee")
    private Employee assigned_employee;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getLimitDate() {
        return limitDate;
    }

    public void setLimitDate(Date limitDate) {
        this.limitDate = limitDate;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getAssignedEmployee() {
        return assigned_employee;
    }

    public void setAssignedEmployee(Employee assignedEmployee) {
        this.assigned_employee = assignedEmployee;
    }

}
