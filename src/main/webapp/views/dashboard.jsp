<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="entities.*" %>
<%@ page import="services.ReservationService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body class="dashBody">

   <div class="sideBar">
       <div class="userSide">
           <div class="pfp"></div>
           <h3 class="username">${employee.userName}</h3>
       </div>
       <div class="menu">
           <button id="taskButton">My tasks</button>
           <button id="equiButton">Equipements</button>
           <button id="resButton" >Reservations</button>
       </div>
   </div>
   <div class="dashContent">
       <div class="bar" >
           <button>PROFILE</button>
           <button>LOGOUT</button>
       </div>
       <div class="content-wrap">
           <div class="header">
               <h1 id="headerTitle">My tasks</h1>
               <div id="searchBar" class="searchBar">
                   <form method="get" action="">
                       <input placeholder="search..." name="search" >
                       <button><img src="style/images/search.png"></button>
                   </form>
               </div>
           </div>
           <div class="content">
               <div class="tasks">
                   <div class="title">
                       <h1>TO DO</h1>
                   </div>
                   <%List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                       List<Task> todoTasks = (tasks==null)?null:tasks.stream().filter(x -> x.getStatus().equals(TaskStatus.TODO)).collect(Collectors.toList());
                       List<Task> inprogressTasks = (tasks==null)?null:tasks.stream().filter(x -> x.getStatus().equals(TaskStatus.INPROGRESS)).collect(Collectors.toList());
                       List<Task> doneTasks = (tasks==null)?null:tasks.stream().filter(x -> x.getStatus().equals(TaskStatus.DONE)).collect(Collectors.toList());
                     if(todoTasks == null){
                   %>
                       <div class="task">
                           <h2>No tasks ... </h2>
                       </div>
                   <% } else
                       for (Task task : todoTasks) {
                   %>
                   <div class="task">
                       <h2><%= task.getName() %></h2>
                       <p><%= task.getDescription() %></p>
                       <div class="priority" priority(<%=task.getPriority()%>, 0)></div>
                   </div>
                   <%}%>
               </div>
               <div class="tasks">
                   <div class="title">
                       <h1>IN PROGRESS</h1>
                   </div>
                   <%if(inprogressTasks == null){%>
                   <div class="task">
                       <h2>No tasks ... </h2>
                   </div>
                   <% } else
                       for (Task task : inprogressTasks) {
                   %>
                   <div class="task">
                       <h2><%= task.getName() %></h2>
                       <p><%= task.getDescription() %></p>
                       <div class="priority" priority(<%=task.getPriority()%>, 1)></div>
                   </div>
                   <%}%>
               </div>
               <div class="tasks">
                   <div class="title">
                       <h1>DONE</h1>
                   </div>
                   <%if(doneTasks == null){%>
                   <div class="task">
                       <h2>No tasks ... </h2>
                   </div>
                   <%}else
                       for (Task task : doneTasks){
                   %>
                   <div class="task">
                       <h2><%= task.getName() %></h2>
                       <p><%= task.getDescription() %></p>
                       <div class="priority" priority(<%=task.getPriority()%>, 2)  ></div>
                   </div>
                   <%}%>
               </div>
               <div class="equipements" id="equipements">
                 <table>
                     <tr class="tableHead">
                         <th>ID</th>
                         <th>NAME</th>
                         <th>TYPE</th>
                         <th>STATE</th>
                         <th></th>
                     </tr>
                     <%  List<Equipment> equipments = (List<Equipment>)  request.getAttribute("equipments");
                         if(equipments!=null){
                         for (Equipment equipment : equipments  ){
                     %>
                     <tr>
                         <td><%= equipment.getId() %></td>
                         <td><%= equipment.getName() %></td>
                         <td><%= equipment.getType() %></td>
                         <td><%= equipment.getState() %></td>
                         <% if(equipment.getState().equals(EquiState.AVAILABLE)){
                         %>
                           <td><button>RESERVE</button></td>
                         <%} else{%>
                         <td><%= equipment.getReservation().getReturn_date() %></td>
                     </tr>
                     <%}}}%>
                 </table>
               </div>
               <div class="reservations" id="reservations">
                   <table>
                       <tr class="tableHead">
                           <th>ID</th>
                           <th>RESERVED AT</th>
                           <th>RETURN AT</th>
                           <th>NAME</th>
                           <th>TYPE</th>
                           <th></th>
                       </tr>
                       <%  List<Reservation> reservations = (List<Reservation>)  request.getAttribute("reservations");
                           if(reservations!=null){
                               for (Reservation reservation : reservations  ){
                       %>
                       <tr>
                           <td><%= reservation.getId() %></td>
                           <td><%= reservation.getStart_date() %></td>
                           <td><%= reservation.getReturn_date() %></td>
                           <td><%= reservation.getEquipement().getName() %></td>
                           <td><%= reservation.getEquipement().getType() %></td>
                           <td><button>RETURN</button></td>
                       </tr>
                       <%}}%>
                   </table>

               </div>
           </div>
       </div>
   </div>
</body>
</html>
<script>
    taskButton = document.getElementById("taskButton");
    equiButton = document.getElementById("equiButton");
    resButton = document.getElementById("resButton");

    tasks = document.getElementsByClassName("tasks");
    equipements = document.getElementById("equipements");
    reservations = document.getElementById("reservations");
    searchBar = document.getElementById("searchBar");

    headerTitle = document.getElementById("headerTitle");

    taskButton.onclick = function (){
        resButton.classList.remove("hover");
        equiButton.classList.remove("hover");
        taskButton.classList.add("hover");
        equipements.style.display = 'none';
        reservations.style.display = 'none';
        searchBar.style.display = 'none';
        for (let i = 0; i < tasks.length ; i++) {
            tasks[i].style.display = 'flex';
        }
        headerTitle.innerText = "My tasks"
    }
    equiButton.onclick = function (){
        taskButton.classList.remove("hover");
        resButton.classList.remove("hover");
        equiButton.classList.add("hover");
        for (let i = 0; i < tasks.length ; i++) {
            tasks[i].style.display = 'none';
        }
        reservations.style.display = 'none';
        equipements.style.display = 'flex';
        searchBar.style.display = 'flex';
        headerTitle.innerText = "Equipements"
    }
    resButton.onclick = function (){
        equiButton.classList.remove("hover");
        taskButton.classList.remove("hover");
        resButton.classList.add("hover");
        for (let i = 0; i < tasks.length ; i++) {
            tasks[i].style.display = 'none';
        }
        equipements.style.display = 'none';
        reservations.style.display = 'flex';
        searchBar.style.display = 'flex';
        headerTitle.innerText = "Reservations"
    }

    function priority(taskPriority, index){
        let priorityCircle = document.getElementsByClassName("priority");
        if (taskPriority == "MAJOR") priorityCircle[index].style.backgroundColor = "#a1131b"
        else if (taskPriority == "MEDIUM") priorityCircle[index].style.backgroundColor = "#e89436"
        else if (taskPriority == "LOW") priorityCircle[index].style.backgroundColor = "#41a429"
    }

</script>
