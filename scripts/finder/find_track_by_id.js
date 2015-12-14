function run(argv) {
  var app = Application("iTunes");
  var track =  app.tracks().find(function(x){
    return x.persistentID() == argv[0];
  });

  return JSON.stringify({
    class: track.class(),
    container: track.container(),
    id: track.id(),
    index: track.index(),
    name: track.name(),
    persistentID: track.persistentID(),
    properties: track.properties()
  });
}
