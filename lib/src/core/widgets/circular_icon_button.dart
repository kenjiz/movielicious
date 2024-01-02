import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    this.icon = Icons.arrow_forward,
    this.text = 'View More',
    this.size = 100,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: Colors.white30,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
}
