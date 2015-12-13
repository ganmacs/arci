function run(argv){
  var app = Application("iTunes");
  app.soundVolume = app.soundVolume() + (argv[0] * 1);
  console.log(app.soundVolume());
  return app.soundVolume();
}
