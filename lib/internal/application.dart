import 'package:clean_arhitecture_example_app/internal/dependencies/home_module.dart';
import 'package:clean_arhitecture_example_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Arhitecture App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => HomeModule.homeBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
