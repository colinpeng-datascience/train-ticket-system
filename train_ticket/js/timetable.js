
load_table();


function load_table(){


                  
            $.ajax({
                    type: "GET",
                    url: "api/search.do",

                    crossDomain: true,
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
            
            table_html += '<tr><td scope="row">' + value['train_id'] + '</td>';
            table_html += '<td>' + value['departure'] + '</td>';
            table_html += '<td>' + value['departure_time'] + '</td>';
            table_html += '<td>' + value['arrival_time'] + '</td>';
            table_html += '<td>' + value['off_date'] + '</td>';
            table_html += '<td>' + value['on_date'] + '</td></tr>'; })

        $("#table > tbody").append(table_html);
    }