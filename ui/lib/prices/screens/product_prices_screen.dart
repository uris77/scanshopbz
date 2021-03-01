import 'package:flutter/material.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop_models/models.dart';

/// Main screen for displaying a product's prices
class ProductPricesScreen extends StatelessWidget {
  /// Constructor
  ProductPricesScreen({Key key, @required this.product}) : super(key: key);

  /// The product whose prices we are displaying.
  final Product product;

  @override
  Widget build(BuildContext context) {
    print('product: ${product.name}');
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _PricesBody(
        product: product,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(title: AppBarTitle());
  }
}

class _PricesBody extends StatelessWidget {
  _PricesBody({Key key, @required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(200, 245, 245, 247),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Center(
            child: Card(
          child: Column(
            children: [_ProductInfo(product: product)],
          ),
        )),
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  _ProductInfo({Key key, @required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.topLeft,
        child: Text.rich(TextSpan(
          text: product.name,
          style: Theme.of(context).textTheme.headline3,
          children: <InlineSpan>[
            TextSpan(
                text: ' | ${product.category.name}',
                style: Theme.of(context).textTheme.headline6),
            TextSpan(text: ' | ', style: Theme.of(context).textTheme.headline6),
            TextSpan(
                text: product.manufacturer,
                style: Theme.of(context).textTheme.headline6)
          ],
        )));
  }
}
