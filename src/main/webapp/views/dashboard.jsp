
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
                   <div class="task">
                       <h2>task name</h2>
                       <p>task description</p>
                   </div>
               </div>
               <div class="tasks">
                   <div class="title">
                       <h1>IN PROGRESS</h1>
                   </div>
                   <div class="task">
                       <h2>task name</h2>
                       <p>task description</p>
                   </div>
               </div>
               <div class="tasks">
                   <div class="title">
                       <h1>DONE</h1>
                   </div>
                   <div class="task">
                       <h2>task name</h2>
                       <p>task description</p>
                   </div>
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
                     <tr>
                         <td>chi id</td>
                         <td>chi name</td>
                         <td>chi type</td>
                         <td>chi state</td>
                         <td><button>RESERVE</button></td>
                     </tr>
                     <tr>
                         <td>chi id</td>
                         <td>chi name</td>
                         <td>chi type</td>
                         <td>chi state</td>
                         <td><button>RESERVE</button></td>
                     </tr>
                 </table>
               </div>
               <div class="reservations" id="reservations">
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
</script>
