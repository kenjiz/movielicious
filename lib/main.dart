import 'package:flutter/material.dart';

// Packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Routes
import './routing/app_router.dart';

// Themes
import './theme/themes.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MovieLiciousApp(),
    ),
  );
}

class MovieLiciousApp extends StatelessWidget {
  const MovieLiciousApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieLicious',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: 'home',
    );
  }
}
