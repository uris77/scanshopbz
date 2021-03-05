import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/prices/bloc/prices_bloc.dart';
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
class Scanshop extends StatefulWidget {
  /// Constructor
  Scanshop(
      {Key key, @required this.idGenerator, @required this.dbpathGenerator})
      : super(key: key);

  /// The unique id Generator
  final IdGenerator idGenerator;

  /// Generates the path where the database is stored.
  final DbpathGenerator dbpathGenerator;

  @override
  _ScanshopState createState() => _ScanshopState();
}

class _ScanshopState extends State<Scanshop> {
  String dbPath;
  ProductsBloc productsBloc;
  StoresBloc storesBloc;
  PricesBloc pricesBloc;

  @override
  void initState() {
    dbPath = widget.dbpathGenerator.dbpath;
    productsBloc = ProductsBloc(productsDao: ProductsDao(databaseFile: dbPath));
    storesBloc = StoresBloc(storesDao: StoresDao(databaseFile: dbPath));
    pricesBloc = PricesBloc(pricesDao: PricesDao(databaseFile: dbPath));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IdGenerator>(create: (_) => widget.idGenerator),
        RepositoryProvider<DbpathGenerator>(
            create: (_) => widget.dbpathGenerator)
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: productsBloc),
            BlocProvider.value(value: storesBloc),
            BlocProvider.value(value: pricesBloc),
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

  @override
  void dispose() {
    storesBloc.close();
    productsBloc.close();
    super.dispose();
  }
}
