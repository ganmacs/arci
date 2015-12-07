var app = Application("iTunes");
var playlists = app.playlists().find(function(pl) {
  return pl.name() == "オレンジ";
})[0];

JSON.stringify({
  class: pl.class(),
  container: pl.container(),
  id: pl.id(),
  index: pl.index(),
  name: pl.name(),
  persistentID: pl.persistentID(),
  properties: pl.properties()
});
