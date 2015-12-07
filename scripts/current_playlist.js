var app = Application("iTunes");
var playlist = app.currentPlaylist();

JSON.stringify({
  class: playlist.class(),
  container: playlist.container(),
  id: playlist.id(),
  index: playlist.index(),
  name: playlist.name(),
  persistentID: playlist.persistentID(),
  properties: playlist.properties()
});
