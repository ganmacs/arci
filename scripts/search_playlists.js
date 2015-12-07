var app = Application("iTunes");
var playlists = app.playlists().find(function(pl) {
  return pl.name() == "オレンジ";
}).map(function(pl) {
  return {
    class: pl.class(),
    container: pl.container(),
    id: pl.id(),
    index: pl.index(),
    name: pl.name(),
    persistentID: pl.persistentID(),
    properties: pl.properties()
  };
});

JSON.stringify(playlists);
