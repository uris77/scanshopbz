import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/repositories/dbpath_generator.dart';
import 'package:scanshop/repositories/id_generator.dart';
import 'package:scanshop/router.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop/theme.dart';
import 'package:sembast_dao/sembast_dao.dart';

/// The route observer
final RouteObserver<Route> routeObserver = RouteObserver<Route>();

/// The main Scanshop App
class Scanshop extends StatelessWidget {
  /// Constructor
  Scanshop(
      {Key key, @required this.idGenerator, @required this.dbpathGenerator})
      : super(key: key);

  /// The unique id Generator
  final IdGenerator idGenerator;

  /// Generates the path where the database is stored.
  final DbpathGenerator dbpathGenerator;

  @override
  Widget build(BuildContext context) {
    final dbPath = dbpathGenerator.dbpath;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IdGenerator>(create: (_) => idGenerator),
        RepositoryProvider<DbpathGenerator>(create: (_) => dbpathGenerator)
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<ProductsBloc>(
                create: (_) =>
                    ProductsBloc(productsDao: ProductsDao(databaseFile: dbPath))
                      ..add(LoadProducts())),
            BlocProvider<StoresBloc>(create: (_) {
              return StoresBloc(storesDao: StoresDao(databaseFile: dbPath))
                ..add(LoadStores());
            })
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            navigatorObservers: [routeObserver],
            onGenerateRoute: generateRoute,
          )),
    );
  }
}
