import 'package:assignment_app/Models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieProvider = Provider<Movie>((ref) => Movie(Dio()));

final fetchMovies = FutureProvider.autoDispose<List<Movies>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.watch(movieProvider);
  final movies = await movieService.getMovies();

  return movies;
});

class Movie {
  final Dio _dio;

  Movie(this._dio);
  get function => null;

  Future<List<Movies>> getMovies() async {
    final apiData = await _dio
        .get('http://www.omdbapi.com/?i=tt3896198&apikey=c4033450&s=Movies');

    final results = List<Map<String, dynamic>>.from(apiData.data['Search']);

    List<Movies> movies =
        results.map((movieData) => Movies.fromJson(movieData)).toList();

    return movies;
  }
}
