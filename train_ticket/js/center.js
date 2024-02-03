 
$(document).ready(function() {
        
        var email = localStorage.getItem("email");
      var password = localStorage.getItem("password");
      document.getElementById('welcome').innerHTML = "U've Login as "+email+ ", Welcome!";
      if (email == null || password == null) {
          window.location.href = "login.html";
          
      }
      
      else{
          var $changepass = $('#changepass');
          $changepass.click(function() {console.log('clck change');
              changepass(email,password);});
          var $deleteacc = $('#deleteacc');
          $deleteacc.click(function(){console.log('clck delete');deleteacc(email,password);});
          var $logout = $('#logout');
          $logout.click(function(){
              localStorage.removeItem('password');
              localStorage.removeItem('email');
              window.location.href = "home.html"
              });
          
          
          
          function changepass(email,password){
              console.log("changepass");
              var new_password = prompt("Enter new password.");

              if (new_password != null) {
                  

                  var password_rule = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

                  if(!password_rule.test(new_password)) {
                      alert("Invalid password! password should be at least 8 characters long and contains at least one number and one letter.");
                  }
                  else {
                      // 將資料組成JSON格式
                      var login_object = {
                          "email": email,
                          "password": password,
                          "new_password": new_password
                      };

                      // 將JSON格式轉換成字串
                      var login_string = JSON.stringify(login_object);


                      // 發出POST的AJAX請求
                      $.ajax({
                              type: "Put",
                              url: "api/user.do",
                              data: login_string,
                              crossDomain: true,
                              cache: false,
                              dataType: 'json',
                              timeout: 5000,
                              success: function (response) {
                                  
                                      alert(response.message); 
                                      window.location.href = "login.html";
                                  }
                              ,
                              error: function () {
                                  alert("Connection error!");
                              }
                       });
                  }
              }
              
          }
          
          function deleteacc(email,password){
              console.log("deleteacc");
              var confirm = prompt("Are you sure? Enter [yes] to confirm.");

              if (confirm == "yes") {
                  
                      
                  
                      var del_object = {
                          "email": email,
                          "password": password,
                      };


                      var del_string = JSON.stringify(del_object);


                      // 發出POST的AJAX請求
                      $.ajax({
                              type: "Delete",
                              url: "api/user.do",
                              data: del_string,
                              crossDomain: true,
                              cache: false,
                              dataType: 'json',
                              timeout: 5000,
                              success: function (response) {
                                  if (response.status == 200){
                                      console.log(response);
                                      alert(response.message); 
                                      localStorage.removeItem('password');
                                      localStorage.removeItem('email');
                                      window.location.href = "home.html";
                                  }
                                  else {
                                      alert(response.message); 
                                  }
                                  }
                              
                              ,
                              error: function () {
                                  alert("Connection error!");
                              }
                       });
                  }
              }
              
          }
          
          
          
      });