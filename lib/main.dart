import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gutenberg_flutter/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Color(0xFF5E56E7),
        primaryColor: Color(0xFF5E56E7),
        canvasColor: Color(0xFFF8F7FF),
        cardColor: Color(0xFFFFFFFF),
        appBarTheme: AppBarTheme(brightness: Brightness.light),
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            // letterSpacing: 2.5,
            color: Color(0xFF5E56E7),
          ),
          headline2: GoogleFonts.montserrat(
              fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3:
              GoogleFonts.montserrat(fontSize: 48, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.montserrat(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5:
              GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.montserrat(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.montserrat(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.montserrat(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.montserrat(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.montserrat(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.montserrat(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
