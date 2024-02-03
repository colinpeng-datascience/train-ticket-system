
  
var email = localStorage.getItem("email");
var password = localStorage.getItem("password");
load_my_tickets(email,password);

function payclicked(ticket_id){

    
      if (email == null || password == null) {
        alert("Please log in first.");
        window.location.href = "login.html";
      }
  
       else{
      
      
    var data_object = {
            "email": email,
            "password": password,
            "ticket_id" : ticket_id,
        };

    var data_string = JSON.stringify(data_object);
    
    console.log(data_object);
              
        $.ajax({
                type: "PUT",
                url: "api/ticket.do",
                crossDomain: true,
                data : data_string,
                cache: false,
                dataType: 'json',
                timeout: 5000,
                success: function (response) {
                    
                    alert(response.message);
                    location.reload();
                        
                    
                },
                error: function () {
                    
                      console.log(response);
                    console.log("ajax error");
                    alert("Connection error！");
                }
        });
       }
}
    
function delclicked(ticket_id){

    
      if (email == null || password == null) {
        alert("Please log in first.");
        window.location.href = "login.html";
      }
  
       else{
      
      
    var data_object = {
            "email": email,
            "password": password,
            "ticket_id" : ticket_id,
        };

    var data_string = JSON.stringify(data_object);
    
    console.log(data_object);
              
        $.ajax({
                type: "DELETE",
                url: "api/ticket.do",
                crossDomain: true,
                data : data_string,
                cache: false,
                dataType: 'json',
                timeout: 5000,
                success: function (response) {
                    
                    alert(response.message);
                    location.reload();
                        
                    
                },
                error: function () {
                    
                      console.log(response);
                    console.log("ajax error");
                    alert("Connection error！");
                }
        });
       }
}
    


function load_my_tickets(email,password){
    
      if (email == null || password == null) {
        alert("Please log in first.");
        window.location.href = "login.html";
      }
  
       else{
      
      
    var data_object = {
            "email": email,
            "password": password,
        };


    var data_string = JSON.stringify(data_object);
                  
            $.ajax({
                    type: "POST",
                    url: "api/myticket.do",
                    crossDomain: true,
                    data : data_string,
                    cache: false,
                    dataType: 'json',
                    timeout: 5000,
                    success: function (response) {
                        
                        if(response.status == 200){
                            console.log("search completed")
                            updateTable(response.response.data);
                        }

                    },
                    error: function () {
                        alert("Connection error！");
                    }
            });
        }
      
    
    function updateTable(data) {
        $("#table > tbody").empty();
        var table_html = '';
        $.each(data, function(index, value) {
            
            table_html += '<tr><td scope="row">' + value['ticket_id'] + '</td>';
            table_html += '<td>' + value['price'] + '</td>';
            table_html += '<td>' + value['date'] + '</td>';
            table_html += '<td>' + value['train_id'] + '</td>';
            table_html += '<td>' + value['seat_id'] + '</td>';
            table_html += '<td>' + value['departure'] + '</td>';
            table_html += '<td>' + value['arrival'] + '</td>';
            table_html += '<td>' + value['book_time'] + '</td>';
            
            if(value['pay_time']==null){
                  table_html += '<td>'+'<a href="javascript: payclicked(' + value['ticket_id']+ ');">Pay</a>|';
                  table_html += '<a href="javascript: delclicked(' + value['ticket_id']+ ');">Delete</a></td></tr>';
             }
            else{
                table_html += '<td>' + value['pay_time'] + '</td></tr>';
            }
                })

        $("#table > tbody").append(table_html);
    }
    }