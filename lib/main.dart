import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/properties_screen.dart';
import 'screens/home_screen.dart';
import 'constants/strings.dart';


void main() {
  runApp(const ImmobilienMaklerApp());
}

class ImmobilienMaklerApp extends StatelessWidget {
  const ImmobilienMaklerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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