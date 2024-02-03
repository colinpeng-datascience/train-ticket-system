
$(document).ready(function() {
    localStorage.removeItem('password');
    localStorage.removeItem('email');
    // 處理表單點擊事件
    var $register = $('#register');
    $register.click(function() {
        console.log('clck reg')
        register();
    });
    var $login = $('#login');
    $login.click(function(){
        login();
    });
    
    function login() {
        
        var email = $('#email').val();
        var password = $('#password').val();
        
        var email_rule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
        var password_rule = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        
        if (!email_rule.test(email)) {
            alert("Invalid Email !");
        }
        else if(!password_rule.test(password)) {
            alert("Invalid password! password should be at least 8 characters long and contains at least one number and one letter.");
        }
        else {
            // 將資料組成JSON格式
            var login_object = {
                "email": email,
                "password": password
            };

            // 將JSON格式轉換成字串
            var login_string = JSON.stringify(login_object);


            // 發出POST的AJAX請求
            $.ajax({
                    type: "Post",
                    url: "api/login.do",
                    data: login_string,
                    crossDomain: true,
                    cache: false,
                    dataType: 'json',
                    timeout: 5000,
                    success: function (response) {
                        if (response.uid == 0){
                            alert("login failed! Please check your input again."); 
                        }
                        else {
                            alert("login successful");

                            localStorage.setItem('password',password);
                            localStorage.setItem('email',email);
                            
                            window.location.href = "center.html";
                        }

                        }
                    ,
                    error: function () {
                        alert("Connection error!");
                    }
                });
        }
        
        
        
    }
    function register() {
        var email = $('#email').val();
        var password = $('#password').val();

        var email_rule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
        var password_rule = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

        if (!email_rule.test(email)) {
            alert("Invalid Email !");
        }
        else if(!password_rule.test(password)) {
            alert("Invalid password! password should be at least 8 characters long and contains at least one number and one letter.");
        }
        else {
            // 將資料組成JSON格式
            var data_object = {
                "email": email,
                "password": password
            };

            // 將JSON格式轉換成字串
            var data_string = JSON.stringify(data_object);
            console.log("req")

            // 發出POST的AJAX請求
            $.ajax({
                    type: "POST",
                    url: "api/user.do",
                    data: data_string,
                    crossDomain: true,
                    cache: false,
                    dataType: 'json',
                    timeout: 5000,
                    success: function (response) {
                            console.log(response)
                            console.log("res")
                            alert(response.message);
                        },
                    error: function () {
                        alert("Connection error!");
                    }
            });
        }
    }

});