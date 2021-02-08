import 'package:flutter/material.dart';
import 'package:scanshop/router.dart';

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class Scanshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      onGenerateRoute: generateRoute,
    );
  }
}
