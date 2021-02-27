import 'package:flutter/material.dart';

/// The AppBar title widget
class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Scanshopbz',
        style: Theme.of(context).appBarTheme.textTheme.headline2);
  }
}
