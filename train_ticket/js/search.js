var dtd = new Date();
var dn1 = new Date();
var dn2 = new Date();
var dn3 = new Date();
var dn4 = new Date();
var dn5 = new Date();
var dn6 = new Date();
var dn7 = new Date();
var dn8 = new Date();
var dn9 = new Date();
var dn10 = new Date();
var dn11 = new Date();
var dn12 = new Date();
var dn13 = new Date();

dn1.setDate(dn1.getDate() + 1);
dn2.setDate(dn2.getDate() + 2);
dn3.setDate(dn3.getDate() + 3);
dn4.setDate(dn4.getDate() + 4);
dn5.setDate(dn5.getDate() + 5);
dn6.setDate(dn6.getDate() + 6);
dn7.setDate(dn7.getDate() + 7);
dn8.setDate(dn8.getDate() + 8);
dn9.setDate(dn9.getDate() + 9);
dn10.setDate(dn10.getDate() + 10);
dn11.setDate(dn11.getDate() + 11);
dn12.setDate(dn12.getDate() + 12);
dn13.setDate(dn13.getDate() + 13);
    
var td = dtd.getFullYear()+'-'+(dtd.getMonth()+1)+'-'+dtd.getDate();
var n1 = dn1.getFullYear()+'-'+(dn1.getMonth()+1)+'-'+dn1.getDate();
var n2 = dn2.getFullYear()+'-'+(dn2.getMonth()+1)+'-'+dn2.getDate();
var n3 = dn3.getFullYear()+'-'+(dn3.getMonth()+1)+'-'+dn3.getDate();
var n4 = dn4.getFullYear()+'-'+(dn4.getMonth()+1)+'-'+dn4.getDate();
var n5 = dn5.getFullYear()+'-'+(dn5.getMonth()+1)+'-'+dn5.getDate();
var n6 = dn6.getFullYear()+'-'+(dn6.getMonth()+1)+'-'+dn6.getDate();
var n7 = dn7.getFullYear()+'-'+(dn7.getMonth()+1)+'-'+dn7.getDate();
var n8 = dn8.getFullYear()+'-'+(dn8.getMonth()+1)+'-'+dn8.getDate();
var n9 = dn9.getFullYear()+'-'+(dn9.getMonth()+1)+'-'+dn9.getDate();
var n10 = dn10.getFullYear()+'-'+(dn10.getMonth()+1)+'-'+dn10.getDate();
var n11 = dn11.getFullYear()+'-'+(dn11.getMonth()+1)+'-'+dn11.getDate();
var n12 = dn12.getFullYear()+'-'+(dn12.getMonth()+1)+'-'+dn12.getDate();
var n13 = dn13.getFullYear()+'-'+(dn13.getMonth()+1)+'-'+dn13.getDate();

var tag = document.createElement("p");
var text = document.createTextNode(td);
tag.appendChild(text);
var element = document.getElementById("td");
element.appendChild(tag);
    
var tag = document.createElement("p");
var text = document.createTextNode(n1);
tag.appendChild(text);
var element = document.getElementById("n1");
element.appendChild(tag);
   
var tag = document.createElement("p");
var text = document.createTextNode(n2);
tag.appendChild(text);
var element = document.getElementById("n2");
element.appendChild(tag);
    
var tag = document.createElement("p");
var text = document.createTextNode(n3);
tag.appendChild(text);
var element = document.getElementById("n3");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n4);
tag.appendChild(text);
var element = document.getElementById("n4");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n5);
tag.appendChild(text);
var element = document.getElementById("n5");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n6);
tag.appendChild(text);
var element = document.getElementById("n6");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n7);
tag.appendChild(text);
var element = document.getElementById("n7");
element.appendChild(tag);	   
    
    
var tag = document.createElement("p");
var text = document.createTextNode(n8);
tag.appendChild(text);
var element = document.getElementById("n8");
element.appendChild(tag);	   
    
    
var tag = document.createElement("p");
var text = document.createTextNode(n9);
tag.appendChild(text);
var element = document.getElementById("n9");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n10);
tag.appendChild(text);
var element = document.getElementById("n10");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n11);
tag.appendChild(text);
var element = document.getElementById("n11");
element.appendChild(tag);	   
    
var tag = document.createElement("p");
var text = document.createTextNode(n12);
tag.appendChild(text);
var element = document.getElementById("n12");
element.appendChild(tag);	   
 
var tag = document.createElement("p");
var text = document.createTextNode(n13);
tag.appendChild(text);
var element = document.getElementById("n13");
element.appendChild(tag);	 

var datetime = null;
var departure = null;
var arrival = null;
var dep = null;
var ari = null;
var date = null;
var time = null;

function orderclicked(train_id,seat_id){
    

    var email = localStorage.getItem("email");
      var password = localStorage.getItem("password");
    
      if (email == null || password == null) {
        alert("Please log in first.");
        window.location.href = "login.html";
      }
  
       else{
      
      
    var data_object = {
            "email": email,
            "password": password,
            "train_id" : train_id,
            "seat_id" : seat_id,
            "departure" : dep,
            "arrival" : ari,
            "date" : date
        };

    var data_string = JSON.stringify(data_object);
    
    console.log(data_object);
              
        $.ajax({
                type: "POST",
                url: "api/ticket.do",
                crossDomain: true,
                data : data_string,
                cache: false,
                dataType: 'json',
                timeout: 5000,
                success: function (response) {
                    
                    if(response.status == 200){
                        alert("Booking successful, please pay in three days.");
                    }
                    
                    else{
                        alert("Unknown error has occured.")
                        
                    }
                },
                error: function () {
                    
                      console.log(response);
                    console.log("ajax error");
                    alert("Connection error！");
                }
        });
       }
}

