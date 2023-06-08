import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqqu/controller/app_controller.dart';
import 'package:roqqu/views/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: ChangeNotifierProvider(
        create: (_) => AppController(), child: const HomeScreen()),
  ));
}
