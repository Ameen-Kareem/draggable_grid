import 'package:draggable_grid/blocs/image_grid/image_grid_bloc.dart';
import 'package:draggable_grid/model/image_model.dart';
import 'package:draggable_grid/views/home/widgets/tile_wrapper.dart';
import 'package:draggable_grid/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    final bloc = context.read<ImageGridBloc>();
    bloc.stream.listen((state) {
      if (state is ImageGridLoaded && mounted) {
        _precacheImages(state.tiles);
      }
    });
  }

  void _precacheImages(List<ImageTile> tiles) {
    for (var tile in tiles) {
      precacheImage(AssetImage(tile.imagePath), context);
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width / 3 - 12;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 3 * (size + 18),
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return TileWrapper(index: index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
