// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-ui
//= require turbolinks
//= require_tree .



$(document).ready(function() {
  var span = $('.spans');
  span.css('color', '#FFBC42');
  setInterval(function() {
    span.animate({
      color: '#FFBC42'
    }, 2700).animate({
      color: '#D81159'
    }, 2700).animate({
      color: '#218380'
    }, 2700);
  }, 2000);

  $('a[data-toggle="tab"]').on('click.bs.tab', function(e) {
    activaTab('aaa');
  });

  $('.forgetpass-tab').on("click.bs.tab", function(e) {
    activaTab('ccc');
  });
});

function activaTab(tab) {
  $('.nav-tabs a[href="#' + tab + '"]').tab('show');
};


// function spancolors() {
//   var i = 0;
//   var span = $(".span");
//   var colors = ['#fff', '#aaa', '#faf'];
//   span.css('color', colors[i]);
//
//   window.setInterval(function() {
//     i = i == colors.length ? 0 : i;
//     span.animate({
//       color: colors[i]
//     }, 3000);
//     i++;
//   }, 30);
// }
