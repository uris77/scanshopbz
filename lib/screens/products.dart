import 'package:flutter/material.dart';

class Products extends StatelessWidget {
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
    return Container(child: Text('Products'));
  }
}
