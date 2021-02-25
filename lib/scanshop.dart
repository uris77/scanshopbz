import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/router.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop/theme.dart';
import 'package:sembast_dao/sembast_dao.dart';

/// The route observer
final RouteObserver<Route> routeObserver = RouteObserver<Route>();

/// The main Scanshop App
class Scanshop extends StatelessWidget {
  // final Dao productsDao = ProductsDao();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
              create: (_) => ProductsBloc(productsDao: ProductsDao())
                ..add(LoadProducts())),
          BlocProvider<StoresBloc>(create: (_) {
            return StoresBloc(storesDao: StoresDao())..add(LoadStores());
          })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: generateRoute,
        ));
  }
}
