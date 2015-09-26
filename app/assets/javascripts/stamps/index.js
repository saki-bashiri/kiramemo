$(window).on("load", function(){
  $(".stamps").wookmark({
    autoResize: true,
    container: $("#container"),
    offset: 5,
    outerOffset: 10,
    fillEmptySpace: true
  });
});
