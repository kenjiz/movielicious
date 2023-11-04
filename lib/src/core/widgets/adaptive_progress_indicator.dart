import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  final Color? color;
  const AdaptiveProgressIndicator({
    super.key,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color,
      ),
    );
  }
}
