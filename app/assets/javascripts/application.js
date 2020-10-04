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

function edit_image() {
  document.getElementById("edit-image-form").style.display = "block";
  document.getElementById("close-image-button").style.display = "block";
  document.getElementById("edit-image-button").style.display = "none";
}

function close_image() {
  document.getElementById("edit-image-form").style.display = "none";
  document.getElementById("close-image-button").style.display = "none";
  document.getElementById("edit-image-button").style.display = "block";
}

function edit_name() {
  document.getElementById("edit-name-form").style.display = "block";
  document.getElementById("close-name-button").style.display = "block";
  document.getElementById("edit-name-button").style.display = "none";
  document.getElementById("user-school-id").style.display = "none";
}

function close_name() {
  document.getElementById("edit-name-form").style.display = "none";
  document.getElementById("close-name-button").style.display = "none";
  document.getElementById("edit-name-button").style.display = "block";
  document.getElementById("user-school-id").style.display = "block";
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

function junior_regist() {
  document.getElementById("junior-regist-form").style.display = "block";
  document.getElementById("junior-regist-button").style.display = "none";
  document.getElementById("senior-regist-button").style.display = "none";
  document.getElementById("regist-close-button").style.display = "block";
  document.getElementById("status-step2").style.display = "block";
}

function senior_regist() {
  document.getElementById("senior-regist-form").style.display = "block";
  document.getElementById("senior-regist-button").style.display = "none";
  document.getElementById("junior-regist-button").style.display = "none";
  document.getElementById("regist-close-button").style.display = "block";
  document.getElementById("status-step2").style.display = "block";
}

function regist_close() {
  document.getElementById("senior-regist-form").style.display = "none";
  document.getElementById("junior-regist-form").style.display = "none";
  document.getElementById("senior-regist-button").style.display = "inline-block";
  document.getElementById("junior-regist-button").style.display = "inline-block";
  document.getElementById("regist-close-button").style.display = "none";
  document.getElementById("status-step1").style.display = "block";
  document.getElementById("status-step2").style.display = "none";
}