import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/products/screens/add_product_screen.dart';
import 'package:scanshop/products/screens/products.dart';
import 'package:scanshop/routes.dart';
import 'package:scanshop/screens/home.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop/stores/screens/add_store_screen.dart';
import 'package:scanshop/stores/screens/screens.dart';
import 'package:scanshop/stores/screens/stores_details.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';

/// generates the MaterialPageRoutes
Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
      settings: settings,
      builder: (context) => _buildRoutes(context, settings),
      maintainState: true);
}

Widget _buildRoutes(BuildContext context, RouteSettings settings) {
  var arguments = settings.arguments;
  switch (settings.name) {
    case AppRoutes.home:
      return Home();
    case AppRoutes.products:
      return Products();
    case AppRoutes.addProduct:
      return AddProductScreen(
          onSave: (product) {
            BlocProvider.of<ProductsBloc>(context).add(AddProduct(product));
          },
          isEditing: false);
    case AppRoutes.stores:
      return BlocProvider(
          create: (_) => StoresBloc(storesDao: StoresDao())..add(LoadStores()),
          child: StoresScreen());
    case AppRoutes.addStore:
      return BlocProvider(
          create: (_) => StoresBloc(storesDao: StoresDao()),
          child: AddStoreScreen());
    case AppRoutes.store:
      final map = arguments as Map<String, dynamic> ?? {};
      final store = map['store'] as Store;
      return BlocProvider(
          create: (_) => StoresBloc(storesDao: StoresDao()),
          child: StoreDetailsScreen(store: store));
    default:
      return Home();
  }
}
