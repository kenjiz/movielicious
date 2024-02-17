import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/home/home.dart';
import 'package:movielicious/src/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'assets/.env');
  await DI.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      title: 'Movielicious',
      home: AppBlocProviders(
        child: const HomePage(),
      ).initialize,
    );
  }
}
