import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/styles/text.dart';
import 'package:scanshop_models/models.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(title: const Text('Scanshopbz'), actions: [
      Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
              onTap: () {
                print('Tapped');
              },
              child: Icon(Icons.add, size: 50)))
    ]);
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      print('state: $state');
      if (state is ProductsLoadInProgress) {
        return CircularProgressIndicator();
      } else if (state is ProductsLoadSuccess) {
        return _successWidget(context, state.products);
      } else {
        return Container(child: Text('Error'));
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
    return Container(child: Text('Products'));
  }

  Widget _emptyList(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 60),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('No Products', style: TextStyles.xlarge),
              Text('Add a product', style: TextStyles.large),
              _addButton(context),
            ]));
  }

  Widget _addButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
            onTap: () {
              print('Tapped');
            },
            child: Icon(Icons.add, size: 50)));
  }
}
