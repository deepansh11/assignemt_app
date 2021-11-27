import 'package:assignment_app/Models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ErrorBody extends ConsumerWidget {
  AutoDisposeFutureProvider<List<Movies>> futureProvider;

  ErrorBody({
    Key? key,
    required this.futureProvider,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context, watch) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () async {
              watch.refresh(futureProvider);
            },
            child: const Text("Try again"),
          ),
        ],
      ),
    );
  }
}
