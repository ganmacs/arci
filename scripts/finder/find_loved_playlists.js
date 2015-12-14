function run(argv) {
  var app = Application("iTunes");
  var playlists = app.playlists().filter(function(x){ return x.loved(); }).map(function(playlist){
    return {
      class: playlist.class(),
      container: playlist.container(),
      id: playlist.id(),
      index: playlist.index(),
      name: playlist.name(),
      persistentID: playlist.persistentID(),
      properties: playlist.properties()
    };
  });;

  return JSON.stringify(playlists);
}
