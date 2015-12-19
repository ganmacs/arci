function run(argv, playMode) {
  var app = Application("iTunes");
  var pl = app.playlists().find(function(x){
    return x.name() == "ミュージック" || x.name() == "Music";
  });
  var tracks = app.search(pl, {for: argv[0]});

  if (playMode === true) {
    return tracks;
  } else {
    var t = tracks.map(function(track){
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
    return JSON.stringify(t);
  }
}
