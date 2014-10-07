//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

function get_tweet_id(source){
  return $(source).parent().parent().parent().attr('id')
}

$( document ).ready(function() {
$('.reply_box').hide();

  $(".reply").click(function(){
    $(this).parent().parent().children(".reply_box").toggle();
  });

  $(".retweet").click(function(){
    var json = {};
    json.user_id = gon.user_id;
    json.current_user_id = gon.current_user_id;
    var id = $(this).parent().children("#tweet_id").val();
    $.post("/tweet/"+id+"/retweet",json,function(data){
      console.log(data["message"]);
    });
  });
});
