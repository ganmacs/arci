function run(argv) {
  var app = Application("iTunes");
  var plName = argv[0];
  var pl = app.playlist[plName];

  if (!pl) {
    pl = new app.Playlist;
    pl.make();
    pl.name = plName;
  }

  argv.shift();
  argv.forEach(function(id) {
    var v = app.tracks().find(function(x){
      return x.persistentID() == id;
    });

    if (v) {
      v.duplicate({to: pl});
    }
  });
}
