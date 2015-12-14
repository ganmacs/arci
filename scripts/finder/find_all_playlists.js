function run(argv) {
  var app = Application("iTunes");
  var pls = app.playlists().map(function(playlist){
    return {
      class: playlist.class(),
      container: playlist.container(),
      id: playlist.id(),
      index: playlist.index(),
      name: playlist.name(),
      persistentID: playlist.persistentID(),
      properties: playlist.properties()
    };
  });
  return JSON.stringify(pls);
}
