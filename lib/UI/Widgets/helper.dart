import 'package:flutter/material.dart';

import 'package:assignment_app/Models/movie_model.dart';

import 'movie_tile.dart';

class HelperView extends StatelessWidget {
  final String text;
  final List<Movies> movies;
  final bool isNew;

  const HelperView({
    Key? key,
    required this.text,
    required this.movies,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieTile(
                index: index,
                movies: movies,
                isNew: isNew,
              );
            },
            itemCount: movies.length,
          ),
        ),
      ]),
    );
  }
}
