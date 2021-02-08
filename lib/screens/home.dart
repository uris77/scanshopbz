import 'package:flutter/material.dart';
import 'package:scanshop/routes.dart';
import 'package:scanshop/styles/text.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(title: const Text('Scanshopbz'));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_products(context), _stores(context)]),
    );
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
              width: MediaQuery.of(context).size.width * .75,
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  border: Border.all(color: Colors.red[500]),
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
    return Container(
      child: Image.asset(
        'assets/groceryItems.png',
      ),
    );
  }

  Widget _stores(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width * .75,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.colorBurn,
              color: Colors.white54,
              border: Border.all(color: Colors.red[500]),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Flex(direction: Axis.vertical, children: <Widget>[
            Text('Stores', style: TextStyles.xlarge),
            _storesImage(context)
          ])),
    );
  }

  Widget _storesImage(BuildContext context) {
    return Container(child: Image.asset('assets/store.png'));
  }
}
