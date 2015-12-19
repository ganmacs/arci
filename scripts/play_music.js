function run(argv) {
  var app = Application("iTunes");
  var ret = loadAndEval(argv);
  var pl = createPlayList(app, "_aric_tmp");

  ret.forEach(function (x) {
    x.duplicate({to: pl});
  });

  app.play(pl);
}

function createPlayList(app, name) {
  var pl = app.playlists().find(function (x) { return x.name() === name; });
  console.log(pl);

  if (pl) {
    pl.delete();                // to overwrite
  }

  pl = new app.Playlist;
  pl.make();
  pl.name = name;
  return pl;
}

function loadAndEval(argv) {
  ObjC.import('Foundation');

  var path = 'scripts/finder/' +  argv[0] + '.js';
  var fm = $.NSFileManager.defaultManager;
  var contents = fm.contentsAtPath(path.toString());
  contents = $.NSString.alloc.initWithDataEncoding(contents, $.NSUTF8StringEncoding);

  eval(ObjC.unwrap(contents));
  return run([argv[1]], true);
}
