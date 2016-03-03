// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


"use strict";

$(document).ready(function () {
	console.log("goals loaded");
	$("#track_time").on("change", function(){
		if($("#track_time").prop("checked")){
			$("#time_allotted").removeClass("hidden");
		} else{
			$("#time_allotted").addClass("hidden");
		}
	})
	
});