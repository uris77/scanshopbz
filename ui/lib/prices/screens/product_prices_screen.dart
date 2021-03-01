import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/prices/bloc/prices_bloc.dart';
import 'package:scanshop/styles/text.dart';
import 'package:scanshop_models/models.dart';

/// Main screen for displaying a product's prices
class ProductPricesScreen extends StatelessWidget {
  /// Constructor
  ProductPricesScreen({Key key, @required this.product}) : super(key: key);

  /// The product whose prices we are displaying.
  final Product product;

  @override
  Widget build(BuildContext context) {
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
    return BlocConsumer<PricesBloc, PricesState>(listener: (context, state) {
      print('state: $state');
    }, builder: (context, state) {
      if (state is PricesLoadInProgress) {
        return Container(
            child: Center(
                child: SizedBox(
          width: MediaQuery.of(context).size.width * .3,
          height: MediaQuery.of(context).size.height * .2,
          child: const CircularProgressIndicator(
            strokeWidth: 12,
            backgroundColor: Colors.teal,
          ),
        )));
      } else if (state is PricesLoadSuccess) {
        return Container(
          width: double.infinity,
          color: const Color.fromARGB(200, 245, 245, 247),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Center(
                child: Card(
              child: Column(
                children: [_ProductInfo(product: product)],
              ),
            )),
          ),
        );
      }
      return Container(child: const Center(child: Text('Error')));
    });
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
          style: TextStyles.medium,
          children: <InlineSpan>[
            TextSpan(
                text: ' | ${product.category.name}', style: TextStyles.small),
            TextSpan(text: ' | ', style: Theme.of(context).textTheme.bodyText2),
            TextSpan(text: product.manufacturer, style: TextStyles.small)
          ],
        )));
  }
}
