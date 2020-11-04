import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutenberg_flutter/widgets/book_card.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        textTheme: Theme.of(context).textTheme,
        toolbarHeight: 175.0,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Column(
            children: [
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
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF0F0F6),
                    focusColor: Color(0xFFF0F0F6),
                    prefixIcon: SvgPicture.asset(
                      'assets/Search.svg',
                      fit: BoxFit.none,
                    ),
                    suffixIcon: SvgPicture.asset(
                      'assets/Cancel.svg',
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(200),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (114 / (162 + 45)),
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: List.generate(
          15,
          (index) => BookCard(),
        ),
      ),
    );
  }
}
