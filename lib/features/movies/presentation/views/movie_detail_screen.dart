import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Widget
import '../widgets/widgets.dart';

// Models
import '../../models/models.dart';

// Providers
import '../providers/providers.dart';

// Constants
import '../../../../constants/constants.dart';

class MovieDetailScreen extends ConsumerWidget {
  const MovieDetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final int movieId;

  static const String routeName = 'movie-detail';

  static Route route(int movieId) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName, arguments: movieId),
        builder: (_) => MovieDetailScreen(movieId: movieId));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _size = MediaQuery.of(context).size;
    final AsyncValue<Movie> _movie =
        ref.watch(singleMovieDataProvider(movieId));

    final AsyncValue<List<Cast>> _casts =
        ref.watch(movieCastDataProvider(movieId));

    final AsyncValue<List<Review>> _reviews =
        ref.watch(movieReviewDataProvider(movieId));

    return Scaffold(
      body: _movie.when(
        data: (data) => CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              expandedHeight: _size.height * 0.8,
              imageFit: BoxFit.fitHeight,
              flexibleWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      data.title,
                      style: Theme.of(context).textTheme.headline3!.copyWith(height: 1.3),
                    ),
                  ),
                  RatingBox(rating: data.rating)
                ],
              ),
              posterImage: data.getMoviePoster,
              floating: false,
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      width: _size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: kAppHorizontalMargin),
                      margin: const EdgeInsets.only(bottom: kAppWidgetMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Overview',
                              style: Theme.of(context).textTheme.headline3),
                          const SizedBox(height: 10),
                          Text(data.overview,
                              style: kTextStyleBody2.copyWith(
                                  fontSize: 15,
                                  height: 1.5,
                                  color: Colors.white60)),
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: kAppHorizontalMargin),
                      margin: const EdgeInsets.only(bottom: kAppWidgetMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleWidget(title: 'Casts'),
                          const SizedBox(height: 10),
                          _casts.when(
                            data: (data) => IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: data
                                    .map((cast) => CastingBox(
                                          cast: cast,
                                          height: 70,
                                          width: _size.width / 6,
                                        ))
                                    .toList(),
                              ),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ),
                            error: (e, st) => const Center(
                              child: Text('The casts is not available yet.'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: kAppHorizontalMargin,
                  ),
                  child: const TitleWidget(title: 'Reviews')),
            ),
            _reviews.when(
              data: (data) => data.isEmpty
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: Text('There\'s no review yet on this movie.'),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => ReviewWidget(
                                content: data[index].content,
                                author: data[index].author,
                                dateTime: '',
                              ),
                          childCount: data.length),
                    ),
              loading: () => const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (_, __) => const SliverToBoxAdapter(
                child: Center(
                  child: Text('Cannot load reviews.'),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
        error: (err, st) => Center(child: Text(err.toString())),
        loading: () => const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
