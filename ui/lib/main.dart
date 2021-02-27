import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanshop/bloc_observer.dart';
import 'package:scanshop/scanshop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // platform-specific directory where persistent app data can be stored.
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbFilename = 'scanshopbz_demo';
  final dbPath = join(appDocumentDir.path, dbFilename);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = MyBlocObserver();
  runApp(Scanshop(dbPath: dbPath));
}
