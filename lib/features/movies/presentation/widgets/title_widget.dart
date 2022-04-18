import 'package:flutter/material.dart';

// Constants
import '../../../../constants/constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline3),
    );
  }
}
