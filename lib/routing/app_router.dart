import 'package:flutter/material.dart';

// Screens
import '../features/movies/models/models.dart';
import '../features/movies/presentation/views/views.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {

    switch(settings.name) {
      case 'home': return HomeScreen.route();
      case 'movie-listing': return MovieListScreen.route(settings.arguments as MovieArgs);
      case 'movie-detail': return MovieDetailScreen.route(settings.arguments as int);
      default:
        return ErrorScreen.route();
    }

  }
}