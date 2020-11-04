import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/old-man-and-the-sea-review.jpg',
              fit: BoxFit.fill,
              width: 114,
              height: 162,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'The old man and the sea'.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Charles Dickens',
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
