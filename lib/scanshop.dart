import 'package:flutter/material.dart';

class Scanshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Scanshop Bz')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                alignment: Alignment.center,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('hello'),
                    ]),
              );
            })));
  }
}
