import 'package:flutter/material.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shop App",
      home: const HomePage(),
      theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 204, 1, 1),
              primary: const Color.fromRGBO(254, 204, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            prefixIconColor: Color.fromARGB(255, 117, 115, 115),
            //contentPadding: EdgeInsets.all(20)),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
