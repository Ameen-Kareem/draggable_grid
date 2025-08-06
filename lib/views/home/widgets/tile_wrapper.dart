import 'package:draggable_grid/blocs/image_grid/image_grid_bloc.dart';
import 'package:draggable_grid/model/image_model.dart';
import 'package:draggable_grid/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TileWrapper extends StatelessWidget {
  final int index;

  const TileWrapper({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ImageGridBloc, ImageGridState, ImageTile?>(
      selector: (state) {
        if (state is ImageGridLoaded) {
          return state.tiles[index];
        }
        return null;
      },
      builder: (context, tile) {
        if (tile == null) return const SizedBox();

        final tileSize = MediaQuery.of(context).size.width / 3 - 12;

        return DragTarget<int>(
          onWillAcceptWithDetails: (details) {
            return details.data != index;
          },
          onAcceptWithDetails: (details) {
            final fromIndex = details.data;
            context.read<ImageGridBloc>().add(
              ReorderImageEvent(fromIndex, index),
            );
          },
          builder: (context, candidateData, rejectedData) {
            return RepaintBoundary(
              child: LongPressDraggable<int>(
                dragAnchorStrategy: childDragAnchorStrategy,
                data: index,
                feedback: ImageTileWidget(tile: tile, size: tileSize),
                childWhenDragging: Container(
                  width: tileSize,
                  height: tileSize,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: ImageTileWidget(tile: tile, size: tileSize),
              ),
            );
          },
        );
      },
    );
  }
}
