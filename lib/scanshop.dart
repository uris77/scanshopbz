import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/router.dart';
import 'package:sembast_dao/sembast_dao.dart';

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class Scanshop extends StatelessWidget {
  // final Dao productsDao = ProductsDao();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
              create: (_) =>
                  ProductsBloc(productsDao: ProductsDao())..add(LoadProducts()))
        ],
        child: MaterialApp(
          navigatorObservers: [routeObserver],
          onGenerateRoute: generateRoute,
        ));
  }
}
