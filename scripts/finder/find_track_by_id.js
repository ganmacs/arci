function run(argv, playMode) {
  var app = Application("iTunes");

  var track =  app.tracks().find(function(x){
    return x.persistentID() == argv[0];
  });

  if (playMode == true) {
    return track;
  } else {
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
}
