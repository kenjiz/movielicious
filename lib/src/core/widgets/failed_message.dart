import 'package:flutter/material.dart';

class FailedMessage extends StatelessWidget {
  final String message;
  const FailedMessage({
    super.key,
    this.message = 'Something went wrong.',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
      ),
    );
  }
}
