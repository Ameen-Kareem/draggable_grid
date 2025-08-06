import 'package:draggable_grid/model/image_model.dart';
import 'package:flutter/material.dart';

class ImageTileWidget extends StatelessWidget {
  final ImageTile tile;
  final double size;

  const ImageTileWidget({required this.tile, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: ResizeImage(
            AssetImage(tile.imagePath),
            width: size.toInt(),
            height: size.toInt(),
          ),
        ),
      ),
      height: size,
      width: size,
    );
  }
}
