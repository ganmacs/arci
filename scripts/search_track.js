var app = Application("iTunes");
var track = app.playlists().find(function(x) { return x.name() == "オレンジ"; });

JSON.stringify({
  class: track.class(),
  container: track.container(),
  id: track.id(),
  index: track.index(),
  name: track.name(),
  persistentID: track.persistentID(),
  properties: track.properties()
});
