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
//= require rails-ujs
//= require activestorage
// = require turbolinks
//= require_tree .

function edit_name() {
  document.getElementById("edit-name-form").style.display = "block";
  document.getElementById("close-name-button").style.display = "block";
  document.getElementById("edit-name-button").style.display = "none";
}

function close_name() {
  document.getElementById("edit-name-form").style.display = "none";
  document.getElementById("close-name-button").style.display = "none";
  document.getElementById("edit-name-button").style.display = "block";
}

function edit_profile() {
  document.getElementById("edit-profile-form").style.display = "block";
  document.getElementById("close-profile-button").style.display = "block";
  document.getElementById("edit-profile-button").style.display = "none";
  document.getElementById("user-profile").style.display = "none";
}

function close_profile() {
  document.getElementById("edit-profile-form").style.display = "none";
  document.getElementById("close-profile-button").style.display = "none";
  document.getElementById("edit-profile-button").style.display = "block";
  document.getElementById("user-profile").style.display = "block";
}