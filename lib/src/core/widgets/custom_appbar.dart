import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actionButtons;

  const CustomAppBar({
    super.key,
    this.title,
    this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? 'MovieLicious',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: actionButtons,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
