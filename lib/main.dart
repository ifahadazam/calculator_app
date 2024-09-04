//import 'package:calculator/calculator.dart';
import 'package:calculator/models/cal_provider.dart';
import 'package:calculator/widgets/intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => CalProvider(),
    child: MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Intro(),
    ),
  ));
}
