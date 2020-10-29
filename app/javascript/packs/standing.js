//The purpose of this function is to calculate and display the member's standing

document.addEventListener("DOMContentLoaded", function(event) {
    standingCheck();
})

function standingCheck(){
    var testEventsAttended = 10; 
    var testEventsTotal = 15; 
    var i = testEventsAttended / testEventsTotal;
    var changingDiv = document.getElementById('standing');

    if(i >= 0.5){
        document.getElementById('standing').innerHTML = "You are currently in good standing!"; 
		document.getElementById('standing').style.color = "rgb(86,188,127)";
    }
    else{
        document.getElementById("standing").innerHTML = "You are not currently in good standing.";
		document.getElementById('standing').style.color = "rgb(188,86,50)";
    }
}