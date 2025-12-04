import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:immobilien_makler_web/screens/about_screen.dart';
import 'package:immobilien_makler_web/screens/contact_screen.dart';
import 'package:immobilien_makler_web/screens/properties_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ImmobilienMaklerApp());
}

class ImmobilienMaklerApp extends StatelessWidget {
  const ImmobilienMaklerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Immobilien Müller - Ihr Makler in München',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: HomeScreen(),
      routes: {
        '/immobilien': (context) => const PropertiesScreen(),
        '/ueber-uns': (context) => const AboutScreen(),
        '/kontakt': (context) => const ContactScreen(),
      },
    );
  }
}