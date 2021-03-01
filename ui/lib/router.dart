import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/prices/bloc/prices_bloc.dart';
import 'package:scanshop/prices/screens/product_prices_screen.dart';
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

/// generates the MaterialPageRoutes
Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
      settings: settings,
      builder: (context) => _buildRoutes(context, settings),
      maintainState: true);
}

// ignore: missing_return
Widget _buildRoutes(BuildContext context, RouteSettings settings) {
  var arguments = settings.arguments;
  switch (settings.name) {
    case AppRoutes.home:
      return Home();
    case AppRoutes.products:
      return BlocProvider.value(
          value: BlocProvider.of<ProductsBloc>(context)..add(LoadProducts()),
          child: Products());

    case AppRoutes.addProduct:
      return BlocProvider.value(
          value: BlocProvider.of<ProductsBloc>(context),
          child: AddProductScreen(isEditing: false));

    case AppRoutes.productPrices:
      final map = arguments as Map<String, dynamic> ?? {};
      final product = map['product'] as Product;
      return BlocProvider.value(
          value: BlocProvider.of<PricesBloc>(context),
          child: ProductPricesScreen(
            product: product,
          ));

    case AppRoutes.stores:
      return BlocProvider.value(
        value: BlocProvider.of<StoresBloc>(context)..add(LoadStores()),
        child: StoresScreen(),
      );

    case AppRoutes.addStore:
      return BlocProvider.value(
          value: BlocProvider.of<StoresBloc>(context), child: AddStoreScreen());

    case AppRoutes.store:
      final map = arguments as Map<String, dynamic> ?? {};
      final store = map['store'] as Store;
      return BlocProvider.value(
          value: BlocProvider.of<StoresBloc>(context),
          child: StoreDetailsScreen(store: store));

    default:
      return Home();
  }
}
