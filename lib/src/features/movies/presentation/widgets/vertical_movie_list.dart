import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movielicious/src/core/constants/theme_constants.dart';
import 'package:movielicious/src/features/movies/domain/models/movie.dart';
import 'package:movielicious/src/features/movies/presentation/bloc/base_movies_bloc.dart';
import 'package:movielicious/src/features/movies/presentation/widgets/movie_tile.dart';

class VerticalMovieList<B extends BaseMoviesBloc> extends StatefulWidget {
  const VerticalMovieList({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  State<VerticalMovieList<B>> createState() => _VerticalMovieListState<B>();
}

class _VerticalMovieListState<B extends BaseMoviesBloc> extends State<VerticalMovieList<B>> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<B>().fetchNext();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5 / 3,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => MovieTile(movie: widget.movies[index]),
        itemCount: widget.movies.length,
      ),
    );
  }
}
