// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeNotifier(this._themeMode);

  ThemeMode getThemeMode() => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
  }
}

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  ThemeData get darkTheme => ThemeData(
        textSelectionColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontWeight: FontWeight.bold))),
        ),
        textTheme: const TextTheme(
            headline6: TextStyle(color: Colors.white),
            caption: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.white),
            brightness: Brightness.dark,
            color: Colors.black),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        canvasColor: Colors.black,
        accentColor: Colors.pink,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.pink.shade300),
        accentIconTheme: const IconThemeData(color: Colors.pink),
      );
}
