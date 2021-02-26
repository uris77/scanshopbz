import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scanshop/scanshop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Scanshop());
}
