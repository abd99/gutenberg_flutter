import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gutenberg_flutter/screens/home_page.dart';
import 'constants.dart';

import 'screens/catalog_page.dart';

void main() {
  runApp(Gutenberg());
}

class Gutenberg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Gutenberg',
      theme: kAppTheme,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        CatalogPage.routeName: (context) => CatalogPage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
