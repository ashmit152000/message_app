// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery_ujs
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(document).on('turbolinks:load', function() {

  $('.ui.dropdown').dropdown();

  $('.clickit').click(function(){
  	$('.ui.modal').modal('show');
  });

// var textFieldVal = $('input[name="getId"]').val();



  $('.ui.checkbox').checkbox();
 

});

$(document).ready(function(){

  var username;
  var password;

  $('.username').change(function(){
       username = $('.username').val();
  })

  $('.password').change(function(){
      password = $('.password').val();
  })
	


var credentials = {
	username: username,
	password: password
};

 $('.submit-signup').click(function(){
	
 	Rails.ajax({
 		url: "/signup",
  		type: "post",
  		data: "username=" + username + "&password=" + password,
  		success: function(data) {
  			
  		},
  		error: function(data) {
  			
  		}
 	});

  
 });
})





