import 'package:flutter/material.dart';

import '../pages/movie_listing_page.dart';
import '../../../../core/constants/theme_constants.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final searchFieldController = TextEditingController();

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  void _onSearch() {
    if (searchFieldController.text.isNotEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      final searchTerm = searchFieldController.text;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MovieListingPage(title: 'By Search: $searchTerm');
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        border: Border.all(
          color: const Color(0xFF39394e),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(kAppBorderRadius),
      ),
      child: TextField(
        controller: searchFieldController,
        onSubmitted: (_) => _onSearch(),
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: false,
          suffixIcon: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.search,
              color: Colors.white54,
            ),
            onPressed: _onSearch,
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
