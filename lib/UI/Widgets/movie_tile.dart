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
              width: 80,
              padding: const EdgeInsets.all(8),
              child: Image.network(
                movies![index].poster!,
                fit: BoxFit.cover,
              ),
            ),
            isNew == true
                ? Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.green,
                                blurRadius: 25,
                                offset: Offset(0, 20))
                          ],
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 5),
                      child: const Text(
                        'New',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    bottom: -2,
                    right: 22.5,
                  )
                : Container()
          ]),
        ),
      ],
    );
  }
}
