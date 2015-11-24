app = Application("iTunes");
track = app.currentAirPlayDevices();
JSON.stringify({
  active: track.active(),
  available: track.available(),
  kind: track.kind(),
  networkAddress:track.networkAddress(),
  protected: track.protected(),
  selected: track.selected(),
  supportsAudio: track.supportsAudio(),
  supportsVideo: track.supportsVideo(),
  soundVolume: track.soundVolume()
});
