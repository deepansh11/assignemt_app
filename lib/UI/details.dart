import 'package:assignment_app/Models/movie_model.dart';
import 'package:assignment_app/Services/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'Widgets/error_widget.dart';

class DetailsPage extends ConsumerWidget {
  final Movies movies;

  const DetailsPage(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'Details page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: ref.watch(fetchMovies).when(
          data: (movie) {
            return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movies.poster!),
                  ),
                ),
                child: SlidingUpPanel(
                    minHeight: 120,
                    color: Colors.black.withOpacity(0.5),
                    panel: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            movies.title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            movies.year!,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    )));
          },
          error: (e, s) {
            return ErrorBody(
                futureProvider: fetchMovies, message: 'Error please try again');
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
