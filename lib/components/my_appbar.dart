import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  bool showArrow = false;

  CustomAppBar(this.showArrow, {Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: showArrow == true
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            )
          : null,
      title: const Text('Todo List'),
    );
  }
}
