import 'package:assignment_app/Services/movies.dart';
import 'package:assignment_app/UI/Widgets/helper.dart';
import 'package:assignment_app/UI/Widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Widgets/error_widget.dart';

class MovieScreen extends ConsumerStatefulWidget {
  MovieScreen({Key? key, required this.controller}) : super(key: key);
  TabController? controller;
  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen>
    with AutomaticKeepAliveClientMixin<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: widget.controller, children: [
      const Center(
        child: Text('Music'),
      ),
      ref.watch(fetchMovies).when(
          data: (movies) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  HelperView(
                    text: 'POPULAR',
                    movies: movies,
                    isNew: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HelperView(
                    text: 'NEW',
                    movies: movies,
                    isNew: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HelperView(
                    text: 'TOP RATED',
                    movies: movies,
                    isNew: false,
                  ),
                ],
              ),
            );
          },
          error: (e, s) => ErrorBody(
                futureProvider: fetchMovies,
                message: 'Error! Please try again!',
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
      const Center(
        child: Text('Shows'),
      )
    ]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
