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
//= require turbolinks
//= require fancybox
//= require bootstrap-sprockets
//= require_tree .


$(document).ready(function() {
  // ------------------------------------- fancybox2
  $("a.fancybox").fancybox();

  // -------------------------------------lang toggler
   var get = window.location.search,
      langContainer = $('.language_area'),
      rusToggler = $('#rus'),
      engToggler = $('#eng');

  console.log(get);

  langContainer.find('a').removeClass('active');

  if(get.indexOf('locale=ru') != -1){
    console.log(11);
    rusToggler.addClass('active'); 
  }else if(get.indexOf('locale=en') != -1){
    console.log(22);
    engToggler.addClass('active'); 
  }
});