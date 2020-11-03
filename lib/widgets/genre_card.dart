import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/catalog_page.dart';

class GenreCard extends StatelessWidget {
  final String genreName;
  final String iconPath;
  const GenreCard({
    @required this.genreName,
    @required this.iconPath,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      borderOnForeground: true,
      shadowColor: Color.fromRGBO(211, 209, 238, 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          iconPath,
          fit: BoxFit.contain,
          height: 30.0,
        ),
        title: Text(
          genreName.toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        trailing: SvgPicture.asset('assets/Next.svg'),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CatalogPage(category: genreName)),
        ),
      ),
    );
  }
}
