import 'package:assignment_app/UI/details.dart';
import 'package:flutter/material.dart';

import 'package:assignment_app/Models/movie_model.dart';

class MovieTile extends StatelessWidget {
  final int index;
  List<Movies>? movies;
  bool isNew;
  MovieTile({
    Key? key,
    required this.index,
    required this.movies,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  movies![index],
                ),
              ),
            );
          },
          child: Stack(children: [
            Container(
              width: 100,
              padding: const EdgeInsets.all(10),
              child: Image.network(
                movies![index].poster!,
                fit: BoxFit.cover,
              ),
            ),
            isNew == true
                ? const Positioned(
                    child: Text(
                      'New',
                      style: TextStyle(backgroundColor: Colors.green),
                    ),
                    bottom: 0,
                    right: 35,
                  )
                : Container()
          ]),
        ),
      ],
    );
  }
}
