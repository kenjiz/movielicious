enum ListCategory {
  nowPlaying('now_playing'),
  popular('popular'),
  upcoming('upcoming'),
  topRated('top_rated');

  final String keyword;
  const ListCategory(this.keyword);
}
