function run(argv) {
  var app = Application("iTunes");
  var playlist =  app.playlists().find(function(x){
    return x.name() == argv[0];
  });

  return JSON.stringify({
    class: playlist.class(),
    container: playlist.container(),
    id: playlist.id(),
    index: playlist.index(),
    name: playlist.name(),
    persistentID: playlist.persistentID(),
    properties: playlist.properties()
  });
}
