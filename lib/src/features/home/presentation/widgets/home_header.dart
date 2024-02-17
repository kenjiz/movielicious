import 'package:flutter/material.dart';

import 'package:movielicious/src/core/core.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppWidgetPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Now Playing', style: Theme.of(context).textTheme.headlineLarge),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            child: const Icon(
              Icons.search_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
