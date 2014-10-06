//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

function get_tweet_id(source){
  return $(source).parent().parent().parent().attr('id')
}

$( document ).ready(function() {
$('.reply_box').hide();

  $(".reply").click(function(){

    var x = $(this).parent().parent().children(".reply_box");
    console.log(x);
    if(x === []){
      $(this).parent().parent().children(".reply_box").hide();
    }else{
      $(this).parent().parent().children(".reply_box").show();
    }
  });

  $(".retweet").click(function(){
    console.log(get_tweet_id(this));
    var url = 'retweet/' + Username + '/';
    var form = $('<form action="' + url + '" method="post">' +
      '<input type="text" name="api_url" value="' + Return_URL + '" />' +
      '</form>');
  });
});
