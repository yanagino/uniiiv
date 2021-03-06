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

function edit_email() {
  document.getElementById("email-notice-form").style.display = "block";
  document.getElementById("close-email-button").style.display = "block";
  document.getElementById("edit-email-button").style.display = "none";
  document.getElementById("email-notice").style.display = "none";
}

function close_email() {
  document.getElementById("email-notice-form").style.display = "none";
  document.getElementById("close-email-button").style.display = "none";
  document.getElementById("edit-email-button").style.display = "block";
  document.getElementById("email-notice").style.display = "block";
}

function full_modal() {
  document.getElementById("full-modal").animate({
    opacity: [0, 1]
  }, 300);
  document.getElementById("full-modal").style.display = "block";
  document.getElementById("full-modal").style.position = "fixed";
  document.getElementById("full-modal").style.width = "100%";
  document.getElementById("full-modal").style.height = "100%";
  document.getElementById("full-modal").style.zIndex = "800";
  document.getElementById("full-modal").style.backgroundColor = "white";
  document.getElementById("header").style.backgroundColor = "rgb(250, 250, 250)";
  document.getElementById("full-modal-button").style.display = "none";
  document.getElementById("close-modal-button").style.display = "block";
}

function status_modal() {
  document.getElementById("status-modal").animate({
    opacity: [0, 1]
  }, 300);
  document.getElementById("status-modal").style.display = "block";
  document.getElementById("status-modal").style.position = "fixed";
  document.getElementById("status-modal").style.width = "100%";
  document.getElementById("status-modal").style.height = "100%";
  document.getElementById("status-modal").style.zIndex = "800";
  document.getElementById("status-modal").style.backgroundColor = "white";
  document.getElementById("header").style.backgroundColor = "rgb(250, 250, 250)";
  document.getElementById("status-modal-button").style.display = "none";
  document.getElementById("close-modal-button").style.display = "block";
}

function close_modal_full() {
  document.getElementById("full-modal").style.display = "none";
  document.getElementById("full-modal-button").style.display = "block";
  document.getElementById("close-modal-button").style.display = "none";
  document.getElementById("header").style.backgroundColor = "#fff8f0c7";
}

function close_modal_status() {
  document.getElementById("status-modal").style.display = "none";
  document.getElementById("status-modal-button").style.display = "block";
  document.getElementById("close-modal-button").style.display = "none";
  document.getElementById("header").style.backgroundColor = "#fff8f0c7";
}
