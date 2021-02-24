import 'package:flutter/material.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/routes.dart';
import 'package:scanshop/styles/text.dart';

/// The Home Widget
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(title: AppBarTitle());
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
      if (constraints.maxWidth < 500) {
        return _narrowLayout(context);
      }
      return _wideLayout(context);
    });
  }

  Widget _wideLayout(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width / 2,
        child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _Products(
                widthScale: .02,
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 20, bottom: 20),
              ),
              _Stores(
                  widthScale: .02,
                  margin: const EdgeInsets.only(
                      top: 10, left: 10, right: 30, bottom: 20))
            ]));
  }

  Widget _narrowLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_Products(), _Stores()]),
    );
  }
}

class _Products extends StatelessWidget {
  _Products({this.widthScale = .75, this.margin = const EdgeInsets.all(10)});

  final double widthScale;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return _products(context);
  }

  Widget _products(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.products);
          },
          child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * widthScale,
              margin: margin,
              // alignment: Alignment.center,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 2),
                        blurRadius: 1)
                  ],
                  color: Colors.cyanAccent,
                  // border: Border.all(color: Colors.red[500]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Flex(direction: Axis.vertical, children: [
                Expanded(
                    child: Text(
                  'Products',
                  style: TextStyles.xlarge,
                )),
                Expanded(
                  flex: 2,
                  child: _productsImage(context),
                )
              ])),
        ));
  }

  Widget _productsImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        child: Image.asset('assets/groceryItems.png', fit: BoxFit.contain),
      ),
    );
  }
}

class _Stores extends StatelessWidget {
  _Stores(
      {this.widthScale = .75,
      this.margin = const EdgeInsets.only(top: 20, bottom: 20)});
  final double widthScale;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return _stores(context);
  }

  Widget _stores(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.stores);
        },
        child: Container(
            margin: margin,
            width: MediaQuery.of(context).size.width * widthScale,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 2),
                      blurRadius: 1)
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Flex(direction: Axis.vertical, children: <Widget>[
              Text('Stores', style: TextStyles.xlarge),
              _storesImage(context)
            ])),
      ),
    );
  }

  Widget _storesImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
          child: Image.asset('assets/store.png', fit: BoxFit.contain)),
    );
  }
}
