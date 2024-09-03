enum MovieCategory {
  nowPlaying('now_playing'),
  topRated('top_rated'),
  popular('popular'),
  upcoming('upcoming');

  final String meta;
  const MovieCategory(this.meta);
}
