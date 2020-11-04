import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imgURL;
  const BookCard({
    Key key,
    this.title,
    this.author,
    this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imgURL,
            fit: BoxFit.fill,
            width: 114,
            height: 162,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title.length > 30
              ? '${title.substring(0, 29).toUpperCase()}...'
              : title.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          author.length > 25
              ? '${author.substring(0, 24).toUpperCase()}...'
              : author.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            // fontWeight: FontWeight.w100,
            color: Color(0xFFA0A0A0),
          ),
        ),
      ],
    );
  }
}
