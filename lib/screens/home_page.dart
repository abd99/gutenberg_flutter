import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenberg_flutter/widgets/genre_card.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  static final routeName = '/home';

  HomePage({
    Key key,
  }) : super(key: key);

  final List<GenreCard> genreCards = List<GenreCard>.generate(
    kGenreNames.length,
    (index) => GenreCard(
      iconPath: kGenreIcons[index],
      genreName: kGenreNames[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              SvgPicture.asset(
                'assets/Pattern.svg',
                fit: BoxFit.cover,
                height: 350,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 128.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Column(
                  children: [
                    Text(
                      'Gutenberg Project',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      kAppDescription,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Column(
            children: genreCards,
          )
        ],
      ),
    );
  }
}
