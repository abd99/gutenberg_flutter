import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatalogPage extends StatefulWidget {
  static final routeName = '/catalog';

  final category;

  const CatalogPage({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 48.0),
                    ListTile(
                      leading: SvgPicture.asset('assets/Back.svg'),
                      title: Text(
                        widget.category,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF0F0F6),
                          focusColor: Color(0xFFF0F0F6),
                          prefixIcon: SvgPicture.asset(
                            'assets/Search.svg',
                            fit: BoxFit.contain,
                            height: 45.0,
                            width: 45.0,
                          ),
                          suffixIcon: SvgPicture.asset(
                            'assets/Cancel.svg',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
