import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/bloc_observer.dart';
import 'package:scanshop/repositories/dbpath_generator.dart';
import 'package:scanshop/repositories/id_generator.dart';
import 'package:scanshop/scanshop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbFilename = 'scanshopbz_dev';
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = MyBlocObserver();

  /// The unique id Generator
  final idGenerator = IdGenerator();

  /// Generates the path where the database is stored.
  final dbpathGenerator = DbpathGenerator(dbFilename);
  runApp(Scanshop(idGenerator: idGenerator, dbpathGenerator: dbpathGenerator));
}
