//This file will calculate the eligibility for membership based on 80% or above
document.addEventListener("DOMContentLoaded", function(event) {
    officerEligibility();
})


function officerEligibility(){
	var testEventsAttended = 10; 
	var testEventsTotal = 15; 
	var i = testEventsAttended / testEventsTotal;
	if(i >= 0.8){
		document.getElementById("officerEligibility").innerHTML = "You are eligible"; 
	}
	else{
		document.getElementById("officerEligibility").innerHTML = "You are not eligible";
	}
}