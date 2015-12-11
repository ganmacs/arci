function run(argv){
  var app = Application("iTunes");
  if (argv.length > 0) {
    app.playerPosition = argv[0];
  }
}
