function run(argv){
  var app = Application("iTunes");
  app.soundVolume = app.soundVolume() - (argv[0] * 1);
  return app.soundVolume();
}
