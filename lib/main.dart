import 'package:dolist/pages/category.dart';
import 'package:dolist/pages/create_category.dart';
import 'package:dolist/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:dolist/theme/app_colors.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('categories');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        fontFamily: "Inter"
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/category': (context) => Category(),
        '/category/create': (context) => CreateCategory(),
      },
    );
  }
}