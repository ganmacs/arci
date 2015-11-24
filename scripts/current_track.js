var app = Application("iTunes");
var track = app.currentTrack();

JSON.stringify({
  class: track.class(),
  container: track.container(),
  id: track.id(),
  index: track.index(),
  name: track.name(),
  persistentID: track.persistentID(),
  properties: track.properties()
});
