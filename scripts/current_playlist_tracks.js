app = Application("iTunes");
tracks_in_playlist = app.currentPlaylist().tracks().map(function(track){
  var tmp = {
    class: track.class(),
    container: track.container(),
    id: track.id(),
    index: track.index(),
    name: track.name(),
    persistentID: track.persistentID(),
    properties: track.properties()
  };
  return tmp;
});
JSON.stringify(tracks_in_playlist);