$(document).ready(function() {
    
    console.log("ready");


    
    var $ftp = $('#ftp');
    var $fty = $('#fty');
    var $fhc = $('#fhc');
    var $ftc = $('#ftc');
    var $fkh = $('#fkh');
    var $tp = $('#tp');
    var $ty = $('#ty');
    var $hc = $('#hc');
    var $tc = $('#tc');
    var $kh = $('#kh');
    var $td = $('#td');
    var $n1 = $('#n1');
    var $n2 = $('#n2');
    var $n3 = $('#n3');
    var $n4 = $('#n4');
    var $n5 = $('#n5');
    var $n6 = $('#n6');
    var $n7 = $('#n7');
    var $n8 = $('#n8');
    var $n9 = $('#n9');
    var $n10 = $('#n10');
    
    var $n11 = $('#n11');
    var $n12 = $('#n12');
    var $n13 = $('#n13');
    var $h5 = $('#h5');
    var $h6 = $('#h6');
    var $h7 = $('#h7');
    var $h8 = $('#h8');
    var $h9 = $('#h9');
    var $h10 = $('#h10');
    var $h11 = $('#h11');
    var $h12 = $('#h12');
    var $h13 = $('#h13');
    var $h14 = $('#h14');
    var $h15 = $('#h15');
    var $h16 = $('#h16');
    var $h17 = $('#h17');
    var $h18 = $('#h18');
    var $h19 = $('#h19');
    var $h20 = $('#h20');
    var $h21 = $('#h21');
    var $h22 = $('#h22');
    var $gobton = $('#gobton');

    $ftp.click(function() {setfrom("Taipei",1);});
    $fty.click(function() {setfrom("Taoyuan",2);});
    $fhc.click(function() {setfrom("Hsinchu",3);});
    $ftc.click(function() {setfrom("Taichung",4);});
    $fkh.click(function() {setfrom("Kaohsiung",5);});
    $tp.click(function() {setto("Taipei",1);});
    $ty.click(function() {setto("Taoyuan",2);});
    $hc.click(function() {setto("Hsinchu",3);});
    $tc.click(function() {setto("Taichung",4);});
    $kh.click(function() {setto("Kaohsiung",5);});
    $td.click(function() {setdate(0);});
    $n1.click(function() {setdate(1);});
    $n2.click(function() {setdate(2);});
    $n3.click(function() {setdate(3);});
    $n4.click(function() {setdate(4);});
    $n5.click(function() {setdate(5);});
    $n6.click(function() {setdate(6);});
    $n7.click(function() {setdate(7);});
    $n8.click(function() {setdate(8);});
    $n9.click(function() {setdate(9);});
    $n10.click(function() {setdate(10);});
    $n11.click(function() {setdate(11);});
    $n12.click(function() {setdate(12);});
    $n13.click(function() {setdate(13);});
    
    $h5.click(function() {settime("05");});
    $h6.click(function() {settime("06");});
    $h7.click(function() {settime("07");});
    $h8.click(function() {settime("08");});
    $h9.click(function() {settime("09");});
    $h10.click(function() {settime("10");});
    $h11.click(function() {settime("11");});
    $h12.click(function() {settime("12");});
    $h13.click(function() {settime("13");});
    $h14.click(function() {settime("14");});
    $h15.click(function() {settime("15");});
    
    $h16.click(function() {settime("16");});
    $h17.click(function() {settime("17");});
    $h18.click(function() {settime("18");});
    $h19.click(function() {settime("19");});
    $h20.click(function() {settime("20");});
    $h21.click(function() {settime("21");});
    $h22.click(function() {settime("22");});
    $gobton.click(function(){gobton()});   	
    
    
    
    
    function setfrom(station,sid){
        console.log(sid);
        document.getElementById('fromspan').innerHTML = station;
        console.log(sid);
        dep = sid;
        
    }
    
    function setto(station,sid){
        document.getElementById('tospan').innerHTML = station;
        ari = sid;
    }
    
    function setdate(n){
         var today = new Date();
         today.setDate(today.getDate() + n);
         date = today.getFullYear()+'-'+"1"+'-'+today.getDate();
         document.getElementById('datespan').innerHTML = date;
    }
    
    function settime(hr){
        time = hr + ":00"
        document.getElementById('timespan').innerHTML = time;
    }
    
    function gobton(){
        
        
        console.log(datetime);
        var data_object = {
                "departure": dep,
                "arrival": ari,
                "date" : date,
                "time" : time
            };

        var data_string = JSON.stringify(data_object);
                  
            $.ajax({
                    type: "POST",
                    url: "api/search.do",
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
                        console.log(response);
                    },
                    error: function () {
                        console.log("ajax error")
                        alert("Connection error！");
                    }
            });
        }
    
    function updateTable(data) {
        $("#table > tbody").empty();
        var table_html = '';
        $.each(data, function(index, value) {
            table_html += '<tr><td scope="row">' + value['train_id'] + '</td>';
            table_html += '<td>' + value['seat_id'] + '</td>';
            table_html += '<td>' + value['departure_time'] + '</td>';
            table_html += '<td>' + value['arrival_time'] + '</td>';
            table_html += '<td>' + value['price'] + '</td>';
            table_html += '<td>'+'<a href="javascript: orderclicked(' + value['train_id']+ ",'" + value['seat_id'] +"'"+');">Order</a></td></tr>';
        })

        $("#table > tbody").append(table_html);
    }
    
    

      



    });