import 'package:alda_front/alda_app.dart';
import 'package:alda_front/injectable/configurations.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(AlDaApp());
}
