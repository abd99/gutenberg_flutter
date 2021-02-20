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
    return GridTile(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            clipBehavior: Clip.antiAlias,
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
            title.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            author.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
              color: Color(0xFFA0A0A0),
            ),
          ),
        ],
      ),
    );
  }
}
