import 'package:bed_availabilities/bloc/covid_bloc.dart';
import 'package:bed_availabilities/bloc/covid_states.dart';
import 'package:bed_availabilities/screen/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider<CovidBloc>(
        create: (context) => CovidBloc(
          InitialState(),
        ),
        child: const HomePage(),
      ),
    );
  }
}
