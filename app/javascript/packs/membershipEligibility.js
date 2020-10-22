//This file will calculate the eligibility for membership based on 50% or above
document.addEventListener("DOMContentLoaded", function(event) {
    membershipEligibility();
})


function membershipEligibility(){
	var testEventsAttended = 10; 
	var testEventsTotal = 15; 
	var i = testEventsAttended / testEventsTotal;
	if(i >= 0.5){
		document.getElementById("membershipEligibility").innerHTML = "You are eligible"; 
	}
	else{
		document.getElementById("membershipEligibility").innerHTML = "You are not eligible";
	}
}