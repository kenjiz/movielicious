import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:movielicious/src/features/genre/data/model/genre_model.dart';
import 'package:movielicious/src/features/movies/presentation/pages/movies_by_genres_page.dart';
import 'package:movielicious/src/injection_container.dart';

void main() {
  late GetIt sl;

  setUp(() {
    sl = InjectionContainer.sl;
  });

  tearDown(() {
    sl.reset();
  });

  const tGenre = GenreModel(id: 28, name: 'Action');

  testWidgets(
    'page should have an AppBar containing the title "Genre: {genre.name}."',
    (tester) async {
      const widget = MaterialApp(
        home: MoviesByGenresPage(genre: tGenre),
      );
      await tester.pumpWidget(widget);
      expect(find.text('Genre: Action'), findsOneWidget);
    },
  );

  testWidgets('should show CircularProgressIndicator at initial page load.', (tester) async {
    const widget = MaterialApp(
      home: MoviesByGenresPage(genre: tGenre),
    );
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
