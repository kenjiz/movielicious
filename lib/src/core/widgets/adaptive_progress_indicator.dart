import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? value;
  const AdaptiveProgressIndicator({
    super.key,
    this.color = Colors.white,
    this.value,
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
