// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require websocket_rails/main

$(function() {
  var dispatcher = new WebSocketRails('localhost:3000/websocket');

  dispatcher.on_open = function(data) {
    console.log('Connection has been established: ', data);
    dispatcher.trigger('subscribe_tweets');
  }

  channel = dispatcher.subscribe('tweets');
  channel.bind('new_tweet', function(tweet) {
    $('#tweet-space').append(tweet.message);
  });
});
