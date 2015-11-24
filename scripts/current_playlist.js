app = Application("iTunes");
playlist = app.currentPlaylist();
JSON.stringify({
  duration: playlist.duration(),
  name: playlist.name(),
  loved: playlist.loved(),
  // parent: playlist.parent(),
  shuffle: playlist.shuffle(),
  size: playlist.size(),
  songRepeat: playlist.songRepeat(),
  specialKind:playlist.specialKind(),
  time: playlist.time(),
  visible: playlist.visible()
});
