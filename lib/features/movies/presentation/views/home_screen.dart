import 'package:flutter/material.dart';
import 'dart:math' as math;

// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// constants
import '../../../../constants/constants.dart';

// Models
import '../../models/models.dart';
import '../widgets/rating_box.dart';

// Providers
import '../providers/providers.dart';

// Widgets
import '../widgets/circular_icon_button.dart';
import '../widgets/custom_sliver_appbar.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'home';

  late Size _size;
  late WidgetRef _ref;
  late BuildContext _context;

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _size = MediaQuery.of(context).size;
    _ref = ref;
    _context = context;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          _sliverSearchBar(),
          _sliverUpcomingMovieListWidget(),
          _sliverGenreListWidget(),
          ..._sliverTopMovieListWidget(),
        ],
      ),
    );
  }

  List<Widget> _sliverTopMovieListWidget() {
    final List<Movie> _movies =
        _ref.watch(movieDataControllerProvider).popularMovies;

    return [
      SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.only(
            left: kAppHorizontalMargin,
            right: kAppHorizontalMargin,
            bottom: 20,
          ),
          child: Text('Most Popular Movies', style: kTextStyleHeading4),
        ),
      ),
      if (_movies.isEmpty)
        const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      if (_movies.isNotEmpty)
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(ctx).pushNamed('movie-detail',
                        arguments: _movies[index].id);
                  },
                  child: MovieTile(
                    movie: _movies[index],
                  ),
                );
              },
              childCount: _movies.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: _size.width / 2,
                childAspectRatio: 1 / 1.5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
          ),
        ),
      if (_movies.isNotEmpty)
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: kAppVerticalMargin),
            child: CircularIconButton(
              onPressed: () {
                Navigator.of(_context).pushNamed(
                  'movie-listing',
                  arguments: MovieArgs(
                    category: MovieCategory.popular,
                  ),
                );
              },
            ),
          ),
        ),
    ];
  }

  Widget _sliverSearchBar() {
    final _searchBackground =
        _ref.watch(movieDataControllerProvider).posterImage;

    return CustomSliverAppBar(
      flexibleWidget: _searchFieldWidget(),
      posterImage: _searchBackground,
    );
  }

  Widget _sliverGenreListWidget() {
    return SliverToBoxAdapter(
      child: _ref.watch(genreProvider).when(
            data: ((_genres) => Container(
                  width: _size.width,
                  height: _size.height * 0.12,
                  margin: const EdgeInsets.only(bottom: kAppWidgetMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: kAppHorizontalMargin),
                        child: Text('Your Favorite Genres',
                            style: kTextStyleHeading4),
                      ),
                      const SizedBox(height: kAppTitleMargin),
                      Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: kAppHorizontalMargin),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: _genres.length,
                            itemBuilder: (ctx, idx) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(_context).pushNamed(
                                      'movie-listing',
                                      arguments: MovieArgs(
                                          category: MovieCategory.byTag,
                                          genre: _genres[idx]));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _genres[idx].color,
                                    borderRadius:
                                        BorderRadius.circular(kAppBorderRadius),
                                  ),
                                  child: Text(_genres[idx].name),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )),
            error: (e, st) => Center(
              child: Text(e.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ),
    );
  }

  Widget _sliverUpcomingMovieListWidget() {
    List<Movie> _movies = [];

    _movies = _ref.watch(movieDataControllerProvider).upcomingMovies;

    return SliverToBoxAdapter(
      child: _movies.isNotEmpty
          ? Container(
              width: _size.width,
              height: _size.height * 0.30,
              margin: const EdgeInsets.only(
                  top: kAppWidgetMargin, bottom: kAppWidgetMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: kAppHorizontalMargin),
                    child: Text('Upcoming Movies', style: kTextStyleHeading4),
                  ),
                  const SizedBox(height: kAppTitleMargin),
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0, 0.25, 0.5, 0.85, 1],
                          colors: <Color>[
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.transparent
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                            left: kAppHorizontalMargin, right: 40),
                        itemCount: _movies.length + 1,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return index < _movies.length
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.of(ctx).pushNamed('movie-detail',
                                        arguments: _movies[index].id);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: _size.width / 3,
                                    child: MovieTile(movie: _movies[index], withTitle: false,),
                                  ),
                                )
                              : CircularIconButton(
                                  onPressed: () {
                                    Navigator.of(_context).pushNamed(
                                      'movie-listing',
                                      arguments: MovieArgs(
                                        category: MovieCategory.upcoming,
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
    );
  }

  Widget _searchFieldWidget() {
    // Search Text Controller
    final TextEditingController _searchTextController = TextEditingController();

    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(
        left: 15,
        top: 10,
        right: 5,
        bottom: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF39394e), width: 1.0),
        borderRadius: BorderRadius.circular(kAppBorderRadius),
      ),
      child: TextField(
        controller: _searchTextController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            Navigator.of(_context).pushNamed(
              'movie-listing',
              arguments: MovieArgs(
                  category: MovieCategory.bySearch,
                  searchKey: _searchTextController.text),
            );
          }
        },
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: false,
          suffixIcon: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              if (_searchTextController.text.isNotEmpty) {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(_context).pushNamed(
                  'movie-listing',
                  arguments: MovieArgs(
                      category: MovieCategory.bySearch,
                      searchKey: _searchTextController.text),
                );
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white54,
            ),
          ),
          hintText: 'Search Movies...',
          hintStyle: kTextStyleBody2.copyWith(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
