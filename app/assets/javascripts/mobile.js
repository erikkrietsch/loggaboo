$(document).bind("mobileinit", function(){
  //apply overrides here
  $.mobile.defaultPageTransition = "slide";
  $.mobile.loader.prototype.options.text = "computing..."
  $.mobile.loader.prototype.options.textVisible = false;
});