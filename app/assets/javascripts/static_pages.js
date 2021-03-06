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

  $("#profile_edit_btn").click(function(){
    $(this).parent().hide();
    $(".edit_form").show();
  });
  $(".edit_form").hide();

  $("#meow_textarea").keyup(function (e) {
    if (e.keyCode == 13) {
      var json = {};
      json.user_id = gon.user_id;
      json.message = $(this).parent().children("textarea").val()
      $.post("tweet/new",json,function(data){
        location.reload();
      });
    }
  });

  $(".meow_btn").click(function(){
    var json = {};
    json.user_id = gon.user_id;
    json.message = $(this).parent().children("textarea").val()
    $.post("tweet/new",json,function(data){
      location.reload();
    });
  });
});
