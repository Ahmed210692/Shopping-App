import 'package:flutter/material.dart';

import 'package:shop_app_flutter/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254, 206, 1, 1),
        primary: Color.fromRGBO(254, 206, 1, 1) ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold,
              fontSize:30),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        )

      ),
      home: const Homepage(),
    );
  }
}
