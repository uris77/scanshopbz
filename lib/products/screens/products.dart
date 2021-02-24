import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/routes.dart';
import 'package:scanshop/styles/text.dart';
import 'package:scanshop_models/models.dart';

/// The Widget for displaying Products
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(title: AppBarTitle(), actions: [
      _addButtonAppBar(context),
    ]);
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      print('state: $state');
      if (state is ProductsLoadInProgress) {
        return const CircularProgressIndicator();
      } else if (state is ProductsLoadSuccess) {
        return _successWidget(context, state.products);
      } else {
        return Container(child: const Text('Error'));
      }
    });
  }

  Widget _successWidget(BuildContext context, List<Product> products) {
    if (products.isEmpty) {
      return _emptyList(context);
    }
    return _productsList(context, products);
  }

  Widget _productsList(BuildContext context, List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext ctx, int index) {
        var product = products[index];
        return Container(
            alignment: Alignment.center, child: _productItem(ctx, product));
      },
    );
  }

  Widget _productItem(BuildContext context, Product product) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Card(
            elevation: 12,
            child: ListTile(
              title: Text(product.name, style: TextStyles.title),
              subtitle:
                  Text('${product.manufacturer} | ${product.category.name}'),
            )));
  }

  Widget _emptyList(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 60),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Add a product', style: TextStyles.large),
              _addButton(context),
            ]));
  }

  Widget _addButtonAppBar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.addProduct);
            },
            child: Icon(Icons.add, size: 50)));
  }

  Widget _addButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.addProduct);
            },
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Theme.of(context).accentColor,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(50))),
                child: const Icon(Icons.add, size: 50))));
  }
}
