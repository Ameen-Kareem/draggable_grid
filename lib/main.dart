import 'package:draggable_grid/blocs/image_grid/image_grid_bloc.dart';
import 'package:draggable_grid/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageGridBloc()..add(LoadImagesEvent()),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
