import 'package:flutter/material.dart';
import 'package:gutenberg_flutter/screens/home_page.dart';
import 'constants.dart';

import 'screens/catalog_page.dart';

void main() {
  runApp(Gutenberg());
}

class Gutenberg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
