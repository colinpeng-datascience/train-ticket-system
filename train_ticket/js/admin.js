$(document).ready(function() {

    var $sub = $('#sub');
    $sub.click(function() {
        sub();
    });
    var $can = $('#can');
    $can.click(function(){
        window.location.href = "home.html";
    });
    
    function sub() {
        
        var old_id = $('#old_id').val();
        var old_off = $('#old_off').val();
        var new_time = $('#new_time').val();
        var new_dep = $('#new_dep').val();
        var new_ari = $('#new_ari').val();
        var new_on = $('#new_on').val();
        
        

            var login_object = {
                "train_id": old_id,
                "off_date": old_off,
                "departure_time": new_time,
                "departure_station": new_dep,
                "arrival_station": new_ari,
                "on_date": new_on
                
                
            };


            var login_string = JSON.stringify(login_object);


            $.ajax({
                    type: "Post",
                    url: "api/admin.do",
                    data: login_string,
                    crossDomain: true,
                    cache: false,
                    dataType: 'json',
                    timeout: 5000,
                    success: function (response) {
                            alert(response.message); 
                            window.location.href = "timetable.html";
                        }

                    ,
                    error: function () {
                        alert("Connection error!");
                    }
                });
        }
        
        
        
    
    

});