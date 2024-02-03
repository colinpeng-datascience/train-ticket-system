
$(document).ready(function() {

    email = localStorage.getItem("email");
    password = localStorage.getItem("password");
    
    if (email == null || password == null) {
        document.getElementById('login_btn').innerHTML = "Login";
        document.getElementById('login_btn').href = "login.html";
    }
    
    else{
        document.getElementById('login_btn').innerHTML = "Account Center";
        document.getElementById('login_btn').href = "center.html";
    }

    
});