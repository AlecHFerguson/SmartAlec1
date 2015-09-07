
$(function() {

  function initialize() {
    var usa = new google.maps.LatLng(41.198206, -95.357383);
    var mapOptions = {
      zoom: 4.97,
      center: usa,
      position: usa,
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  }

  function addMarker(location) {
    var marker = new google.maps.Marker({
      position: location,
      map: map
    });
    // markers.push(marker);
  }

  var dispatcher = new WebSocketRails('localhost:3000/websocket');

  dispatcher.on_open = function(data) {
    dispatcher.trigger('subscribe_tweets');
  }

  channel = dispatcher.subscribe('tweets');
  channel.bind('new_tweet', function(tweet) {
    addMarker(tweet.lat, tweet.long);
  });

  google.maps.event.addDomListener(window, 'load', initialize);
});
