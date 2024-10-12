import 'package:flutter/material.dart';
import 'package:sharehisab/home_page.dart';

void main() {
  runApp(const ShareHisab());
}

class ShareHisab extends StatelessWidget {
  const ShareHisab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Hisab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(35, 78, 112, 1),
          surface: const Color.fromRGBO(35, 78, 112, 1),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
