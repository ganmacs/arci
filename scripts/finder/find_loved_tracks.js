function run(argv, playMode) {
  var app = Application("iTunes");

  if (playMode === true) {
    return app.tracks().filter(function(x){ return x.loved(); });
  } else {
    var tracks = app.tracks().filter(function(x){ return x.loved(); }).map(function(track){
      return {
        class: track.class(),
        container: track.container(),
        id: track.id(),
        index: track.index(),
        name: track.name(),
        persistentID: track.persistentID(),
        properties: track.properties()
      };
    });;

    return JSON.stringify(tracks);
  }
}
