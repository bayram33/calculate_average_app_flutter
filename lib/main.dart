import 'package:app/my_const/myconstant.dart';
import 'package:app/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MyConstant.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
