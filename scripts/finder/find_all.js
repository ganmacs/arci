function run(argv) {
  var app = Application("iTunes");
  var tracks = app.tracks().filter(function (x) {
    return x.loved();
  }).map(function(track){
    return {
      class: track.class(),
      container: track.container(),
      id: track.id(),
      index: track.index(),
      name: track.name(),
      persistentID: track.persistentID(),
      properties: track.properties()
    };
  });
  return JSON.stringify(tracks);
}
