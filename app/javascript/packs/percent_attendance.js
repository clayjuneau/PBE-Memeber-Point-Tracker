//This file will calculate the percent attendance using the events attended and total events.

document.addEventListener("DOMContentLoaded", function(event) {
    percentAttendance();
})

function percentAttendance(){
	var testEventsAttended = 10; 
	var testEventsTotal = 15; 
	//var i = current_user.eventsAttended / eventsTotal; replace this with the var i line below
	var i = testEventsAttended / testEventsTotal; 
	document.getElementById("percentAttendance").innerHTML = parseFloat(i*100).toFixed(2) + "%"; 
}