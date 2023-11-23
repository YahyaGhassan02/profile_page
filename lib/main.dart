// ignore_for_file: use_key_in_widget_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:profile_page/bloc_observer/observer.dart';
import 'layout/home_layout.dart';


void main() {

  Bloc.observer=MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home_Layout(),
    );
  }
}
