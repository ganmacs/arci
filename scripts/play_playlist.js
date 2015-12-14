function run(argv){
  var app = Application("iTunes");
  var t = app.playlists().find(function (x) {
    return x.persistentID() == argv[0];
  });
  app.play(t);
}
