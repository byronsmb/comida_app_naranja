import 'package:comida_app_naranja/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.lexendDecaTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 49, 38, 16),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
