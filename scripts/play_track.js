function run(argv){
  var app = Application("iTunes");

  if (argv.length > 0) {
    var persistentID = argv[0];
    var t = app.tracks().find(function (x) {
      return x.persistentID() == persistentID;
    });
    app.play(t);
  } else {
    app.play();
  }
}
