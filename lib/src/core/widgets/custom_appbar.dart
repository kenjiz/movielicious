import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'MovieLicious',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
