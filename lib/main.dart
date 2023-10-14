import 'package:flutter/material.dart';
import 'package:pacman/app.dart';
import 'package:pacman/util/sounds.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Sounds.initialize();
  runApp(const Application());
}